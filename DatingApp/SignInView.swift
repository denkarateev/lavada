//
//  SignInView.swift
//  DatingApp
//
//  Created by user on 21.03.2022.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents
protocol SignInProtocol: AnyObject {
    func logIn()
    func error(error: String)
    func securityPassword(sender: MDCOutlinedTextField)
}
class SignInView: UIView {
   weak var delegate: SignInProtocol?
    let viewCorner: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.layer.zPosition = -1
        return view
    }()
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome"
        label.font = UIFont(name: "Inter-Bold", size: 32)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let signInLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Sign in"
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let emailTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        
        textField.label.text = "e-mail"
        textField.setTextColor(.black, for: .normal)
        textField.label.textColor = .black
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
        textField.setTextColor(.black, for: .normal)
        textField.label.textColor = .black
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
    let forgotPasswordLabel: UIButton = {
        let label = UIButton()
        label.setTitle("Forgot password?", for: .normal)
        label.setTitleColor(UIColor.systemBlue, for: .normal)
       
     
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let signInButton: UIButton = {
        let label = UIButton()
        label.setTitle("Sign in", for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.8549019608, blue: 1, alpha: 1)
        label.layer.cornerRadius = 20
//        label.isEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let signInAnother: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Or sign in with another email"
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let googleButton: UIButton = {
        let label = UIButton()
        label.setTitle("", for: .normal)
        label.setImage(UIImage(named: "googleIcon"), for: .normal)
        label.setTitleColor(.black, for: .normal)
      
     
      
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    init() {
     
        super.init(frame: .zero)
        viewCorner.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        let leftView =  UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "eye")
        leftView.setImage(image, for: .normal)
        passwordTextField.trailingView = leftView
        leftView.addTarget(self, action: #selector(securrity), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        self.addSubview(viewCorner)
        self.addSubview(welcomeLabel)
        self.addSubview(signInLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(forgotPasswordLabel)
        self.addSubview(signInButton)
        self.addSubview(googleButton)
        self.addSubview(signInAnother)
        NSLayoutConstraint.activate([
            
            viewCorner.centerYAnchor.constraint(equalTo: topAnchor),
            viewCorner.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            viewCorner.heightAnchor.constraint(equalToConstant: 30),
            
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            welcomeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            welcomeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            signInLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8),
            signInLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            signInLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: signInLabel.topAnchor, constant: 36),
            emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            emailTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 36),
            passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            passwordTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35),
            forgotPasswordLabel.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor),
            forgotPasswordLabel.heightAnchor.constraint(equalToConstant: 16),
            
            
            signInAnother.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 32),
            signInAnother.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            googleButton.topAnchor.constraint(equalTo: signInAnother.bottomAnchor, constant: 8),
            googleButton.leftAnchor.constraint(equalTo: signInAnother.leftAnchor),
            googleButton.widthAnchor.constraint(equalToConstant: 24),
            googleButton.heightAnchor.constraint(equalToConstant: 24),
            
            signInButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            signInButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 48),
            signInButton.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: -10),
            
            self.heightAnchor.constraint(equalToConstant: 580),
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func signIn() {
        AuthService.shared.login(email: emailTextField.text, password: passwordTextField.text) { result in
            switch result {
                
            case .success(let user):
                self.delegate?.logIn()
            case .failure(let error):
                self.delegate?.error(error: error.localizedDescription)
            }
        }
        
    }
    @objc func securrity() {
        delegate?.securityPassword(sender: passwordTextField)
    }
}
