//
//  AuthService.swift
//  DatingApp
//
//  Created by user on 22.03.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class AuthService {
    static let shared = AuthService()
    private let auth = Auth.auth()
    func googleLogin(user: GIDGoogleUser!, error: Error!, completion: @escaping (Result<User, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
            return
        }
        guard let authentication = user?.authentication,
              let idToken = authentication.idToken
        else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email!, password: password!) { result, error in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    func register(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        
        auth.createUser(withEmail: email!, password: password! ) { result, error in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
       
    }

}

