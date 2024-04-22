//
//  ListCoordinator.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 22.04.2024.
//

import UIKit

class ListCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("ListCoordinator finish")
    }
}

