//
//  Validators.swift
//  DatingApp
//
//  Created by user on 19.03.2022.
//

import Foundation
class Validators {
    static func isFilled(email: String?, passworrd: String? ) -> Bool {
        guard let passworrd = passworrd,
              let email = email,
              passworrd != "",
              email != "" else {
                  return false
              }
         return true
    }
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEX = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEX)
    }
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
           return predicate.evaluate(with: text)
    }
}
