//
//  LoginViewModel.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 16/07/23.
//

import Foundation

protocol LoginViewModelDelegate{
    func didReceiveLoginResponse(loginResponse: LoginResponse?)
}

struct LoginViewModel{
    var delegate: LoginViewModelDelegate?
    func loginUser(loginRequest : LoginRequest){
        let validationResult = LoginValidation().Validate(loginRequest: loginRequest)
        if (validationResult.success){
            //use loginResource to call login API
        }
    }
}
