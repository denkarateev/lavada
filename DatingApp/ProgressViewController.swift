//
//  ProgressViewController.swift
//  DatingApp
//
//  Created by user on 09.03.2022.
//

import UIKit

class ProgressViewController: UIViewController {
    private lazy var customView = ProgressView()
    override func loadView() {
        view = customView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customView.progresBar.progress = 0.1
       
    }
    override func addChild(_ childController: UIViewController) {
        super.addChild(childController)
        customView.addChildView(childController.view)
        childController.didMove(toParent: self)
       
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(progress), name:NSNotification.Name(rawValue: "progress"), object: nil)
    }
    @objc func progress() {
        customView.progresBar.progress += 0.1
    }
}

