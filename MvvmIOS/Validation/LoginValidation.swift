//
//  LoginValidation.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 16/07/23.
//

import Foundation

struct LoginValidation{
    
    func Validate(loginRequest: LoginRequest)-> ValidationResult{
        if(loginRequest.userName!.isEmpty){
            return ValidationResult(success: false, error: "User email is empty")
        }
        if(loginRequest.userPassword!.isEmpty){
            print("here")
            return ValidationResult(success: false, error: "User password is empty")
        }
        return ValidationResult(success: true, error: nil) 
        
    }
    
}
