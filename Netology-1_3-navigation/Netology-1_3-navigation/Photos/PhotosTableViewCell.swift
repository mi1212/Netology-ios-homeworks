//
//  PhotosTableViewCell.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 02.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {


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

    private let photoCell1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "chehovphoto_1", in: nil, with: .none)
        image.sizeToFit()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()


    private let photoCell2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "chehovphoto_2", in: nil, with: .none)

        image.sizeToFit()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let photoCell3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "chehovphoto_3", in: nil, with: .none)
        image.sizeToFit()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let photoCell4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "chehovphoto_4", in: nil, with: .none)
        image.sizeToFit()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

//    private lazy var button: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .systemBlue
//        button.translatesAutoresizingMaskIntoConstraints = false
////        button.backgroundColor = .yellow
////        button.addTarget(self, action: #selector(didTapStatusButton), for: .touchUpInside)
//        return button
//    }()

    //MARK: - UIStack

    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "photoscell")
        self.layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStack() {
        for item in 0...3 {
            print("\(item)")
        }
    }

    private func layout() {
        contentView.addSubview(lable)
        contentView.addSubview(stack)
        contentView.addSubview(arrow)
//        contentView.addSubview(button)
        stack.addArrangedSubview(photoCell1)
        stack.addArrangedSubview(photoCell2)
        stack.addArrangedSubview(photoCell3)
        stack.addArrangedSubview(photoCell4)

//        NSLayoutConstraint.activate([
//            button.topAnchor.constraint(equalTo: contentView.topAnchor),
//            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//        ])


        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        ])

        NSLayoutConstraint.activate([
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrow.centerYAnchor.constraint(equalTo: lable.centerYAnchor),
            arrow.heightAnchor.constraint(equalToConstant: 24),
            arrow.widthAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 12),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])

        NSLayoutConstraint.activate([
            photoCell1.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4 ),
            photoCell1.widthAnchor.constraint(equalTo: photoCell1.heightAnchor, multiplier: 1)
        ])

        NSLayoutConstraint.activate([
            photoCell2.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4 ),
            photoCell2.widthAnchor.constraint(equalTo: photoCell2.heightAnchor, multiplier: 1)
        ])

        NSLayoutConstraint.activate([
            photoCell3.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4 ),
            photoCell3.widthAnchor.constraint(equalTo: photoCell3.heightAnchor, multiplier: 1)
        ])

        NSLayoutConstraint.activate([
            photoCell4.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4 ),
            photoCell4.widthAnchor.constraint(equalTo: photoCell4.heightAnchor, multiplier: 1)
        ])


    }

        //MARK: - func

//    @objc private func didTapTransitionButton() {
//        let secondVC = ProfileViewController()
//        UINavigationController.pushViewController(secondVC)
//    }

    

}
