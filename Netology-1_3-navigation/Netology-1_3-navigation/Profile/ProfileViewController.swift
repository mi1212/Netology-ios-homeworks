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
        self.navigationController?.navigationBar.isHidden = true
        self.setupView()
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifire) // регистрация ячейки постов
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "photocell") // регистрация ячейки фотогалерии
        return tableView
    }()

    private func setupView() {
        
        
        
        self.view.addSubview(self.tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = "Back" // меня название вьюконтроллера чтобы имя кнопки возврата на след вью была "Back"
    }
}


// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postsArray.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "photocell", for: indexPath) as! PhotosTableViewCell
            cell.delegate = self
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifire, for: indexPath) as! CustomTableViewCell
            cell.setupCell(post: postsArray[indexPath.row - 1])
            return cell
        }
    }









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

extension ProfileViewController: PhotosTableViewCellDelegate {
    func buttonPressed() {
        let vc = PhotosViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
