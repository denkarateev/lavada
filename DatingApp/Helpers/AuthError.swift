//
//  AuthError.swift
//  DatingApp
//
//  Created by user on 19.03.2022.
//

import Foundation
import SwiftUI
enum AuthError {
    case notFilled
    case invalidEmail
    case unkowbbbErrorr
    case serverError
}
extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
            
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Формат почты не является допустимым", comment: "")
        case .unkowbbbErrorr:
            return NSLocalizedString("Неизветсная ошибка", comment: "")
        case .serverError:
            return NSLocalizedString("Ошибка сервера", comment: "")
        }
    }
}
