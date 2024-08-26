//
//  BottomView.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 18.08.2024.
//

import UIKit

class FDBottomView: UIView {
    
    private let label = UILabel()
    private let view1 = UIView()
    private let view2 = UIImageView()
    
    private let buttonFacebook = {
        let buttonFacebook = UIButton()
        buttonFacebook.addTarget(nil, action: #selector(facebookButtonTapped), for: .touchUpInside)
        return buttonFacebook
    }()
    
    private let buttonGoogle = {
        let buttonGoogle = UIButton()
        buttonGoogle.addTarget(nil, action: #selector(googleButtonTapped), for: .touchUpInside)
        return buttonGoogle
    }()
    
    var buttonGoogleAction:(()-> Void)?
    var buttonFacebookAction:(()-> Void)?
    
    init() {
        super .init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .white
        setupLabel()
        setupView1()
        setupView2()
        setupButton1()
        setupButton2()
    }
    
    private func setupLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Or connect with"
        label.textColor = AppColors.bottomViewGrey
        label.font = .Roboto.regular.size(of: 14)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
    }
    
    private func setupView1() {
        self.addSubview(view1)
        view1.backgroundColor = AppColors.bottomViewGrey.withAlphaComponent(0.3)
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view1.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 0),
            view1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -12),
            view1.heightAnchor.constraint(equalToConstant: 3)
            
        ])
    }
    
    private func setupView2() {
        self.addSubview(view2)
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.image = UIImage(named: "BottomViewimage")
        
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 18),
            view2.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -60),
            view2.heightAnchor.constraint(equalToConstant: 150),
            view2.widthAnchor.constraint(equalToConstant: 282)
        ])
    }
    
   private func setupButton1() {
       self.addSubview(buttonGoogle)
       buttonGoogle.translatesAutoresizingMaskIntoConstraints = false
       buttonGoogle.setImage(UIImage(named: "google"), for: .normal)
       
       NSLayoutConstraint.activate([
        buttonGoogle.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
        buttonGoogle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30)
       ])
    }
    
   private func setupButton2() {
       self.addSubview(buttonFacebook)
       buttonFacebook.translatesAutoresizingMaskIntoConstraints = false
       buttonFacebook.setImage(UIImage(named: "facebook 1"), for: .normal)
       
       NSLayoutConstraint.activate([
        buttonFacebook.rightAnchor.constraint(equalTo: buttonGoogle.leftAnchor, constant: -20),
        buttonFacebook.centerYAnchor.constraint(equalTo: buttonGoogle.centerYAnchor, constant: 0)
       ])
    }
}

private extension FDBottomView {
    
    @objc func googleButtonTapped() {
        buttonGoogleAction?()
    }
    
    @objc func facebookButtonTapped() {
        buttonFacebookAction?()
    }
}

//#Preview("BottomView", traits: .fixedLayout(width: 400, height: 150)) {
//    BottomView()
//}
