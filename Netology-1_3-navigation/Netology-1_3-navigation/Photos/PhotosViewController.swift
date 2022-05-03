//
//  PhotosViewController.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 02.05.2022.
//

import UIKit

class PhotosViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - UIView

    private let photoCollection: UICollectionView = {
        let collection = UICollectionView()

        return collection
    }()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
