//
//  AddViewView.swift
//  DatingApp
//
//  Created by user on 17.03.2022.
//

import UIKit

class AddViewView: UIView {
    weak var delegate: AddVideoViewProtocol?
    
    let uploadLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Upload a short video about yourself"
        label.font = UIFont(name: "Inter-Bold", size: 32)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let recomendLaabel: UILabel = {
        let label = UILabel()
        label.text = "We will recommend diets and exercises that suit you"
        label.numberOfLines = 2
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addVideoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add video", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 16)
        button.backgroundColor = #colorLiteral(red: 0.9517142177, green: 0.8884666562, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    init() {
        super.init(frame: .zero)
        addVideoButton.addTarget(self, action: #selector(addVideo), for: .touchUpInside)
        backButton.addTarget(self, action:  #selector(backPressed), for: .touchUpInside)
        self.addSubview(uploadLabel)
        self.addSubview(recomendLaabel)
        self.addSubview(addVideoButton)
        self.addSubview(backButton)
        
      
        NSLayoutConstraint.activate([
            uploadLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            uploadLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            uploadLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            recomendLaabel.topAnchor.constraint(equalTo: uploadLabel.bottomAnchor, constant: 8),
            recomendLaabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            recomendLaabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            addVideoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addVideoButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            addVideoButton.widthAnchor.constraint(equalToConstant: 142),
            addVideoButton.heightAnchor.constraint(equalToConstant: 48),
            
            
            backButton.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: -10),
            backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            backButton.rightAnchor.constraint(equalTo: centerXAnchor, constant: -8),
            backButton.heightAnchor.constraint(equalToConstant: 48),
            
            self.heightAnchor.constraint(equalToConstant: 580),
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
 
    @objc func addVideo() {
        delegate?.addVideo()
    }
    @objc func backPressed() {
        delegate?.back()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

