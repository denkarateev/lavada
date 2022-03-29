//
//  ViewController.swift
//  DatingApp
//
//  Created by user on 24.02.2022.
//

import UIKit
import SwiftUI
import Lottie
class AuthViewController: UIViewController {

    var authSheet: UIView?
    var viewCornerRadius: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var backgroundAnimation: AnimationView = {
        var lottie = AnimationView()
        lottie.animation = Animation.named("bg")
        lottie.contentMode = .scaleAspectFill
        lottie.loopMode = .autoReverse
        lottie.translatesAutoresizingMaskIntoConstraints = false
        return lottie
    }()
    var backGroundView: UIImageView!
    var authView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let buttonCreateAccount = UIButton(backgroundColor: #colorLiteral(red: 0.937254902, green: 0.8549019608, blue: 1, alpha: 1), titleColor: .black, title: "Create account", font: UIFont(name: "Inter-Medium", size: 16)!, cornerRadius: 15)
    let logoLabel: UILabel = {
       let label = UILabel()
        label.text = "LAVA"
        label.textColor = .black
        label.font = UIFont(name: "Inter-Bold", size: 24)
        return label
    }()
    let logInButton: UIButton = {
       let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let labelDescrription: UILabel = {
       let label = UILabel()
        label.text = "Create brilliant learning pathways"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black 
        label.font = UIFont(name: "Inter-Bold", size: 32)
        return label
    }()
    let labelHaveAccount: UILabel = {
       let label = UILabel()
        label.text = "Have an account?"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Inter-Medium", size: 16)
        return label
    }()
    let labelLogin: UILabel = {
       let label = UILabel()
        label.text = "Log in to your account"
     
        label.textAlignment = .center
        label.textColor = .black
        
        label.font = UIFont(name: "Inter-Regular", size: 16)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        let stackView1 = UIStackView(arrangedSubviews: [labelHaveAccount, logInButton], axis: .horizontal, spacing: 2)
        authSheet = AuthSheetView(labelLogo: logoLabel, labelDescription: labelDescrription, labelLogin: labelLogin, buttonCreateAccount: buttonCreateAccount, labelHaveAccount: stackView1)
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        logInButton.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        buttonCreateAccount.addTarget(self, action: #selector(tapedCreateAccount), for: .touchUpInside)
        let image = UIImage(named: "authBacground")
       
        backGroundView = UIImageView(image: image, contentMode: .scaleAspectFill)
        setupConstraints(view2: authSheet!)
        
       
    }
    @objc func changeView() {
       
       
        
     
       
            
    }
    @objc func tapedCreateAccount() {
        self.removeFromParent()
        let vc = ProgressViewController()
        self.addChild(vc)
        let registration = RegistrationViewController()
    
        vc.addChild(registration)
    }
    private func setupConstraints(view2: UIView) {
      
        logInButton.contentHorizontalAlignment = .leading
        
       
       
        backGroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundAnimation)
        view.addSubview(authView)
        view.addSubview(viewCornerRadius)
        
       
        authView.addSubview(view2)
        
        NSLayoutConstraint.activate([
            backgroundAnimation.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundAnimation.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundAnimation.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundAnimation.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        NSLayoutConstraint.activate([
            authView.leftAnchor.constraint(equalTo: view.leftAnchor),
            authView.rightAnchor.constraint(equalTo: view.rightAnchor),
            authView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            authView.heightAnchor.constraint(equalToConstant: 480),
            
            viewCornerRadius.centerYAnchor.constraint(equalTo: authView.topAnchor),
            viewCornerRadius.centerXAnchor.constraint(equalTo: authView.centerXAnchor),
            viewCornerRadius.widthAnchor.constraint(equalTo: authView.widthAnchor, multiplier: 1),
            viewCornerRadius.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            view2.leftAnchor.constraint(equalTo: authView.leftAnchor),
            view2.topAnchor.constraint(equalTo: authView.topAnchor),
            view2.rightAnchor.constraint(equalTo: authView.rightAnchor),
            view2.bottomAnchor.constraint(equalTo: authView.bottomAnchor),
       
            
            ])
    
    }

}

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        let viewControler = AuthViewController()
        func makeUIViewController(context: Context) -> AuthViewController {
            return viewControler
        }
        func updateUIViewController(_ uiViewController: ViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerProvider.ContainerView>) {
            
        }
    }
}
