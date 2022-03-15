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

    private var heightConstraint: NSLayoutConstraint?

    //    private lazy var subView: ProfileHeaderView = {
    //        let view = ProfileHeaderView(frame: .zero)
    //        view.delegate = self
    //        view.translatesAutoresizingMaskIntoConstraints = false
    //        return view
    //    }()

    private lazy var subView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.delegate = self
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()

    private func setupView() {
        self.subView.frame = self.view.frame
        self.view.addSubview(self.subView)

    }
}
extension ProfileViewController: ProfileHeaderViewProtocol {
    func buttonPressed(textFieldIsVisible: Bool, completion: @escaping () -> Void) {


        UIView.animate(withDuration: 0.1, delay: 0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
}


