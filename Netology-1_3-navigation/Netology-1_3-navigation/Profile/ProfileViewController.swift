//
//  ProfileViewController.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 22.02.2022.
//

import UIKit

protocol ProfileViewControllerDelegate: AnyObject {
    func increaseViews()
}

class ProfileViewController: UIViewController{

    weak var delegate: ProfileViewControllerDelegate?
    
    static var status: String = ""
    static var viewsArray: [Int] = [0,0,0,0]
    static var likesArray: [Int] = [0,0,0,0]
    static var imageArray: [UIImage]?
    static var isLikedArray: [Bool] = [false, false, false, false]
    
    static var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.setupView()
        self.setupArrays()
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
    
    func setupView() {
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    private func setupArrays() {
        for item in 0...postsArray.count - 1 {
            ProfileViewController.viewsArray[item] = postsArray[item].views
            ProfileViewController.likesArray[item] = postsArray[item].likes
            ProfileViewController.isLikedArray[item] = postsArray[item].isLiked
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = "Back" // меняет название вьюконтроллера чтобы имя кнопки возврата на след вью была "Back"
    }
    
    private lazy var tap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        return tap
    }()
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
            cell.setupCell(post: postsArray[indexPath.row - 1], indexPath: indexPath)
            cell.delegate = self
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
        let header = ProfileHeaderView()
        header.delegate = self
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 1...4 :
            let vc = PostsViewController()
            vc.setupVC(post:postsArray[indexPath.row - 1], indexPath: indexPath)
            ProfileViewController.viewsArray[(indexPath.row - 1)] += 1
            print("ProfileViewController")
            print(ProfileViewController.viewsArray[(indexPath.row - 1)])	
            tableView.reloadData()
            self.present(vc, animated: true)
        default:
            break
        }
    }
    
}

// MARK: - delegate

extension ProfileViewController: ProfileHeaderViewDelegate {
    func profileImageTapScroll() {
        self.tableView.isScrollEnabled = true
    }
    
    func profileImageTap() {
        self.tableView.isScrollEnabled = false
    }
}

extension ProfileViewController: PhotosTableViewCellDelegate {
    func buttonPressed() {
        let vc = PhotosViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.reloadData()
    }
}

extension ProfileViewController: CustomTableViewCellDelegate {
    func increaseLikes(likes: Int, isLiked: Bool, indexPath: IndexPath) {
        ProfileViewController.likesArray[indexPath.row - 1] = likes
        ProfileViewController.isLikedArray[indexPath.row - 1] = isLiked
    }
}

extension ProfileViewController: PostsViewControllerDelegate {
        func increaseViews(views: Int, indexPath: IndexPath) {
            ProfileViewController.viewsArray[indexPath.row - 1] = views
    }
}
