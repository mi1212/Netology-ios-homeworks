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
        self.view.backgroundColor = .white
        self.setupView()
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifire) // регистрация ячейки
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "photoscell") // регистрация ячейки
        return tableView
    }()

    private func setupView() {
        self.view.addSubview(self.tableView)

        let tableViewTopConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let tableViewLeadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let tableViewTrailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let tableViewBottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)

        NSLayoutConstraint.activate([
            tableViewTopConstraint, tableViewLeadingConstraint, tableViewTrailingConstraint, tableViewBottomConstraint
        ])
    }
}


// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath == [0, 0] {
            let cell = tableView.dequeueReusableCell(withIdentifier: "photoscell", for: indexPath)
            print("\(indexPath)")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifire, for: indexPath) as! CustomTableViewCell
            cell.setupCell(post: postsArray[indexPath.row])
            print("\(indexPath)")
            return cell
        }
    }


//    func numberOfSections(in tableView: UITableView) -> Int {
//        2
//    }








}

// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension //автоматическое вычисление высоты ячейки
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileHeaderView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        300
    }
}

