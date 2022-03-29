//
//  RegistrationViewController.swift
//  DatingApp
//
//  Created by user on 09.03.2022.
//

import UIKit
import SwiftUI
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents
class RegistrationViewController: UIViewController {
    var isHidePassword = true
    let transitionManager = TransitionManager()
    
    private lazy var customView = RegistrationView()
    override func loadView() {
        view = customView
    }
     func showAlert(with title: String, and messaage: String) {
        let alertController = UIAlertController(title: title, message: messaage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customView.delegate = self
      
        navigationController?.isNavigationBarHidden = true
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
    }
    public func isValidPassword( text: inout String) -> Bool {
        text = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", text).evaluate(with: self)
    }
}

extension RegistrationViewController: RegistrationProtocol {
    func error(error: String) {
        showAlert(with: "Error", and: error)
    }
    
    
    
  
    
    func validatePassword(sender: MDCOutlinedTextField) {
        sender.leadingAssistiveLabel.isHidden = !isValidPassword(text: &sender.label.text!)
        
    }
    
    func securityPassword(sender: MDCOutlinedTextField) {
        isHidePassword = !isHidePassword
        sender.isSecureTextEntry = isHidePassword
        
    }
    
    
  
    func registration() {
       
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "progress"), object: nil)
        let toViewController = RegistrationFieldViewController()
      

        let transition = CATransition()
            transition.duration = 0.75
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        transition.type = .push
        transition.subtype = .fromRight
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(toViewController, animated: false)
       
    }
    
    
}
