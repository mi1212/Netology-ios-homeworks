//
//  ProfileViewController.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 22.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
       static var status: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.setupView()
//        drawSelf()
//        layout()
//        setupGestures()
        
    }
    
//    private let imageView: UIView = {
//        let image = UIImageView()
//        image.backgroundColor = .green
//        image.image = UIImage(named: "Image", in: nil, with: .none)
//        image.sizeToFit()
//        image.layer.borderWidth = 3
//        image.layer.borderColor = UIColor.white.cgColor
//        image.layer.cornerRadius = image.frame.height/2
//        image.clipsToBounds = true
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
//
//    private func setupGestures() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
//        imageView.isUserInteractionEnabled = true
//        imageView.addGestureRecognizer(tapGesture)
//        }
//
//    @objc private func tapAction() {
//        let rotateAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
//        rotateAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
//        rotateAnimation.fromValue = 0
//        rotateAnimation.toValue = 1.75 * Float.pi
//
//        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
//        positionAnimation.fromValue = imageView.center
//        positionAnimation.toValue = CGPoint(x: view.bounds.width - 100, y: imageView.center.y)
//
//        let groupAnimation = CAAnimationGroup()
//        groupAnimation.duration = 2.0
//        groupAnimation.animations = [rotateAnimation, positionAnimation]
//        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        imageView.layer.add(groupAnimation, forKey: nil)
//        imageView.transform = CGAffineTransform(rotationAngle: CGFloat(1.75 * Float.pi))
//        imageView.layer.position = CGPoint(x: view.bounds.width - 100, y: imageView.center.y)
//
//        print("objc tap")
//    }


//    private func layout() {
//        view.addSubview(imageView)
//
//        NSLayoutConstraint.activate([
//
//            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
//            imageView.heightAnchor.constraint(equalToConstant: imageView.frame.height)
//        ])
//    }
//
//    private func drawSelf() {
//        view.addSubview(self.imageView)
//
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
//            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
//            imageView.heightAnchor.constraint(equalToConstant: imageView.frame.height)
//        ])
//
//
//    }

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
        250
    }
}

extension ProfileViewController: PhotosTableViewCellDelegate {
    func buttonPressed() {
        let vc = PhotosViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
