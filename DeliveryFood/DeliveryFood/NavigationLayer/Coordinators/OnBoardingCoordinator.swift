//
//  OnBoardingCoordinator.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 15.04.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("OnBoardingCoordinator finish")
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .yellow
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .purple
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .brown
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        let presenter = OnBoardingViewPresenter(coordinator: self)
        let viewController = OnBoardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
