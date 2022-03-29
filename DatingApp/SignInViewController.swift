//
//  SignInViewController.swift
//  DatingApp
//
//  Created by user on 22.03.2022.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents
import GoogleSignIn
class SignInViewController: UIViewController {
    var isHidePassword = true
    func showAlert(with title: String, and messaage: String) {
       let alertController = UIAlertController(title: title, message: messaage, preferredStyle: .alert)
       let okAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
       alertController.addAction(okAction)
       present(alertController, animated: true, completion: nil)
       
   }
    private lazy var customView = SignInView()
    override func loadView() {
        view = customView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customView.delegate = self
    }
    

  

}
extension SignInViewController: SignInProtocol {
    func securityPassword(sender: MDCOutlinedTextField) {
        isHidePassword = !isHidePassword
        sender.isSecureTextEntry = isHidePassword
    }
    
    func error(error: String) {
       
            showAlert(with: "Error", and: error)
        
    }
    
    func logIn() {
        showAlert(with: "Успех", and: "Круто")
    }
    
   
    
    
}

