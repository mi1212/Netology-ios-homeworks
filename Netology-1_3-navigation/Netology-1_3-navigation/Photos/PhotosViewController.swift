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
        setupAnimationView()
        arrowGestures()
    }
    
    private var array: [Int] {
        var array = [Int]()
        for element in 0...20 {
            array.append(element)
        }
        return array
    }
    
    // MARK: - view for animation
    
    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = UIScreen.main.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0
        
        return blurEffectView
    }()
    
    private lazy var arrowView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cross", in: nil, with: .none)
        image.layer.opacity = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let photoView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        image.sizeToFit()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.layer.opacity = 0.1
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
    
    private func setupAnimationView() {
        view.addSubview(blurView)
        view.addSubview(arrowView)
        self.view.addSubview(self.photoView)
        
        NSLayoutConstraint.activate([
            photoView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            photoView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            photoView.heightAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.arrowView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.arrowView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.arrowView.heightAnchor.constraint(equalToConstant: 24),
            self.arrowView.widthAnchor.constraint(equalTo: self.arrowView.heightAnchor)
        ])
    }
    
    private func arrowGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        arrowView.isUserInteractionEnabled = true
        arrowView.addGestureRecognizer(tapGesture)
        print("arrowTap")
    }
    
    @objc private func tapAction() {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.arrowView.layer.opacity = 0
        } completion: { _ in
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) {
                self.blurView.layer.opacity = 0
                self.photoView.layer.opacity = 0
            }
        }
    }
    
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseInOut) {
                self.blurView.layer.opacity = 1
                
                self.photoView.image = UIImage(named:("chehovphoto_" + String(Int(indexPath.row) + 1)), in: nil, with: .none)
                self.photoView.layer.opacity = 1
                
            } completion: { _ in
                
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
                    self.arrowView.layer.opacity = 1
                } completion: { _ in
                }
            }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
            self.blurView.layer.opacity = 1
        } completion: { _ in
            self.arrowView.layer.opacity = 1
        }
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
