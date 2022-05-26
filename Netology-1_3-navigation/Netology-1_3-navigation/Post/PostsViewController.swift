//
//  PostViewController.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 25.05.2022.
//

import UIKit

class PostsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        layout()
        setupGestures()
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(picView)
        scrollView.addSubview(authorLable)
        scrollView.addSubview(desriptionTitle)
        scrollView.addSubview(viewsLable)
        
        scrollView.addSubview(viewView)
        viewView.addSubview(viewImage)
        viewView.addSubview(viewsLable)
        
        scrollView.addSubview(likeView)
        likeView.addSubview(likeImage)
        likeView.addSubview(likesLable)
//        view.addGestureRecognizer(tapAction)
        

        
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
            
        ])
        
        NSLayoutConstraint.activate([
            likeView.topAnchor.constraint(equalTo: desriptionTitle.bottomAnchor, constant: viewInset),
            likeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -viewInset),
            likeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewInset),
            likeView.widthAnchor.constraint(equalToConstant: view.bounds.width/10),
        ])
        
        NSLayoutConstraint.activate([
            likeImage.topAnchor.constraint(equalTo: likeView.topAnchor, constant: 2),
            likeImage.leadingAnchor.constraint(equalTo: likeView.leadingAnchor, constant: 2),
            likeImage.trailingAnchor.constraint(equalTo: likeView.trailingAnchor, constant: -2),
            likeImage.heightAnchor.constraint(equalTo: likeImage.widthAnchor),
            
            likesLable.topAnchor.constraint(equalTo: likeImage.bottomAnchor),
            likesLable.leadingAnchor.constraint(equalTo: likeView.leadingAnchor),
            likesLable.trailingAnchor.constraint(equalTo: likeView.trailingAnchor),
            likesLable.bottomAnchor.constraint(equalTo: likeView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            viewView.topAnchor.constraint(equalTo: desriptionTitle.bottomAnchor, constant: viewInset),
            viewView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -viewInset),
            viewView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -viewInset),
            viewView.widthAnchor.constraint(equalToConstant: view.bounds.width/10)
        ])
        
        NSLayoutConstraint.activate([
            viewImage.topAnchor.constraint(equalTo: viewView.topAnchor, constant: 2),
            viewImage.leadingAnchor.constraint(equalTo: viewView.leadingAnchor, constant: 2),
            viewImage.trailingAnchor.constraint(equalTo: viewView.trailingAnchor, constant: -2),
            viewImage.heightAnchor.constraint(equalTo: viewImage.widthAnchor),
            
            viewsLable.topAnchor.constraint(equalTo: viewImage.bottomAnchor),
            viewsLable.leadingAnchor.constraint(equalTo: viewView.leadingAnchor),
            viewsLable.trailingAnchor.constraint(equalTo: viewView.trailingAnchor),
            viewsLable.bottomAnchor.constraint(equalTo: viewView.bottomAnchor)
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
//        desription.numberOfLines = 4
        desription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                desription.numberOfLines = 0
        return desription
    }()
    
    private let likeView: UIView = {
        let like = UIView()
        like.translatesAutoresizingMaskIntoConstraints = false
        let status = false
        return like
    }()
    
    
    private let likeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "like black")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0.7
        return image
    }()
    
    private let likesLable: UILabel = {
        let like = UILabel()
        like.translatesAutoresizingMaskIntoConstraints = false
        like.textColor = .black
        like.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        like.textAlignment = .center
        return like
    }()
    
    private let viewView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let viewImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "view")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0.8
        return image
    }()
    
    let viewsLable: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.textColor = .black
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textAlignment = .center
        return views
    }()
    
    func setupVC(post: Post) {
        picView.image = UIImage(named: post.image, in: nil, with: .none)
        authorLable.text = post.author
        desriptionTitle.text = post.description
        likesLable.text = "\(post.likes)"
        viewsLable.text = "\(post.views)"
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        likeView.isUserInteractionEnabled = true
        likeView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        
        if self.likeImage.image == UIImage(named: "like black") {
            
            
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                self.likeImage.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.likeImage.alpha = 1
                self.likesLable.alpha = 0
                self.likeImage.image = UIImage(named: "like red")
                self.likesLable.text = String(Int(self.likesLable.text!)! + 1)
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) {
                    self.likeImage.transform = CGAffineTransform(scaleX: 1, y: 1)
//                    self.likeImage.alpha = 0.5
                    self.likesLable.alpha = 1
                }
            }
        } else if self.likeImage.image == UIImage(named: "like red") {
            
            
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                self.likeImage.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.likeImage.alpha = 1
                self.likesLable.alpha = 0
                self.likeImage.image = UIImage(named: "like black")
                self.likesLable.text = String(Int(self.likesLable.text!)! - 1)
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) {
                    self.likeImage.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.likeImage.alpha = 0.5
                    self.likesLable.alpha = 1
                }
            }
        }
        
        
    }
    
}
