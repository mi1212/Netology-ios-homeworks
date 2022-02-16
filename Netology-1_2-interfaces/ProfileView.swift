//
//  ProfileView.swift
//  Netology-1_2-interfaces
//
//  Created by Mikhail Chuparnov on 16.02.2022.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet var photo : UIImageView!

    @IBOutlet weak var nameLable: UILabel!

    @IBOutlet weak var dateOfBirth: UILabel!

    @IBOutlet weak var placeOfBirth: UILabel!

    @IBOutlet weak var text: UITextView!


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }

    private func setupView() {
        let view = self.loadViewFromXib()
        view.frame = self.bounds // здесь view, загруженная из xib-файла, добавляется на вьюху класса. Ее размер соответствует размеру вьюхе класса и растягивается так же, как и сама вьюха класса.
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }

    private func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? UIView else { return UIView() }

        return view
    }
}

