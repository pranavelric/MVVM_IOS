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
            let loginResource = LoginResource()
            loginResource.loginUser(loginRequest: loginRequest){ (loginApiResponse) in
                DispatchQueue.main.async {
                    self.delegate?.didReceiveLoginResponse(loginResponse: loginApiResponse)
                }
                
            }
        }
        self.delegate?.didReceiveLoginResponse(loginResponse: LoginResponse(errorMessage: validationResult.error, data: nil))
    }
}
