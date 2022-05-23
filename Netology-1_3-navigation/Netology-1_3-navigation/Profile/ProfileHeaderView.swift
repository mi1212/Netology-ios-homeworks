//
//  ProfileTableHederView.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 30.04.2022.
//

import UIKit

protocol ProfileHeaderViewDelegate: AnyObject {
    func profileImageTap()
    func profileImageTapScroll()
}


class ProfileHeaderView: UIView, UITextFieldDelegate {

    weak var delegate: ProfileHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
        drawSelf()
        setupGestures()
    }
       
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var heightProfileImage = NSLayoutConstraint()
    var widthProfileImage = NSLayoutConstraint()
    var topProfileImage =  NSLayoutConstraint()
    var leadingProfileImage = NSLayoutConstraint()
    
    private func drawSelf() {
        
        self.addSubview(self.stackView)
        self.addSubview(self.showStatusButton)
        self.addSubview(self.statusTextField)
        self.addSubview(self.labelsStackView)
        self.addSubview(self.blurView)
        self.addSubview(self.profileImage)
        self.addSubview(self.crossView)

        self.labelsStackView.addArrangedSubview(self.nameLable)
        self.labelsStackView.addArrangedSubview(self.statusLable)
        if ProfileViewController.status != "" {
            statusLable.text = ProfileViewController.status
        }

        topProfileImage = self.profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        leadingProfileImage = self.profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        heightProfileImage = self.profileImage.heightAnchor.constraint(equalToConstant: self.profileImage.frame.height)
        widthProfileImage = self.profileImage.widthAnchor.constraint(equalToConstant: self.profileImage.frame.width)

        NSLayoutConstraint.activate([
            topProfileImage,
            leadingProfileImage,
            heightProfileImage,
            widthProfileImage
        ])

        NSLayoutConstraint.activate([
            self.crossView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.crossView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.crossView.heightAnchor.constraint(equalToConstant: 24),
            self.crossView.widthAnchor.constraint(equalTo: self.crossView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.labelsStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            self.labelsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.labelsStackView.leadingAnchor.constraint(equalTo: self.profileImage.trailingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            self.statusTextField.topAnchor.constraint(equalTo: self.labelsStackView.bottomAnchor, constant: 16),
            self.statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.statusTextField.leadingAnchor.constraint(equalTo: self.labelsStackView.leadingAnchor),
            self.statusTextField.bottomAnchor.constraint(equalTo: self.profileImage.bottomAnchor),
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

    // MARK: - animation

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGesture)

        let crossTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapCrossAction))
        crossView.isUserInteractionEnabled = true
        crossView.addGestureRecognizer(crossTapGesture)
    }

    @objc private func tapAction() {

        delegate?.profileImageTap()

        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseInOut) {
                self.profileImage.layer.position = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2 )
                self.profileImage.layer.cornerRadius = 0
                self.profileImage.layer.bounds = CGRect(x: UIScreen.main.bounds.width/2 , y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                self.blurView.layer.opacity = 1
            } completion: { _ in
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
                    self.crossView.layer.opacity = 1
                } completion: { _ in
                }
            }
    }

    @objc private func tapCrossAction() {
        
        delegate?.profileImageTapScroll()

        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
            self.crossView.layer.opacity = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {

                self.profileImage.layer.position = CGPoint(x: 16 + (self.profileImage.image?.size.height)!/2, y: 16 + (self.profileImage.image?.size.height)!/2)
                self.profileImage.layer.cornerRadius = CGFloat((self.profileImage.image?.size.height)!/2)
                self.profileImage.layer.bounds = CGRect(
                    x: 16 + (self.profileImage.image?.size.height)!/2,
                    y: 16 + (self.profileImage.image?.size.height)!/2,
                    width: (self.profileImage.image?.size.height)!,
                    height: (self.profileImage.image?.size.height)!
                )

                self.blurView.layer.opacity = 0

            } completion: { _ in

            }

        }

    }

}


