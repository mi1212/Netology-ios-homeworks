//
//  PhotosViewController.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 02.05.2022.
//

import UIKit

protocol PhotosViewControllerDelegate: AnyObject {
    func tapCell()
}

class PhotosViewController: UIViewController {

    weak var delegate: PhotosViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupCollection()
        setup()
        
    }
    
    private var array: [Int] {
        var array = [Int]()
        for element in 0...20 {
            array.append(element)
        }
        return array
    }
    
    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = UIScreen.main.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0

        return blurEffectView
    }()

    private lazy var crossView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cross", in: nil, with: .none)
        image.layer.opacity = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private func setupCollection() {
        view.addSubview(photoCollection)

        NSLayoutConstraint.activate([
            photoCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setup() {
        view.addSubview(blurView)
        view.addSubview(crossView)
        
        NSLayoutConstraint.activate([
            self.crossView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            self.crossView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            self.crossView.heightAnchor.constraint(equalToConstant: 24),
            self.crossView.widthAnchor.constraint(equalTo: self.crossView.heightAnchor)
        ])
    }
    
//    private func setupGestures() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
//        cell.isUserInteractionEnabled = true
//        cell.addGestureRecognizer(tapGesture)
//    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false // установка navigationBar во время появления вью
        self.title = "Photo Galary"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true // удаление navigationBar во время исчезновения вью
    }
    

    //MARK: - UIViews
    
    private lazy var photoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifire)
        return collection
    }()

}

// MARK: - extensions

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoCollection.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as! PhotosCollectionViewCell
        cell.setupPhotoCell(photo: photosNameArray[indexPath.row])
        return cell
    }
    
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4 ) / 3
        
        return CGSize(width: width, height: width)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
