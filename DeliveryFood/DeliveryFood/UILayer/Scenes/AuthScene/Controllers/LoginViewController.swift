//
//  LoginViewController.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 18.08.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let bottomView = BottomView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    func googleButtonPress() {
        print("goggle button pressed")
    }
    
    func facebookButtonPress() {
        print("facebook button pressed")
    }
}

private extension LoginViewController {
    
    func setupLayout() {
     setupBottomView()
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.buttonGoogleAction = googleButtonPress
        bottomView.buttonFacebookAction = facebookButtonPress
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

//#Preview("LoginViewController") {
//    LoginViewController()
//}
