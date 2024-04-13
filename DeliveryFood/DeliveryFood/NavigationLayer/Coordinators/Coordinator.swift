//
//  Coordinator.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 13.04.2024.
//

import UIKit

enum CoordinatorType {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
}

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get set }
    var navigationController: UIViewController? { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCorrdinator: CoordinatorProtocol)
}

extension CoordinatorProtocol {
 func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
     childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter{ $0 !== childCoordinator }
    }
}



