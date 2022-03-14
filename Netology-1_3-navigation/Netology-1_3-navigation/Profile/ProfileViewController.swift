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
    }

    let subView = ProfileHeaderView(frame: CGRect(x: 10, y: 10, width: 1000, height: 1000))
//    let subView = ProfileHeaderView()

    override func viewWillLayoutSubviews() {
        self.subView.frame = self.view.frame
//        self.subView.backgroundColor = .purple
        self.view.addSubview(subView)
    }
}
