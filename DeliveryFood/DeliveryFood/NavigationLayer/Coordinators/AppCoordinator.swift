//
//  AppCoordinator.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 13.04.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        showOnBoardingFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    func showOnBoardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCorrdinator: any CoordinatorProtocol) {
        removeChildCoordinator(childCorrdinator)
        
        switch childCorrdinator.type {
        case .app:
            return
        default:
            navigationController?.navigationController?.popToRootViewController(animated: false)
        }
    }
}
