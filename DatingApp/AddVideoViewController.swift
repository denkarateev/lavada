//
//  AddVideoViewController.swift
//  DatingApp
//
//  Created by user on 17.03.2022.
//

import UIKit
protocol AddVideoViewProtocol: AnyObject {
    func back()
    func addVideo() 
}
class AddVideoViewController: UIViewController {
    private lazy var customView = AddViewView()
    override func loadView() {
        view = customView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        customView.delegate = self 
    }
//    func createAlertActionVideo() {
//        let alert = UIAlertController(title: "Add video", message: "Add video", preferredStyle: .actionSheet)
//        let recordAction = UIAlertAction(title: "Record", style: .default) { action in
//            VideoService.instance.launchVideoRecorder(in: self, completion: nil)
//        }
//       
//        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
//      
////    
//        subview.backgroundColor = #colorLiteral(red: 0, green: 0.06274509804, blue: 0.137254902, alpha: 1)
//        alert.view.tintColor = UIColor.white
//        
//        let downlodAction = UIAlertAction(title: "Download", style: .default) { action in
//            
//        }
//       
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//        
//        alert.addAction(recordAction)
//        alert.addAction(downlodAction)
//        alert.addAction(cancelAction)
//        present(alert, animated: true, completion: nil)
//    }
}
extension AddVideoViewController: AddVideoViewProtocol {
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
    
    func addVideo() {
       
      let controller22 = ProfileVideoViewController()
        
        controller22.modalPresentationStyle = .fullScreen
        present(controller22, animated: true, completion: nil)
       
    }
    
    
}
