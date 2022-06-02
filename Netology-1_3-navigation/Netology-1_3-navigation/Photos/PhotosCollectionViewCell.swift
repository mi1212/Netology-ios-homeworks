//
//  PhotosCollectionViewCell.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 15.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutPhotoCell()
//        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        photoView.isUserInteractionEnabled = true
        photoView.addGestureRecognizer(tapGesture)
    }

    @objc private func tapAction() {
        
        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: .curveEaseInOut) {
                self.photoView.layer.opacity = 0.4
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) {
                    self.photoView.layer.opacity = 1
                } completion: { _ in
                }
            }
    }
    
    
    private let photoView: UIImageView = {
        let cellImage = UIImageView()
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.sizeToFit()
        cellImage.contentMode = .scaleAspectFill
        cellImage.layer.cornerRadius = 6
        cellImage.clipsToBounds = true
        return cellImage
    }()
    
    var photoName: String?

    func setupPhotoCell(photo: Photo) {
        photoView.image = UIImage(named: photo.name, in: nil, with: .none)
        photoName = photo.name
    }
    
    private func layoutPhotoCell() {
        contentView.layer.cornerRadius = 6
        contentView.addSubview(photoView)
        
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

extension PhotosCollectionViewCell: PhotosViewControllerDelegate {
    func tapCell() {
        
    }
    
    
}
