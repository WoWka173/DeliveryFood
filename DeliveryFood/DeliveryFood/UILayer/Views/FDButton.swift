//
//  FDButton.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 25.08.2024.
//

import UIKit


enum FDButtonColorSchemes {
    case white
    case orange
    case gray
}

class FDButton: UIView {
    
    private let button = UIButton()
    var action: (() -> Void)?
    var scheme: FDButtonColorSchemes = .white {
        didSet {
            setColorScheme(scheme: scheme)
        }
    }
    
    init(scheme: FDButtonColorSchemes = .white) {
        super .init(frame: .zero)
        self.scheme = scheme
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupButton()
        
    }
    
    private func setupButton() {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = AppColors.gray
        button.titleLabel?.font = .Roboto.bold.size(of: 18)
        button.setTitleColor(AppColors.black, for: .normal)
        button.layer.cornerRadius = 24
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
       
    }
    
    private func setColorScheme(scheme: FDButtonColorSchemes) {
        switch scheme {
        case .white:
            button.backgroundColor = AppColors.white
            button.setTitleColor(AppColors.mainOrange, for: .normal)
        case .orange:
            button.backgroundColor = AppColors.mainOrange
            button.setTitleColor(AppColors.white, for: .normal)
        case .gray:
            button.backgroundColor = AppColors.gray
            button.setTitleColor(AppColors.black, for: .normal)
        }
    }
    
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }
    
    @objc
    func buttonPressed() {
        guard let action = self.action else { return }
        action()
    }
}
