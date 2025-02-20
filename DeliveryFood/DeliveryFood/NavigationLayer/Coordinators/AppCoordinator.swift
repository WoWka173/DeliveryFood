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
        
        if userStorage.passedOnboarding {
            showAuthFlow()
        } else {
            showOnBoardingFlow()
        }
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    func showOnBoardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = factory.createOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.createMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
    func showAuthFlow() {
        guard let navigationController = navigationController else { return }
        let loginCoordinator = factory.createLoginFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        loginCoordinator.start()
    }
}

//MARK: - FinishDelegate
extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCorrdinator: any CoordinatorProtocol) {
        removeChildCoordinator(childCorrdinator)
        
        switch childCorrdinator.type {
        case .onboarding:
            showAuthFlow()
            navigationController?.viewControllers = [ navigationController?.viewControllers.last ?? UIViewController() ]
        case .login:
            showMainFlow()
            navigationController?.viewControllers = [ navigationController?.viewControllers.last ?? UIViewController() ]
        case .app:
            return
        default:
            navigationController?.navigationController?.popToRootViewController(animated: false)
        }
    }
}
