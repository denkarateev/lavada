//
//  FirstViewController.swift
//  DatingApp
//
//  Created by user on 05.03.2022.
//

import UIKit
import Lottie

class FirstViewController: UIViewController {
    var present: (() -> Void)?
    var backgroundAnimation: AnimationView = {
        var lottie = AnimationView()
        lottie.animation = Animation.named("bg")
        lottie.contentMode = .scaleAspectFill
        lottie.loopMode = .autoReverse
        lottie.translatesAutoresizingMaskIntoConstraints = false
        return lottie
    }()
     let controller = AuthViewController()
    var bottomView = UIView()
 
    let contrtoller2 = ProgressViewController()
    let controller3 = SignInViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
       
         backgroundAnimation.play { _ in
             
         }
     
        controller.buttonCreateAccount.addTarget(self, action: #selector(remove), for: .touchUpInside)
        controller.logInButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        backgroundAnimation.translatesAutoresizingMaskIntoConstraints = false
         bottomView.addSubview(backgroundAnimation)
        
        NSLayoutConstraint.activate([
            backgroundAnimation.topAnchor.constraint(equalTo: bottomView.topAnchor),
            backgroundAnimation.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            backgroundAnimation.leftAnchor.constraint(equalTo: bottomView.leftAnchor),
            backgroundAnimation.rightAnchor.constraint(equalTo: bottomView.rightAnchor)
        ])
        view.backgroundColor = .red
        bottomView.backgroundColor = .red
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                bottomView.backgroundColor = .red
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(controller)
        bottomView.addSubview(controller.view)
        NSLayoutConstraint.activate([
            controller.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            controller.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            controller.view.heightAnchor.constraint(equalToConstant: 480),
           ])
        controller.didMove(toParent: self)
    }
    
    @objc func login() {
        controller.removeFromParent()
        controller.view.removeFromSuperview()
        controller.willMove(toParent: nil)
        

  

        self.addChild(controller3)
        bottomView.addSubview(controller3.view)
         
//        contrtoller2.addChild(navController)
        NSLayoutConstraint.activate([
            controller3.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller3.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller3.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            controller3.view.heightAnchor.constraint(equalToConstant: 600),


           ])
        controller3.didMove(toParent: self)
    }
    @objc func remove() {
        
     
        controller.removeFromParent()
        controller.view.removeFromSuperview()
        controller.willMove(toParent: nil)
        

  

        self.addChild(contrtoller2)
        bottomView.addSubview(contrtoller2.view)
        let registration = RegistrationViewController()
        let navController = UINavigationController(rootViewController: registration)
        contrtoller2.addChild(navController)
        NSLayoutConstraint.activate([
            contrtoller2.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contrtoller2.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contrtoller2.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            contrtoller2.view.heightAnchor.constraint(equalToConstant: 600),


           ])
        contrtoller2.didMove(toParent: self)
    }
}
