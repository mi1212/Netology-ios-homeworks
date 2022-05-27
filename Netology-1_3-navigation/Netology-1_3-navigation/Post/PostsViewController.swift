//
//  PostViewController.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 25.05.2022.
//

import UIKit

protocol PostsViewControllerDelegate: AnyObject {
    func increaseViews(views: Int)
//    func increaseLikes(likes: Int)
}

class PostsViewController: UIViewController {
    
    weak var delegate: PostsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        layout()
//        setupGestures()
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(picView)
        scrollView.addSubview(authorLable)
        scrollView.addSubview(desriptionTitle)
        
        let viewInset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            authorLable.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: viewInset),
            authorLable.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: viewInset),
            authorLable.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -viewInset),
            authorLable.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            picView.topAnchor.constraint(equalTo: authorLable.bottomAnchor, constant: viewInset),
            picView.widthAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.widthAnchor),
            picView.heightAnchor.constraint(equalTo: picView.widthAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            desriptionTitle.topAnchor.constraint(equalTo: self.picView.bottomAnchor, constant: viewInset),
            desriptionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewInset),
            desriptionTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -viewInset),
            desriptionTitle.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -viewInset)
            
        ])
         
    }
    
    
    // MARK: - UIView
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let authorLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 2
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lable
    }()
    
    private let picView: UIImageView = {
        let cellImage = UIImageView()
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.contentMode = .scaleAspectFit
        cellImage.backgroundColor = .black
        return cellImage
    }()
    
    private let desriptionTitle: UILabel = {
        let desription = UILabel()
        desription.translatesAutoresizingMaskIntoConstraints = false
        desription.textColor = .systemGray
        desription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        desription.numberOfLines = 0
        return desription
    }()
    
    var views = 0
    
//
    
    func setupVC(post: Post, indexPath: IndexPath) {
        picView.image = UIImage(named: "\(post.image)")
        authorLable.text = post.author
        desriptionTitle.text = post.description
        views = post.views
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.increaseViews(views: views)
    }
}


































//        if self.likeImage.image == UIImage(named: "like black") {
//                    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
//                        self.likeImage.transform = CGAffineTransform(scaleX: 2, y: 2)
//                        self.likeImage.alpha = 1
//                        self.likesLable.alpha = 0
//                self.likeImage.image = UIImage(named: "like red")
//                        self.likesLable.text = String(Int(self.likesLable.text!)! + 1)
//                        self.delegate?.increaseLikes(likes: Int(self.likesLable.text!)!)
//                        print("likes in animation\(self.likesLable.text)")
//                    } completion: { _ in
//                        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) {
//                            self.likeImage.transform = CGAffineTransform(scaleX: 1, y: 1)
//                    self.likeImage.alpha = 0.5
//                            self.likesLable.alpha = 1
//                            self.likeImage.alpha = 0.8
//    }
//}
//        } else if self.likeImage.image == UIImage(named: "like red") {
//
//
//
//            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
//                self.likeImage.transform = CGAffineTransform(scaleX: 2, y: 2)
//                self.likeImage.alpha = 1
//                self.likesLable.alpha = 0
//                self.likeImage.image = UIImage(named: "like black")
//                self.likesLable.text = String(Int(self.likesLable.text!)! - 1)
//            } completion: { _ in
//                UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) {
//                    self.likeImage.transform = CGAffineTransform(scaleX: 1, y: 1)
//                    self.likeImage.alpha = 0.5
//                    self.likesLable.alpha = 1
//                }
//            }
//        }
