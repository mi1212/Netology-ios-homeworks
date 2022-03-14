//
//  ProfileHeaderView.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 11.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(showStatusButton)
        self.addSubview(profileImage)
        self.addSubview(lable)
        self.activateConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPurple
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 1
        button.layer.masksToBounds = false
        return button
    }()

    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Image", in: nil, with: .none)
        image.sizeToFit()
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var lable: UILabel = {
        let lable = UILabel()
        lable.text = "A.P.Chekhov"
        lable.textColor = .black
        lable.font.withSize(18)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    private func activateConstraints() {
        self.profileImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        self.profileImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.showStatusButton.topAnchor.constraint(equalTo: self.profileImage.bottomAnchor, constant: 16).isActive = true
        self.showStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.showStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        self.showStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.lable.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        self.lable.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
