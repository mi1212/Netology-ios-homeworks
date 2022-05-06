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
        self.contentView.addSubview(logoImage)
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(logInButtom)
        self.stackView.addArrangedSubview(loginView)
        self.stackView.addArrangedSubview(passView)
        self.view.addGestureRecognizer(tap)

        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])

        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            self.logoImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.logoImage.widthAnchor.constraint(equalToConstant: 100),
            self.logoImage.heightAnchor.constraint(equalToConstant: 100),
            self.logoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120)
        ])


        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])


        NSLayoutConstraint.activate([
            logInButtom.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16),
            logInButtom.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16),
            logInButtom.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            logInButtom.heightAnchor.constraint(equalToConstant: 50),
            logInButtom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

    }
    //MARK: views
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false

        return scroll
    }()


    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    private lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        //        $0.backgroundColor = .blue
        return $0
    }(UIView())


    private lazy var loginView: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray6
        text.placeholder = "Mail or Phone"
        text.font = UIFont.systemFont(ofSize: 16)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 2))
        text.leftView = leftView
        text.leftViewMode = .always
        text.autocapitalizationType = .none
        text.tintColor = .lightGray
        text.textColor = .black
        text.layer.borderWidth = 0.5
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.clearButtonMode = .whileEditing
        text.clearButtonMode = .unlessEditing
        text.clearButtonMode = .always
        text.delegate = self
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    private lazy var passView: UITextField = {
        let password = UITextField()
        password.backgroundColor = .systemGray6
        password.placeholder = "Password"
        password.font = UIFont.systemFont(ofSize: 16)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 2))
        password.leftView = leftView
        password.leftViewMode = .always
        password.autocapitalizationType = .none
        password.tintColor = .lightGray
        password.isSecureTextEntry = true
        password.textColor = .black
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.clearButtonMode = .whileEditing
        password.clearButtonMode = .unlessEditing
        password.clearButtonMode = .always
        password.delegate = self
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
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



