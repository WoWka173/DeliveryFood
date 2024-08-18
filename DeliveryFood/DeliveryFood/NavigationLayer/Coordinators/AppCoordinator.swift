//
//  AppCoordinator.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 13.04.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
//        userStorage.passedOnboarding = false
//        if userStorage.passedOnboarding {
//            showMainFlow()
//        } else {
//            showOnBoardingFlow()
//        }
        
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    func showOnBoardingFlow() {
        guard let navigationController = navigationController else { return }
        factory.createOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.createMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCorrdinator: any CoordinatorProtocol) {
        removeChildCoordinator(childCorrdinator)
        
        switch childCorrdinator.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        case .app:
            return
        default:
            navigationController?.navigationController?.popToRootViewController(animated: false)
        }
    }
}
