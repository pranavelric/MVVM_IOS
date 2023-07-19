//
//  LoginViewController.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 17/07/23.
//

import Foundation
import UIKit

class LoginViewController : UIViewController{
    
    private let userNameTF : UITextField = LoginTextField(placeholderTitle: "Enter username")
    private let passwordTF : UITextField = LoginTextField(placeholderTitle: "Enter password")
    private let loginButton: UIButton = LoginAppButton(bacgroundColor: .green, title: "Login", systemImageName: "list.bullet")
    private var loginViewModel = LoginViewModel()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.delegate = self
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI(){
        configureUserNameTextField()
        configurePasswordTextField()
        configureLoginButton()
        
    }
    
    private func configureUserNameTextField(){
        view.addSubview(userNameTF)
        NSLayoutConstraint.activate([
                  userNameTF.widthAnchor.constraint(equalToConstant: 350),
                  userNameTF.heightAnchor.constraint(equalToConstant: 50),
                  userNameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  userNameTF.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
              ])
    }
    
    private func configurePasswordTextField(){
        view.addSubview(passwordTF)
        
        NSLayoutConstraint.activate([
//            passwordTF.widthAnchor.constraint(equalToConstant: 350),
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            passwordTF.leadingAnchor.constraint(equalTo: userNameTF.leadingAnchor),
            passwordTF.trailingAnchor.constraint(equalTo: userNameTF.trailingAnchor),
            passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 30)
        ])
    }
    
    private func  configureLoginButton(){
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
                    loginButton.widthAnchor.constraint(equalToConstant: 200),
                    loginButton.heightAnchor.constraint(equalToConstant: 50),
                    loginButton.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor),
                    loginButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 30),
                    loginButton.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor)
                    
                ])
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped(){
        
        let request = LoginRequest(userName: userNameTF.text,userPassword: passwordTF.text)
        loginViewModel.loginUser(loginRequest: request)
     }
     
    
}
