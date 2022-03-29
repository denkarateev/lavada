//
//  RegistrationFieldViewController.swift
//  DatingApp
//
//  Created by user on 11.03.2022.
//

import UIKit
protocol RegistrationFieldProtocol: AnyObject {
    func slider()
    func back()
    func next()
}
class RegistrationFieldViewController: UIViewController {
    private lazy var customView = RegistrationFieldView()
    override func loadView() {
        view = customView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
   
}
extension RegistrationFieldViewController: RegistrationFieldProtocol {
    func changeProgress(sender: UIProgressView) {
        sender.progress = 0.6
    }
    
    func next() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "progress"), object: nil)
    
        let toViewController = AddVideoViewController()
        let transition = CATransition()
            transition.duration = 0.75
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        transition.type = .push
        transition.subtype = .fromRight
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(toViewController, animated: false)
        print("ff")
    }
    
    func slider() {
        
      
    }
    
    func back() {
        let transition = CATransition()
            transition.duration = 0.75
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        transition.type = .push
        transition.subtype = .fromLeft
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.popViewController(animated: false)
        print("ff")
    }
    
    
}
