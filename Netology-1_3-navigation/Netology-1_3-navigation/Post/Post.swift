//
//  Post.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 23.03.2022.
//

import UIKit

struct Post: Decodable {

    let author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int

}
