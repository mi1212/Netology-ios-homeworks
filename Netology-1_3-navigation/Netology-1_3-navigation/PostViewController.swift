//
//  PostViewController.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 22.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray3
        self.setupView()
        self.setupNavigationBar()
    }

    private func setupView() {
    }

    private func setupNavigationBar() {
        let navigationBar = UINavigationBar.init()

        let barButtomItem = UIBarButtonItem.init(
            image: UIImage(imageLiteralResourceName: "info"),
            style: .plain,
            target: self,
            action: #selector(didTapInfoButton)
        )

        navigationBar.topItem?.rightBarButtonItem = barButtomItem
        navigationItem.rightBarButtonItem = barButtomItem

        self.view.addSubview(navigationBar)
    }

    @objc private func didTapInfoButton() {
        let infoVC = InfoViewController()
//        secondVC.title = firstPost.title
        self.navigationController?.present(infoVC, animated: true)
    }
}
