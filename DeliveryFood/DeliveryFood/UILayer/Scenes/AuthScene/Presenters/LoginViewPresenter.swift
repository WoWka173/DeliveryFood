//
//  LoginViewPresenter.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 26.08.2024.
//

import Foundation

protocol LoginViewOutputProtocol: AnyObject {
    func loginStart(login: String, password: String)
    func registrartionStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPass()
    func back()
}

class LoginPresenter {
    
    private var coordinator: LoginCoordinator?
    weak var viewInput: LoginViewInputProtocol?
    
    init(coordinator: LoginCoordinator? = nil, viewInput: LoginViewInputProtocol? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
}

private extension LoginPresenter {
    func goToMainScreen() {
        coordinator?.finish()
    }
}

extension LoginPresenter: LoginViewOutputProtocol {
    func loginStart(login: String, password: String) {
        viewInput?.startLoader()
        if login == "Test" && password == "123" {
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                DispatchQueue.main.async {
                    self.goToMainScreen()
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                print("wrong email or password")
                self.viewInput?.stopLoader()
            }
        }
    }
    
    func registrartionStart() {
        
    }
    
    func goToFacebookLogin() {
        
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        coordinator?.showSignInScene()
    }
    
    func goToSignUp() {
        coordinator?.showSignUpScene()
    }
    
    func goToForgotPass() {
        
    }
    
    func back() {
        
    }
}
