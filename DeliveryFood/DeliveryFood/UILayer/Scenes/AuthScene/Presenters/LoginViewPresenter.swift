//
//  LoginViewPresenter.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 26.08.2024.
//

import Foundation

protocol LoginViewOutputProtocol: AnyObject {
    func login()
    func registrartionStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUn()
    func goToForgotPass()
    func back()
}

class LoginPresenter {
    
    private var coordinator: AppCoordinator?
    weak var viewInput: LoginViewInputProtocol?
    
    init(coordinator: AppCoordinator? = nil, viewInput: LoginViewInputProtocol? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
}

extension LoginPresenter: LoginViewOutputProtocol {
    func login() {
        
    }
    
    func registrartionStart() {
        
    }
    
    func goToFacebookLogin() {
        
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        
    }
    
    func goToSignUn() {
        
    }
    
    func goToForgotPass() {
        
    }
    
    func back() {
        
    }
    
    
}
