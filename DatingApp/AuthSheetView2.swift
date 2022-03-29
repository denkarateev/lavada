//
//  AuthSheetView.swift
//  DatingApp
//
//  Created by user on 25.02.2022.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents
class AuthSheetView2: UIView {
        
    init(labelLogo: UILabel, labelDescription: UILabel, labelLogin: UILabel, buttonCreateAccount: UIButton, labelHaveAccount: UIStackView) {
        super.init(frame: .zero)
        let textField = MDCOutlinedTextField()
        textField.label.text = "e-mail"
        textField.setOutlineColor(.green, for: .editing)
        textField.setOutlineColor(.clear, for: .normal)
        textField.layer.cornerRadius = 20
        textField.trailingView = UIImageView(image: UIImage(named: "eye"), contentMode: .scaleAspectFit)

        textField.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        labelLogo.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonCreateAccount.translatesAutoresizingMaskIntoConstraints = false
        labelHaveAccount.translatesAutoresizingMaskIntoConstraints = false
        labelLogo.textAlignment = .center
        self.addSubview(labelLogo)
        self.addSubview(labelDescription)
        self.addSubview(labelLogin)
        self.addSubview(buttonCreateAccount)
        self.addSubview(textField)
        self.addSubview(labelHaveAccount)
        NSLayoutConstraint.activate([
            labelLogo.topAnchor.constraint(equalTo: self.topAnchor, constant: 46),
            labelLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
           
            labelDescription.topAnchor.constraint(equalTo: labelLogo.bottomAnchor, constant: 12),
            labelDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            labelDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            labelLogin.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 8),
            labelLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            labelLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            textField.topAnchor.constraint(equalTo: labelLogin.bottomAnchor, constant: 20),
            textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 21),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -21),
            textField.heightAnchor.constraint(equalToConstant: 52),
            
            buttonCreateAccount.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            buttonCreateAccount.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            buttonCreateAccount.heightAnchor.constraint(equalToConstant: 48),
            buttonCreateAccount.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: -10),
            
            
            labelHaveAccount.bottomAnchor.constraint(equalTo: buttonCreateAccount.topAnchor, constant: -16),
            labelHaveAccount.centerXAnchor.constraint(equalTo: buttonCreateAccount.centerXAnchor)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
