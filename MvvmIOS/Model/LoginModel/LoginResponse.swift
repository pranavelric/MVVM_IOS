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
    let firstName: String
    let lastName: String
    let gender : String
    let image : String
    let token : String
    
    enum CodingKeys: String, CodingKey{
        case userName = "username"
        case userID = "id"
        case email = "email"
        case firstName
        case lastName
        case gender
        case image
        case token
    }
}

