//
//  testcontroller.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 20.05.2022.
//

import UIKit

class TestController: UIViewController {
    
    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupGestures()
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        redView.addGestureRecognizer(tapGesture)
        }
    

    @objc private func rotationAction(gesture: UIRotationGestureRecognizer) {
        redView.transform = redView.transform.rotated(by: gesture.rotation)
        gesture.rotation = 0
    }
     
    @objc private func tapAction() {
        let rotateAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        rotateAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = 1.75 * Float.pi

        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        positionAnimation.fromValue = redView.center
        positionAnimation.toValue = CGPoint(x: view.bounds.width - 100, y: redView.center.y)

        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 2.0
        groupAnimation.animations = [rotateAnimation, positionAnimation]
        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        redView.layer.add(groupAnimation, forKey: nil)
        redView.transform = CGAffineTransform(rotationAngle: CGFloat(1.75 * Float.pi))
        redView.layer.position = CGPoint(x: view.bounds.width - 100, y: redView.center.y)
    }


    private func layout() {
        view.addSubview(redView)
       
        NSLayoutConstraint.activate([
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            redView.widthAnchor.constraint(equalToConstant: 100),
            redView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
