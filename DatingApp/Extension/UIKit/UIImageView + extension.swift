//
//  UIImageView + extension.swift
//  DatingApp
//
//  Created by user on 25.02.2022.
//

import Foundation
import UIKit
extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}
