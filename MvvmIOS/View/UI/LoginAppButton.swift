//
//  LoginAppButton.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 17/07/23.
//

import UIKit

class LoginAppButton: UIButton {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(bacgroundColor:UIColor,title:String,systemImageName:String) {
        super.init(frame: .zero)
        configuration = .tinted()
        configuration?.title = title
        configuration?.baseBackgroundColor = bacgroundColor
        configuration?.baseForegroundColor = bacgroundColor
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
        
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 5
        configuration?.imagePlacement = .leading
    }
    
    

}
