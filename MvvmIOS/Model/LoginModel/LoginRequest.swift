//
//  LoginRequest.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 16/07/23.
//

import Foundation

struct LoginRequest : Encodable
{
    var userEmail, userPassword: String?
}
