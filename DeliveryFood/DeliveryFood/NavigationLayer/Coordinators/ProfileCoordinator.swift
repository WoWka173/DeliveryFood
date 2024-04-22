//
//  ProfileCoordinator.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 22.04.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .gray
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("ProfileCoordinator finish")
    }
}

