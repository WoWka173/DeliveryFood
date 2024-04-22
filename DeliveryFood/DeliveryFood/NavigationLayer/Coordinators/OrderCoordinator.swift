//
//  OrderCoordinator.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 22.04.2024.
//

import UIKit

class OrderCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .green
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("OrderCoordinator finish")
    }
}

