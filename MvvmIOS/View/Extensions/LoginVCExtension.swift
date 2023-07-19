//
//  LoginVCExtension.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 18/07/23.
//

import Foundation
import UIKit


extension LoginViewController : LoginViewModelDelegate{
    func didReceiveLoginResponse(loginResponse: LoginResponse?) {
        if(loginResponse?.message == nil && loginResponse?.userID != nil){
            debugPrint("navigate to different view controller")
            let nextViewController = EmployeeViewController()
            present(nextViewController, animated: true)
        }
        else{
            let alert = UIAlertController(title: Contants.ErrorAlertTitle, message: loginResponse?.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Contants.OkAlertTitle,style: .default,handler: nil))
            self.present(alert, animated: true)
        }
    }
}
