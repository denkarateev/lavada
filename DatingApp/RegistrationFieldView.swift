//
//  RegistrationFieldView.swift
//  DatingApp
//
//  Created by user on 11.03.2022.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents
class RegistrationFieldView: UIView {
   weak var delegate: RegistrationFieldProtocol?
   
let aboutLabel: UILabel = {
    let label = UILabel()
    label.text = "About myself"
    label.textAlignment = .center
    label.font = UIFont(name: "Inter-Bold", size: 32)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()
    let labelDescrription: UILabel = {
        let label = UILabel()
        label.text = "We will recommend diets and exercises that suit you"
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let emailTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        textField.label.text = "name"
        
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
    let sexLabel: UILabel = {
        let label = UILabel()
        label.text = "sex  "
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textColor = #colorLiteral(red: 0, green: 0.05098039216, blue: 0.1019607843, alpha: 0.4754131393)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let sexManButton: UIButton = {
        let label = UIButton()
        label.setTitle("", for: .normal)
        label.setImage(UIImage(named: "female"), for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let sexWomanButton: UIButton = {
        let label = UIButton()
        label.setTitle("", for: .normal)
        label.setImage(UIImage(named: "male"), for: .normal)
        label.setTitleColor(.black, for: .normal)
    
      
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "age"
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textColor = #colorLiteral(red: 0, green: 0.05098039216, blue: 0.1019607843, alpha: 0.4754131393)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let ageCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let ageSlider: UISlider = {
        
        let slider = UISlider()
        slider.minimumValue = 18
        slider.maximumValue = 90
       
        slider.thumbTintColor = #colorLiteral(red: 0.8588235294, green: 0.7058823529, blue: 0.9803921569, alpha: 1)
        slider.tintColor = #colorLiteral(red: 0.937254902, green: 0.8549019608, blue: 1, alpha: 1)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    let locationTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        
        textField.label.text = "location"
        
        let colorLabel = #colorLiteral(red: 0, green: 0.05098039216, blue: 0.1019607843, alpha: 0.3031002828)
        textField.keyboardType = .emailAddress
        textField.setNormalLabelColor(colorLabel, for: .normal)
        textField.containerRadius = 20
        textField.layer.cornerRadius = 20
        textField.isEnabled = false
        textField.setOutlineColor(.clear, for: .normal)
        textField.trailingView = UIImageView(image: UIImage(named: "eye"), contentMode: .scaleAspectFit)
        textField.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9607843137, blue: 0.9725490196, alpha: 1)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    let mapIcon: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "map-pin")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    let myLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "My location"
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let locationSwitch: UISwitch = {
        let switcher = UISwitch()
       
        switcher.isOn = false
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()
        
    let backButton: UIButton = {
        let label = UIButton()
        label.setTitle("back", for: .normal)

        label.setTitleColor(.black, for: .normal)
        label.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9607843137, blue: 0.9725490196, alpha: 1)
        label.layer.cornerRadius = 20
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let nextButton: UIButton = {
        let label = UIButton()
        label.setTitle("Next", for: .normal)
        label.setImage(UIImage(named: ""), for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.8549019608, blue: 1, alpha: 1)
        label.layer.cornerRadius = 20
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init() {
        super.init(frame: .zero)
        ageSlider.addTarget(self, action: #selector(changeSlider(sender:)), for: .allEvents)
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        self.addSubview(aboutLabel)
        self.addSubview(labelDescrription)
        self.addSubview(emailTextField)
        self.addSubview(sexLabel)
        self.addSubview(sexManButton)
        self.addSubview(sexWomanButton)
        self.addSubview(ageLabel)
        self.addSubview(ageCountLabel)
        self.addSubview(ageSlider)
        self.addSubview(mapIcon)
        self.addSubview(locationTextField)
        self.addSubview(myLocationLabel)
        self.addSubview(locationSwitch)
        self.addSubview(backButton)
        self.addSubview(nextButton)
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            aboutLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            aboutLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            labelDescrription.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 8),
            labelDescrription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            labelDescrription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: labelDescrription.bottomAnchor, constant: 19),
            emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            emailTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            sexLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            sexLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 21),
            sexLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            sexManButton.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 16),
            sexManButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 29),
            sexManButton.widthAnchor.constraint(equalToConstant: 32),
            sexManButton.heightAnchor.constraint(equalToConstant: 32),
            
            sexWomanButton.centerYAnchor.constraint(equalTo: sexManButton.centerYAnchor),
            sexWomanButton.leftAnchor.constraint(equalTo: sexManButton.rightAnchor, constant: 48),
            sexWomanButton.widthAnchor.constraint(equalToConstant: 32),
            sexWomanButton.heightAnchor.constraint(equalToConstant: 32),
            
            ageLabel.topAnchor.constraint(equalTo: sexManButton.bottomAnchor, constant: 26),
            ageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 21),
            ageLabel.rightAnchor.constraint(equalTo: centerXAnchor),
            
            ageCountLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            ageCountLabel.leftAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            ageCountLabel.centerYAnchor.constraint(equalTo: ageLabel.centerYAnchor),
            
            ageSlider.topAnchor.constraint(equalTo: ageCountLabel.bottomAnchor, constant: 16),
            ageSlider.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            ageSlider.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            ageSlider.heightAnchor.constraint(equalToConstant: 4),
            
            locationTextField.topAnchor.constraint(equalTo: ageSlider.bottomAnchor, constant: 36),
            locationTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            locationTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            locationTextField.heightAnchor.constraint(equalToConstant: 56),
            
            mapIcon.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 29),
            mapIcon.leftAnchor.constraint(equalTo: leftAnchor, constant: 23),
            mapIcon.widthAnchor.constraint(equalToConstant: 18),
            mapIcon.heightAnchor.constraint(equalToConstant: 22),
            
            locationSwitch.centerYAnchor.constraint(equalTo: mapIcon.centerYAnchor),
            locationSwitch.widthAnchor.constraint(equalToConstant: 36),
            locationSwitch.heightAnchor.constraint(equalToConstant: 12),
            locationSwitch.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
          
            
            
            myLocationLabel.leftAnchor.constraint(equalTo: mapIcon.rightAnchor, constant: 11),
            myLocationLabel.rightAnchor.constraint(equalTo: locationSwitch.leftAnchor, constant: -8),
            myLocationLabel.centerYAnchor.constraint(equalTo: mapIcon.centerYAnchor),
            
            backButton.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: -10),
            backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            backButton.rightAnchor.constraint(equalTo: centerXAnchor, constant: -8),
            backButton.heightAnchor.constraint(equalToConstant: 48),
            
            nextButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            nextButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            nextButton.leftAnchor.constraint(equalTo: centerXAnchor, constant: 8),
            nextButton.heightAnchor.constraint(equalToConstant: 48),
            
            self.heightAnchor.constraint(equalToConstant: 580),
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
            ])
    }
    @objc func backPressed() {
        delegate?.back()
       
    }
    @objc func nextPressed() {
        delegate?.next()
    }
    @objc func changeSlider(sender: UISlider) {
        delegate?.slider()
        DispatchQueue.main.async {
           
            self.ageCountLabel.text = String(format: "%0.0f" ,(sender.value ))
        }
       
    }
}
