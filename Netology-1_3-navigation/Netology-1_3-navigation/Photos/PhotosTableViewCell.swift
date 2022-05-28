//
//  PhotosTableViewCell.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 02.05.2022.
//

import UIKit

protocol PhotosTableViewCellDelegate: AnyObject {
    func buttonPressed()
}

class PhotosTableViewCell: UITableViewCell {
    
    weak var delegate: PhotosTableViewCellDelegate?


    //MARK: - UIView

    private let lable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Photos"
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return lable
    }()

    private let arrow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow", in: nil, with: .none)
        image.sizeToFit()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var photoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifire)
        return collection
    }()


    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapTransitionButton), for: .touchUpInside)
        return button
    }()

    //MARK: - UIStack

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "photoscell")
        self.layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        contentView.addSubview(lable)

        contentView.addSubview(arrow)
        contentView.addSubview(button)
        contentView.addSubview(photoCollection)

        
        let insetLayot: CGFloat = 16
        let height: CGFloat = (UIScreen.main.bounds.width - inset * 3 ) / 4

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: arrow.topAnchor),
            button.trailingAnchor.constraint(equalTo: arrow.trailingAnchor),
            button.leadingAnchor.constraint(equalTo: arrow.leadingAnchor),
            button.bottomAnchor.constraint(equalTo: arrow.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: insetLayot),
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insetLayot),
        ])

        NSLayoutConstraint.activate([
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -insetLayot),
            arrow.centerYAnchor.constraint(equalTo: lable.centerYAnchor),
            arrow.heightAnchor.constraint(equalToConstant: 24),
            arrow.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            photoCollection.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: insetLayot),
            photoCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insetLayot),
            photoCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -insetLayot),
            photoCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -insetLayot),
            photoCollection.heightAnchor.constraint(equalToConstant: height)
            
        ])
    }

        //MARK: - func
    
    @objc private func didTapTransitionButton() {
        delegate?.buttonPressed()
    }
    

}



// MARK: - extensions

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoCollection.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as! PhotosCollectionViewCell
        cell.setupPhotoCell(photo: photosNameArray[indexPath.row])
        return cell
    }
    
    
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    private var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 3 ) / 4
        
        return CGSize(width: width, height: width)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}
