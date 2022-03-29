//
//  ProgressView.swift
//  DatingApp
//
//  Created by user on 09.03.2022.
//

import UIKit
protocol ProgressViewProtocol: AnyObject {
   
}
final class ProgressView: UIView {
    
    weak var delegate: ProgressViewProtocol?
    
    var progresBar: UIProgressView  = {
        let progress = UIProgressView()
        progress.tintColor = #colorLiteral(red: 0.8588235294, green: 0.7058823529, blue: 0.9803921569, alpha: 1)
        progress.trackTintColor = #colorLiteral(red: 0.937254902, green: 0.8549019608, blue: 1, alpha: 1)
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progress = 0.1
        progress.layer.zPosition = 1
        return progress
    }()
    let viewCorner: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.layer.zPosition = -1
        return view
    }()
     init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        viewCorner.translatesAutoresizingMaskIntoConstraints = false
        addSubview(progresBar)
        addSubview(viewCorner)
        NSLayoutConstraint.activate([
            
            
            progresBar.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            progresBar.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            progresBar.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            progresBar.heightAnchor.constraint(equalToConstant: 4),
            viewCorner.centerYAnchor.constraint(equalTo: topAnchor),
            viewCorner.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            viewCorner.heightAnchor.constraint(equalToConstant: 30),
            
        ])
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addChildView(_ view: UIView)  {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: viewCorner.bottomAnchor),
            view.rightAnchor.constraint(equalTo: rightAnchor),
            view.leftAnchor.constraint(equalTo: leftAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
    }
   
}
