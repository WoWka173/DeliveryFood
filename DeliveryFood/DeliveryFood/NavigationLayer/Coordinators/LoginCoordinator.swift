//
//  LoginCoordinator.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 08.09.2024.
//

import Foundation

//MARK: - LoginCoordinator
class LoginCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
        showAuthScene()
    }
    
    override func finish() {
        print("LoginCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCorrdinator: self)
    }
}

//MARK: - Navigation
extension LoginCoordinator {
    func showAuthScene() {
        guard let navigationController = navigationController else { return }
        let authViewController = factory.makeAuthScene(coordinator: self)
        navigationController.pushViewController(authViewController, animated: true)
    }
    
    func showSignInScene() {
        guard let navigationController = navigationController else { return }
        let signInViewController = factory.makeSignInScene(coordinator: self)
        navigationController.pushViewController(signInViewController, animated: true)
    }
    
    func showSignUpScene() {
        guard let navigationController = navigationController else { return }
        let signUpViewController = factory.makeSignUpScene(coordinator: self)
        navigationController.pushViewController(signUpViewController, animated: true)
    }
}
