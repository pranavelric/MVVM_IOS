//
//  LoginResource.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 17/07/23.
//

import Foundation

struct LoginResource{
    
    func loginUser(loginRequest: LoginRequest, completin: @escaping (_ result: LoginResponse?)-> Void){
        let loginUrl = URL(string: ApiEndpoints.login )!
        let httpUtility = HttpUtility()
        do {
            let loginPostBody = try JSONEncoder().encode(loginRequest)
            httpUtility.postApiData(requestUrl: loginUrl, requestBody: loginPostBody, resultType: LoginResponse.self){ (LoginResponse) in
                _ = completin(LoginResponse)
                
            }
        }catch let error {
            debugPrint(error)
        }
        
    }
    
}
