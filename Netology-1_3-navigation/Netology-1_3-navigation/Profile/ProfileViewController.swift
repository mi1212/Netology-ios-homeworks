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
        self.navigationController?.navigationBar.isHidden = true
        self.setupView()
        self.updateLayout(with: self.view.frame.size)

        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.tableView.dataSource = self
        self.updateLayout(with: self.view.frame.size)
    }

    private func setupView() {
        self.view.addSubview(self.tableView)

        let tableViewTopConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let tableViewRightConstraint = self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let tableViewLeftConstraint = self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let tableViewBottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

        //        let viewTopConstraint = self.headerView.topAnchor.constraint(equalTo: self.tableView.topAnchor)
        //        let viewLeadingConstraint = self.headerView.leadingAnchor.constraint(equalTo: self.tableView.leadingAnchor)
        //        let viewTrailingConstraint = self.headerView.trailingAnchor.constraint(equalTo: self.tableView.trailingAnchor)
        //        let viewBottomConstraint = self.headerView.bottomAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: -200)

        NSLayoutConstraint.activate([
            tableViewTopConstraint, tableViewRightConstraint, tableViewLeftConstraint, tableViewBottomConstraint,
            //           viewTopConstraint, viewLeadingConstraint, viewTrailingConstraint, viewBottomConstraint,
        ])
    }

    //MARK - views

    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .yellow
        table.translatesAutoresizingMaskIntoConstraints = false
        return  table
    }()

    private lazy var headerView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.backgroundColor = .white
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()

    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout(with: size)
        }, completion: nil)
    }

    private var data = ["dfsdf", "dfsdfh", "dfsdf", "dfsdfh","dfsdf", "dfsdfh", "dfsdf", "dfsdfh","dfsdf", "dfsdfh", "dfsdf", "dfsdfh", "dfsdf", "dfsdfh", "dfsdf", "dfsdfh","dfsdf", "dfsdfh", "dfsdf", "dfsdfh" ]

}

extension ProfileViewController: ProfileHeaderViewProtocol {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {


        UIView.animate(withDuration: 0.3, delay: 0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.tableView:
            return self.data.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = self.data[indexPath.row]
        return cell
    }


}



class TableViewCell: UITableViewCell {

}







