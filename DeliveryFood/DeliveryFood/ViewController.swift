//
//  ViewController.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 08.04.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = "Hello World"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        label.font = .systemFont(ofSize: 40, weight: UIFont.Weight(20))
        label.textColor = .white
    }


}

