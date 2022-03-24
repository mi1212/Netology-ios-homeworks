//
//  ProfileTableHederView.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 23.03.2022.
//

import UIKit

class ProfileTableHederView: UITableView {

    override func draw(_ rect: CGRect) {
        // Drawing code
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        self.draw()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func draw() {
        self.addSubview(headerSubView)
    }

    private lazy var headerSubView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
}
