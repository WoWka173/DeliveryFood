//
//  FDTextField.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 26.08.2024.
//

import UIKit

class FDTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.layer.cornerRadius = 24
        self.backgroundColor = AppColors.gray
        self.font = UIFont.Roboto.regular.size(of: 14)
        self.placeholder = "Enter text"
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        self.leftView = paddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}
