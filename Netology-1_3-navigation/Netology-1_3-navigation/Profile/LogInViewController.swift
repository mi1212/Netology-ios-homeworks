//
//  LogInViewController.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 21.03.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.setupView()
        self.setupKeyboardHiding()
        self.loginView.delegate = self
        self.passView.delegate = self
    }

    private func setupView() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(logoImage)
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(logInButtom)
        self.stackView.addArrangedSubview(loginView)
        self.stackView.addArrangedSubview(passView)
        self.view.addGestureRecognizer(tap)

        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let scrollViewLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)

        let contentViewTrailingConstraint = self.contentView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let contentViewLeadingConstraint = self.contentView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let contentViewTopConstraint = self.contentView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let contentViewHeightConstraint = self.contentView.heightAnchor.constraint(equalToConstant: 1000)

        let logoViewTopConstraint = self.logoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120)
        let logoViewHeightLogoConstraint = self.logoImage.heightAnchor.constraint(equalToConstant: 100)
        let logoViewWidthLogoConstraint = self.logoImage.widthAnchor.constraint(equalToConstant: 100)
        let logoViewCenterLogoConstraint = self.logoImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)

        let stackViewTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 120)
        let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let stackViewHeightConstraint = self.stackView.heightAnchor.constraint(equalToConstant: 100)

        let loginButtonTopConstraint = self.logInButtom.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        let loginButtonLeadingConstraint = self.logInButtom.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let loginButtonXCenter = self.logInButtom.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let loginbuttonHeight = self.logInButtom.heightAnchor.constraint(equalToConstant: 50)


        NSLayoutConstraint.activate([
            scrollViewTopConstraint, scrollViewRightConstraint, scrollViewBottomConstraint, scrollViewLeftConstraint,
            contentViewTrailingConstraint, contentViewLeadingConstraint, contentViewTopConstraint,
            contentViewHeightConstraint,
            logoViewTopConstraint, logoViewHeightLogoConstraint, logoViewWidthLogoConstraint,  logoViewCenterLogoConstraint,
            stackViewTopConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint, stackViewHeightConstraint,
            loginButtonTopConstraint, loginButtonLeadingConstraint, loginButtonXCenter, loginbuttonHeight,
        ])

    }
    //MARK: views
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    private lazy var loginView: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray6
        text.placeholder = "Emale or phone"
        text.autocapitalizationType = .none
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text.layer.borderWidth = 0.25
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    private lazy var passView: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray6
        text.placeholder = "Password"
        text.autocapitalizationType = .none
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text.isSecureTextEntry = true
        text.layer.borderWidth = 0.25
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    let pixel = UIImage(named: "blue_pixel")

    private lazy var logInButtom: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(pixel, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapTransitionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        if button.isSelected {
            button.alpha = 0.8
        } else if button.isHighlighted {
            button.alpha = 0.8
        } else if !button.isEnabled {
            button.alpha = 0.8
        } else {
            button.alpha = 1
        }

        return button
    }()

    //MARK: stacks

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.cornerRadius = 10
        stack.clipsToBounds = true
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()

    // MARK: - objc

    @objc private func didTapTransitionButton() {
        let secondVC = ProfileViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }

    //MARK: dismissKeyboardTap

    private lazy var tap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        return tap
    }()

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }


}
// MARK: - Keyboard


extension LoginViewController {

    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }

        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height

        if textFieldBottomY > (keyboardTopY - 65) {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 2 ) * (-1)
            view.frame.origin.y = newFrameY
        }
    }

}

extension UIResponder {

    private struct Static {
        static weak var responder: UIResponder?
    }

    static func currentFirst() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }

    @objc private func _trap() {
        Static.responder = self
    }
}


