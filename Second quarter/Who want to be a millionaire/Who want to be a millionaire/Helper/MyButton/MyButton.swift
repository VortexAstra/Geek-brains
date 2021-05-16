//
//  File.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 15.05.2021.
//

import UIKit

@IBDesignable
class MyButton: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }

    @IBInspectable
    var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }

    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
}
