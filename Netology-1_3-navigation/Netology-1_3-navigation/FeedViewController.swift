//
//  FeedViewController.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 22.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    struct Post {
        var title: String?
    }

    let firstPost = Post(title: "My first post")


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        self.view.backgroundColor = .systemGray4
        self.setupView()
    }
    
    private lazy var transitionButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.backgroundColor = .systemPurple
        button.setTitle(firstPost.title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapTransitionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    private func setupView() {
        self.view.addSubview(self.transitionButton)
        self.activateConstraints()
    }

    private func activateConstraints() {
        self.transitionButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.transitionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        self.transitionButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        self.transitionButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    @objc private func didTapTransitionButton() {
        let secondVC = PostViewController()
        secondVC.title = firstPost.title
        self.navigationController?.pushViewController(secondVC, animated: true)
    }


}
