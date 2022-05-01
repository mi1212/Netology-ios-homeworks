//
//  CustomHeader.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 30.04.2022.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    let view = UIView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureContents() {
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        view.backgroundColor = .gray
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 100)

        ])
    }
}
