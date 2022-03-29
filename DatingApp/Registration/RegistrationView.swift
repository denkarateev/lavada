//
//  RegistrationView.swift
//  DatingApp
//
//  Created by user on 06.03.2022.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents
protocol RegistrationProtocol: AnyObject {
    func registration()
    func error(error: String)
    func securityPassword(sender: MDCOutlinedTextField)
    func validatePassword(sender: MDCOutlinedTextField)
}
class RegistrationView: UIView {
    var progressDelegate: ProgressViewProtocol?
    var delegate: RegistrationProtocol?
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome"
        label.font = UIFont(name: "Inter-Bold", size: 32)
        label.textColor = .black
        return label
    }()
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Sign up"
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textColor = .black
        return label
    }()
    let emailTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        
        textField.label.text = "e-mail"
        
        let colorLabel = #colorLiteral(red: 0, green: 0.05098039216, blue: 0.1019607843, alpha: 0.3031002828)
        textField.keyboardType = .emailAddress
        textField.setNormalLabelColor(colorLabel, for: .normal)
        textField.containerRadius = 20
        textField.layer.cornerRadius = 20
        let color = #colorLiteral(red: 0.8588235294, green: 0.7058823529, blue: 0.9803921569, alpha: 1)
        
        textField.setOutlineColor(color, for: .editing)
        textField.setOutlineColor(.clear, for: .normal)
        textField.trailingView = UIImageView(image: UIImage(named: "eye"), contentMode: .scaleAspectFit)
        textField.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9607843137, blue: 0.9725490196, alpha: 1)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let passwordTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        
        textField.label.text = "password"
        textField.leadingAssistiveLabel.textColor = .red
        textField.leadingAssistiveLabel.text = "Input error, password must contain at least 8 characters, uppercase and numbers"
      
        textField.setLeadingAssistiveLabelColor(.red, for: .normal)
        let colorLabel = #colorLiteral(red: 0, green: 0.05098039216, blue: 0.1019607843, alpha: 0.3031002828)
        textField.keyboardType = .default
        textField.setNormalLabelColor(colorLabel, for: .normal)
        textField.containerRadius = 20
        textField.layer.cornerRadius = 20
        let color = #colorLiteral(red: 0.8588235294, green: 0.7058823529, blue: 0.9803921569, alpha: 1)
        
        textField.setOutlineColor(color, for: .editing)
        textField.setOutlineColor(.clear, for: .normal)
        textField.returnKeyType = .done
        textField.trailingViewMode = .always
        textField.isSecureTextEntry = true
        textField.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9607843137, blue: 0.9725490196, alpha: 1)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let signUpButton: UIButton = {
        let label = UIButton()
        label.setTitle("Sign up", for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.8549019608, blue: 1, alpha: 1)
        label.layer.cornerRadius = 20
        return label
    }()
    let privacyLabel: UILabel = {
        let label = UILabel()
        label.text = "By continuing, you agree to our Terms of Service and Privacy Policy."
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    init() {
        
        super.init(frame: .zero)
        let leftView =  UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "eye")
        leftView.setImage(image, for: .normal)
        passwordTextField.trailingView = leftView
        leftView.addTarget(self, action: #selector(securrity), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(registred), for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        privacyLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(welcomeLabel)
        self.addSubview(signUpLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(privacyLabel)
        self.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            
            
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            welcomeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            welcomeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            signUpLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8),
            signUpLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            signUpLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: signUpLabel.topAnchor, constant: 36),
            emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            emailTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 36),
            passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            passwordTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            
            
            signUpButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            signUpButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            signUpButton.heightAnchor.constraint(equalToConstant: 48),
            signUpButton.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: -10),
            
            privacyLabel.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -16),
            privacyLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            privacyLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            self.heightAnchor.constraint(equalToConstant: 580),
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
     
    }
    @objc func registred() {
       
        AuthService.shared.register(email: emailTextField.text, password: passwordTextField.text) { result in
            switch result  {
           
            case .success(let user):
                self.delegate?.registration()
            case .failure(let error):
                self.delegate?.error(error: error.localizedDescription)
            }
        }
    }
    @objc func securrity() {
        delegate?.securityPassword(sender: passwordTextField)
    }
    func valid() {
        delegate?.validatePassword(sender: passwordTextField)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


