//
//  ProfileTableHederView.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 30.04.2022.
//

import UIKit

protocol ProfileHeaderViewrotocol: AnyObject {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void)
}

class ProfileHeaderView: UIView {

    private var buttonTopConstraint: NSLayoutConstraint?

    weak var delegate: ProfileHeaderViewProtocol?

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func drawSelf() {
        self.addSubview(self.stackView)
        self.addSubview(self.showStatusButton)
        self.addSubview(self.statusTextField)
        self.stackView.addArrangedSubview(self.profileImage)
        self.stackView.addArrangedSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.nameLable)
        self.labelsStackView.addArrangedSubview(self.statusLable)


        let stackTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let stackLeadingContraint = self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let stackTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)

        self.buttonTopConstraint = self.showStatusButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        self.buttonTopConstraint?.priority = UILayoutPriority(999)
        let showStatusButtonLeadingConstraint = self.showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let showStatusButtonTrailingConstraint = self.showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let showStatusButtonHeightConstaint = self.showStatusButton.heightAnchor.constraint(equalToConstant: 50)

        let imageViewConstraint = self.profileImage.heightAnchor.constraint(equalTo: self.profileImage.widthAnchor, multiplier: 1)
        let imageHeightConstraint = self.profileImage.heightAnchor.constraint(equalToConstant: self.profileImage.frame.height)

        NSLayoutConstraint.activate([
            stackTopConstraint, stackLeadingContraint, stackTrailingConstraint, self.buttonTopConstraint, showStatusButtonLeadingConstraint, showStatusButtonTrailingConstraint, showStatusButtonHeightConstaint, imageViewConstraint, imageHeightConstraint
        ].compactMap({ $0 }))
    }


    //MARK - views

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
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
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

    @objc private func didTapStatusButton() {

        if self.statusTextField.isHidden {
            self.addSubview(self.statusTextField)

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


            self.statusTextField.text = ""
            self.showStatusButton.setTitle("Set status", for: .normal)


        } else {
            self.statusTextField.removeFromSuperview()
            self.showStatusButton.setTitle("Change status", for: .normal)
            self.buttonTopConstraint?.isActive = false
            self.buttonTopConstraint = self.showStatusButton.topAnchor.constraint(equalTo: self.statusLable.bottomAnchor, constant: 16)
            self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)

            NSLayoutConstraint.activate([self.buttonTopConstraint].compactMap({ $0 }))
        }

        self.delegate?.didTapStatusButton(textFieldIsVisible: self.statusTextField.isHidden) { [weak self] in self?.statusTextField.isHidden.toggle()
        }
    }

   @objc func statusTextChanged(_ textField: UITextField) {
        self.statusLable.text = self.statusTextField.text ?? ""
    }

}
