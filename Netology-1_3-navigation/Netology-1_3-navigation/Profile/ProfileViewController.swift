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

    let subView = ProfileHeaderView(frame: CGRect(x: 10, y: 10, width: 1000, height: 1000))
//    let subView = ProfileHeaderView()

    private func setupView() {
        self.subView.frame = self.view.frame
        self.view.addSubview(subView)
    }
}
