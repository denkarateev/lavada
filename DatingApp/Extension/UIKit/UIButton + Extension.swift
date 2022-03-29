//
//  UIButton + Extension.swift
//  DatingApp
//
//  Created by user on 25.02.2022.
//

import Foundation
import UIKit
extension UIButton {
    convenience init(backgroundColor: UIColor,
                     titleColor: UIColor,
                     title: String,
                     font: UIFont, cornerRadius: CGFloat) {
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
    }
}
