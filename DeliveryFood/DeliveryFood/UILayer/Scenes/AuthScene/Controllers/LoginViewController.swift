//
//  LoginViewController.swift
//  DeliveryFood
//
//  Created by Владимир Курганов on 18.08.2024.
//

import UIKit

enum LoginViewState {
    case initial
    case singIn
    case singUp
}

protocol LoginViewInputProtocol: AnyObject {
    func onSingInTapped()
    func onSingUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
}

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    private var state: LoginViewState = .initial
    weak var viewOutput: LoginViewOutputProtocol?
    
    //MARK: - Views
    private lazy var bottomView = FDBottomView()
    private lazy var textField = FDTextField()
    private lazy var logoImage = UIImageView()
    private lazy var singInButton = FDButton()
    private lazy var singUpButton = FDButton()
    
    //MARK: - Inits
    init(viewOutput: LoginViewOutputProtocol, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    func googleButtonPress() {
        print("goggle button pressed")
    }
    
    func facebookButtonPress() {
        print("facebook button pressed")
    }
}

private extension LoginViewController {
    
    func setupLayout() {
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSingInButton()
            setupSingUpButton()
            
        case .singIn:
            setupBottomView()
            setupTextField()
            
        case .singUp:
            setupBottomView()
            setupTextField()
        }
    }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .loginLogo)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 109),
            logoImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 57),
            logoImage.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor)
        ])
    }
    
    func setupSingInButton() {
        view.addSubview(singInButton)
        
        singInButton.translatesAutoresizingMaskIntoConstraints = false
        singInButton.setTitle("Sing In")
        singInButton.scheme = .gray
        
        NSLayoutConstraint.activate([
            singInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
            singInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            singInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            singInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSingUpButton() {
        view.addSubview(singUpButton)
        
        singUpButton.translatesAutoresizingMaskIntoConstraints = false
        singUpButton.setTitle("Sing Up")
        singUpButton.scheme = .orange
        
        NSLayoutConstraint.activate([
            singUpButton.topAnchor.constraint(equalTo: singInButton.bottomAnchor, constant: 20),
            singUpButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            singUpButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            singUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 354)
            
        ])
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.buttonGoogleAction = googleButtonPress
        bottomView.buttonFacebookAction = facebookButtonPress
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

extension LoginViewController: LoginViewInputProtocol {
    func onSingInTapped() {
        
    }
    
    func onSingUpTapped() {
        
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    
}

#Preview("LoginViewController") {
   
    LoginViewController(viewOutput: LoginPresenter(), state: .initial)
}
