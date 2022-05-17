//
//  CustomTableViewCell.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 30.04.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

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
        //        lable.backgroundColor = .lightGray
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

    private let likesLable: UILabel = {
        let like = UILabel()
        like.translatesAutoresizingMaskIntoConstraints = false
        like.textColor = .black
        like.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return like
    }()

    private let viewsLable: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.textColor = .black
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return views
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(post: Post) {
        picView.image = UIImage(named: post.image, in: nil, with: .none)
        authorLable.text = post.author
        desriptionTitle.text = post.description
        likesLable.text = "Likes = \(post.likes)"
        viewsLable.text = "Views = \(post.views)"
    }

    private func layout() {
        [picView, authorLable, desriptionTitle, likesLable, viewsLable].forEach{contentView.addSubview($0)}

        let viewInset: CGFloat = 16

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
            likesLable.topAnchor.constraint(equalTo: desriptionTitle.bottomAnchor, constant: viewInset),
            likesLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
            likesLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset)
        ])

        NSLayoutConstraint.activate([
            viewsLable.topAnchor.constraint(equalTo: desriptionTitle.bottomAnchor, constant: viewInset),
            viewsLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
            viewsLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset)
        ])

        NSLayoutConstraint.activate([
            desriptionTitle.topAnchor.constraint(equalTo: self.picView.bottomAnchor, constant: viewInset),
            desriptionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            desriptionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),

        ])
    }


}
