//
//  OnBoardingCoordinator.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 15.04.2024.
//

import UIKit

//MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("OnBoardingCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCorrdinator: self)
    }
}

//MARK: - Navigation
private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController = factory.createOnboardingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
