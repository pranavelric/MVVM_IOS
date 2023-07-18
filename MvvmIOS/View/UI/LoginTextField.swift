//
//  LoginTextField.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 17/07/23.
//

import UIKit

class LoginTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    init(placeholderTitle: String){
        super.init(frame: .zero)
       
        self.frame = CGRect(x: 50, y: 100, width: 350, height: 20)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.borderStyle = .roundedRect
        self.textAlignment = .center
//        self.textColor = .white
        self.placeholder = placeholderTitle
        self.clearsOnBeginEditing = true
        
    }

}
