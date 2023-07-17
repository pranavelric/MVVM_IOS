//
//  LoginRequest.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 16/07/23.
//

import Foundation

struct LoginRequest : Encodable
{
    var userName, userPassword: String?
    
    
    enum CodingKeys: String, CodingKey{
        case userName = "username"
        case userPassword = "password"
    }
}
