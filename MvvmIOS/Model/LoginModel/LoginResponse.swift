//
//  LoginResponse.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 16/07/23.
//

import Foundation

struct LoginResponse: Decodable{
    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData : Decodable{
    let userName: String
    let userID: Int
    let email : String
    
    enum CodingKeys: String, CodingKey{
        case userName
        case userID = "userid"
        case email
    }
}

