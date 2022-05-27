//
//  CustomTableViewCell.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 30.04.2022.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func increaseLikes(likes: Int, isLiked: Bool)
}


class CustomTableViewCell: UITableViewCell, PostsViewControllerDelegate{
    func increaseViews(views: Int) {
        self.viewsLable.text = String(views)
        print("Custom \(views)")
    }
    

    weak var delegate: CustomTableViewCellDelegate?
    
    // MARK: - UIView
    
    private let cellView: UIView = {
        let cell = UIView()
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.backgroundColor = .white
        return cell
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
        desription.numberOfLines = 4
        desription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return desription
    }()
    
    let likeView: UIView = {
        let like = UIView()
        like.translatesAutoresizingMaskIntoConstraints = false
        let status = false
        return like
    }()
    
    
    let likeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "like black")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0.7
        return image
    }()
    
    let likesLable: UILabel = {
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
        return views
    }()
    var isLiked : Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layout()
        self.setupGestures()
        ProfileViewController().delegate? = self
        PostsViewController().delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(post: Post, indexPath: IndexPath) {
        picView.image = UIImage(named: post.image, in: nil, with: .none)
        authorLable.text = post.author
        desriptionTitle.text = post.description
        likesLable.text = "\(ProfileViewController.likesArray[indexPath.row - 1])"
        viewsLable.text = "\(ProfileViewController.viewsArray[indexPath.row - 1])"
        isLiked = ProfileViewController.isLikedArray[indexPath.row - 1]
        
        if isLiked == false {
            likeImage.image = UIImage(named: "like black")
        } else {
            likeImage.image = UIImage(named: "like red")
        }
        
    }
    
    private func layout() {
        contentView.addSubview(picView)
        contentView.addSubview(authorLable)
        contentView.addSubview(desriptionTitle)
        contentView.addSubview(viewsLable)
        
        contentView.addSubview(viewView)
        viewView.addSubview(viewImage)
        viewView.addSubview(viewsLable)
        
        contentView.addSubview(likeView)
        likeView.addSubview(likeImage)
        likeView.addSubview(likesLable)
        

        
        let viewInset: CGFloat = 16
        let imageInset: CGFloat = 5
        
        NSLayoutConstraint.activate([
            authorLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
            authorLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            authorLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            authorLable.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            picView.topAnchor.constraint(equalTo: authorLable.bottomAnchor, constant: viewInset),
            picView.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor),
            picView.heightAnchor.constraint(equalTo: picView.widthAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            desriptionTitle.topAnchor.constraint(equalTo: self.picView.bottomAnchor, constant: viewInset),
            desriptionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            desriptionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            
        ])
        
        NSLayoutConstraint.activate([
            likeView.topAnchor.constraint(equalTo: desriptionTitle.bottomAnchor, constant: viewInset),
            likeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
            likeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            likeView.widthAnchor.constraint(equalToConstant: self.bounds.width/10),
        ])
        
        NSLayoutConstraint.activate([
            likeImage.topAnchor.constraint(equalTo: likeView.topAnchor, constant: imageInset),
            likeImage.leadingAnchor.constraint(equalTo: likeView.leadingAnchor, constant: imageInset),
            likeImage.trailingAnchor.constraint(equalTo: likeView.trailingAnchor, constant: -imageInset),
            likeImage.heightAnchor.constraint(equalTo: likeImage.widthAnchor),
            
            likesLable.topAnchor.constraint(equalTo: likeImage.bottomAnchor),
            likesLable.leadingAnchor.constraint(equalTo: likeView.leadingAnchor),
            likesLable.trailingAnchor.constraint(equalTo: likeView.trailingAnchor),
            likesLable.bottomAnchor.constraint(equalTo: likeView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            viewView.topAnchor.constraint(equalTo: desriptionTitle.bottomAnchor, constant: viewInset),
            viewView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
            viewView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            viewView.widthAnchor.constraint(equalToConstant: self.bounds.width/10)
        ])
        
        NSLayoutConstraint.activate([
            viewImage.topAnchor.constraint(equalTo: viewView.topAnchor, constant: imageInset),
            viewImage.leadingAnchor.constraint(equalTo: viewView.leadingAnchor, constant: imageInset),
            viewImage.trailingAnchor.constraint(equalTo: viewView.trailingAnchor, constant: -imageInset),
            viewImage.heightAnchor.constraint(equalTo: viewImage.widthAnchor),
            
            viewsLable.topAnchor.constraint(equalTo: viewImage.bottomAnchor),
            viewsLable.leadingAnchor.constraint(equalTo: viewView.leadingAnchor),
            viewsLable.trailingAnchor.constraint(equalTo: viewView.trailingAnchor),
            viewsLable.bottomAnchor.constraint(equalTo: viewView.bottomAnchor)
        ])
        
    }
    
    private lazy var tap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: nil, action: #selector(UIInputViewController.dismissKeyboard))
        return tap
    }()
    
    @objc func dismissKeyboard() {
        contentView.endEditing(true)
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        likeView.isUserInteractionEnabled = true
        likeView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {

        if isLiked == false {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                self.likeImage.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.likeImage.alpha = 1
                self.likesLable.alpha = 0
                self.likeImage.image = UIImage(named: "like red")
                self.likesLable.text = String(Int(self.likesLable.text!)! + 1)
                self.delegate?.increaseLikes(likes: Int(self.likesLable.text!)! + 1, isLiked: true)
                self.isLiked = true
                print("\(Int(self.likesLable.text!)! + 1)")
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) {
                    self.likeImage.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.likeImage.alpha = 0.5
                    self.likesLable.alpha = 1
                    self.likeImage.alpha = 0.8
                }
            }
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                self.likeImage.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.likeImage.alpha = 1
                self.likesLable.alpha = 0
                self.likeImage.image = UIImage(named: "like black")
                self.likesLable.text = String(Int(self.likesLable.text!)! - 1)
                self.delegate?.increaseLikes(likes: Int(self.likesLable.text!)! + 1, isLiked: false)
                self.isLiked = false
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) {
                    self.likeImage.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.likeImage.alpha = 0.8
                    self.likesLable.alpha = 1
                }
            }
        }
    }
}

extension CustomTableViewCell: ProfileViewControllerDelegate {
    func increaseViews() {
        print("CustomCell delegate")
    }
    
    
}



