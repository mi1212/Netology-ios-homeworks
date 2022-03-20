//
//  ProfileViewController.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 22.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.view.backgroundColor = .lightGray
        self.setupView()
    }


    private lazy var subView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.backgroundColor = .lightGray
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()

    private lazy var specialButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Special unused Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 1
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func setupView() {
        self.view.addSubview(self.subView)
        self.view.addSubview(self.specialButton)

        let viewTopConstraint = self.subView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let viewLeadingConstraint = self.subView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let viewTrailingConstraint = self.subView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let viewBottomConstraint = self.subView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200)

        let buttonBottomConstraint = self.specialButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        let buttonLeadingConstraint = self.specialButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let buttonTrailingConstraint = self.specialButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let buttonHeightConstraint = self.specialButton.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([
            viewTopConstraint, viewLeadingConstraint, viewTrailingConstraint, viewBottomConstraint, buttonBottomConstraint, buttonLeadingConstraint, buttonTrailingConstraint, buttonHeightConstraint
        ])
    }
}
extension ProfileViewController: ProfileHeaderViewProtocol {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {


        UIView.animate(withDuration: 0.3, delay: 0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
}


