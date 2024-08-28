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
    var viewOutput: LoginViewOutputProtocol?
    
    //MARK: - Views
    private lazy var bottomView = FDBottomView()
    private lazy var titleLabel = UILabel()
    private lazy var signInUsername = FDTextField()
    private lazy var signInPassword = FDTextField()
    private lazy var signUpUsername = FDTextField()
    private lazy var signUpPassword = FDTextField()
    private lazy var signUpReEnterPassword = FDTextField()
    private lazy var forgotLabel = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    private lazy var verticalStack = UIStackView()
    
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

//MARK: - Layout
private extension LoginViewController {
    
    func setupLayout() {
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
            
        case .singIn:
            setupBottomView()
            setupStack()
            setupSignInPassword()
            setupSignInUsername()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
            setupTitleLabel()
            
        case .singUp:
            setupBottomView()
            setupStack()
            setupSignUpUsername()
            setupSignUpPassword()
            setupSignUpReEnterPass()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
        }
    }
    
    func setupStack() {
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        
        switch state {
        case .initial:
            return
            
        case .singIn:
            verticalStack.addArrangedSubview(signInUsername)
            verticalStack.addArrangedSubview(signInPassword)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -262)
            ])
            
        case .singUp:
            verticalStack.addArrangedSubview(signUpUsername)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpReEnterPassword)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -227)
            ])
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
    
    func setupSignInButton() {
        view.addSubview(signInButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In")
        signInButton.scheme = .orange
        signInButton.action = onSingInTapped
        
        switch state {
        case .initial:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
            
        case .singIn:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
            
        case .singUp:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up")
        signUpButton.scheme = .gray
        signUpButton.action = onSingUpTapped
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignInPassword() {
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        signInPassword.placeholder = "Password"
        
        NSLayoutConstraint.activate([
            signInPassword.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signInPassword.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signInPassword.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupSignInUsername() {
        signInUsername.translatesAutoresizingMaskIntoConstraints = false
        signInUsername.placeholder = "Username"
        
        NSLayoutConstraint.activate([
            signInUsername.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signInUsername.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signInUsername.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(of: 24)
        
        switch state {
        case .singIn:
            titleLabel.text = "Sign in"
            
        case .singUp:
            titleLabel.text = "Sign up"
            
        case .initial:
            return
        }
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
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
    
    func setupForgotLabel() {
        view.addSubview(forgotLabel)
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.text = "Forgot Password?"
        forgotLabel.font = .Roboto.regular.size(of: 14)
        forgotLabel.textColor = AppColors.bottomViewGrey
        
        NSLayoutConstraint.activate([
            forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            forgotLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
        ])
        
    }
    
    func setupSignUpPassword() {
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter Password"
        
        NSLayoutConstraint.activate([
            signUpPassword.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signUpPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signUpPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignUpUsername() {
        signUpUsername.translatesAutoresizingMaskIntoConstraints = false
        signUpUsername.placeholder = "Enter Username"
        
        NSLayoutConstraint.activate([
            signUpUsername.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signUpUsername.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signUpUsername.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignUpReEnterPass() {
        signUpReEnterPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpReEnterPassword.placeholder = "Re-enter Password"
        
        NSLayoutConstraint.activate([
            signUpReEnterPassword.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signUpReEnterPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signUpReEnterPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

//MARK: - LoginViewInput delegate
extension LoginViewController: LoginViewInputProtocol {
    func onSingInTapped() {
        switch state {
        case .initial:
            viewOutput?.goToSignIn()
        case .singIn:
            return
        case .singUp:
            return
        }
    }
    
    func onSingUpTapped() {
        switch state {
        case .initial:
            viewOutput?.goToSignUp()
        case .singIn:
            return
        case .singUp:
            return
        }
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    
}

//#Preview("LoginViewController") {
//    LoginViewController(viewOutput: LoginPresenter(), state: .singUp)
//}
