//
//  ProfileTableHederView.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 30.04.2022.
//

import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
        drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func drawSelf() {
        
        self.addSubview(self.stackView)
        self.addSubview(self.showStatusButton)
        self.addSubview(self.statusTextField)
        self.addSubview(self.profileImage)
        self.addSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.nameLable)
        self.labelsStackView.addArrangedSubview(self.statusLable)
        if ProfileViewController.status != "" {
            statusLable.text = ProfileViewController.status
        }
        
        NSLayoutConstraint.activate([
            self.profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.profileImage.heightAnchor.constraint(equalToConstant: self.profileImage.frame.height),
            self.profileImage.widthAnchor.constraint(equalToConstant: self.profileImage.frame.width)
        ])
        
        NSLayoutConstraint.activate([
            self.labelsStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            self.labelsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.labelsStackView.leadingAnchor.constraint(equalTo: self.profileImage.trailingAnchor, constant: 16),
            self.labelsStackView.bottomAnchor.constraint(equalTo: self.profileImage.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.statusTextField.topAnchor.constraint(equalTo: self.labelsStackView.bottomAnchor, constant: 16),
            self.statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.statusTextField.leadingAnchor.constraint(equalTo: self.labelsStackView.leadingAnchor),
            self.statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            self.showStatusButton.topAnchor.constraint(equalTo: self.statusTextField.bottomAnchor, constant: 16),
            self.showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.showStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
        
    //MARK: - views
    
    private lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Change status", for: .normal)
        button.backgroundColor = UIColor(named: "Color")
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(didTapStatusButton), for: .touchUpInside)
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
    
    private lazy var nameLable: UILabel = {
        let label = UILabel()
        label.text = "A.P.Chekhov"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var statusLable: UILabel = {
        let label = UILabel()
        label.text = "Одинокому везде пустыня."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 2))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 2))
        textField.rightViewMode = .always
        textField.layer.borderWidth = 1
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    // MARK: - stacks
    
    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    // MARK: - funcs
    
    @objc private func didTapStatusButton() {
        ProfileViewController.status = statusTextField.text!
        statusLable.text = ProfileViewController.status
        self.statusTextField.text = nil
        self.endEditing(true)
    }
}
