//
//  ProfileHeaderView.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 11.03.2022.
//

import UIKit

protocol ProfileHeaderViewProtocol: AnyObject {
    func buttonPressed(textFieldIsVisible: Bool, completion: @escaping () -> Void)
}

class ProfileHeaderView: UIView {

    private var buttonTopConstraint: NSLayoutConstraint?

    weak var delegate: ProfileHeaderViewProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func drawSelf() {
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.profileImage)
        self.stackView.addArrangedSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.nameLable)
        self.labelsStackView.addArrangedSubview(self.statusLable)
        self.addSubview(self.showStatusButton)
        self.addSubview(self.statusTextField)

        let stackTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let stackLeadingContraint = self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let stackTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)

        self.buttonTopConstraint = self.showStatusButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        self.buttonTopConstraint?.priority = UILayoutPriority(999)
        let showStatusButtonLeadingConstraint = self.showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let showStatusButtonTrailingConstraint = self.showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let showStatusButtonHeightConstaint = self.showStatusButton.heightAnchor.constraint(equalToConstant: 50)

        let imageViewConstraint = self.profileImage.heightAnchor.constraint(equalTo: self.profileImage.widthAnchor, multiplier: 1)

        NSLayoutConstraint.activate([
            imageViewConstraint, stackTopConstraint, stackLeadingContraint, stackTrailingConstraint, self.buttonTopConstraint, showStatusButtonLeadingConstraint, showStatusButtonTrailingConstraint, showStatusButtonHeightConstaint,
        ].compactMap({ $0 }))
    }

    //MARK - views
    private lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Change status", for: .normal)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 1
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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

    private lazy var statusLable: UILabel = {
        let label = UILabel()
        label.text = "Одинокому везде пустыня."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    //MARK - stacks

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
    // MARK - funcs



    @objc private func buttonPressed() {
        print("\(self.statusLable.text ?? "Статуса нет")")

        if self.statusTextField.isHidden {
            self.statusTextField.isHidden = false
            self.statusTextField.text = ""
            self.showStatusButton.setTitle("Set status", for: .normal)

            self.buttonTopConstraint?.isActive = false

            let statusTextFieldTopConstraint = self.statusTextField.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)

            let statusTextFieldHeightConstraint = self.statusTextField.heightAnchor.constraint(equalToConstant: 40)

            let statusTextFieldLeadingConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: self.labelsStackView.leadingAnchor)

            let statusTextFieldTrailingConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)

            self.buttonTopConstraint = self.showStatusButton.topAnchor.constraint(equalTo: self.statusTextField.bottomAnchor, constant: 16)
            self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)

            NSLayoutConstraint.activate([
                statusTextFieldTopConstraint, statusTextFieldHeightConstraint, statusTextFieldLeadingConstraint, statusTextFieldTrailingConstraint, self.buttonTopConstraint
            ].compactMap({ $0 }))


        } else {
            statusTextField.isHidden = true
            self.statusLable.text = self.statusTextField.text
            self.showStatusButton.setTitle("Change status", for: .normal)

            self.buttonTopConstraint?.isActive = false

            self.buttonTopConstraint = self.showStatusButton.topAnchor.constraint(equalTo: self.statusLable.bottomAnchor, constant: 16)
            self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)

            NSLayoutConstraint.activate([
                self.buttonTopConstraint
            ].compactMap({ $0 }))
        }
    }
}
