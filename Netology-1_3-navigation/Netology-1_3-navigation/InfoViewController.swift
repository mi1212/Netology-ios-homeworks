//
//  InfoViewController.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 23.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        self.setupView()
    }

    func setupView() {
        self.view.addSubview(alertButton)
        self.activateConstraints()
    }

    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.backgroundColor = .purple
        button.setTitle("Alert", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapAlertButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func activateConstraints() {
        self.alertButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
        self.alertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.alertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.alertButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    @objc private func didTapAlertButton() {
        let alert = UIAlertController(title: "Alert", message: "Button is working", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(
            title: NSLocalizedString("Close", comment: "Default action"),
            style: .cancel ,
            handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
        alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
