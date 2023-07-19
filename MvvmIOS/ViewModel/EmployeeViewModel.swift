//
//  EmployeeViewModel.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 19/07/23.
//

import Foundation

protocol EmployeeViewModelDelegate{
    func didReceiveEmployeeResponse(employeeRespone: EmployeeResponseModel?)
}

struct EmployeeViewModel{
    var delegate: EmployeeViewModelDelegate?
    func fetchUser(){

        let employeeResource = EmployeeResource()
        employeeResource.fetchEmployee(){ (employeeResponse) in
            DispatchQueue.main.async {
                self.delegate?.didReceiveEmployeeResponse(employeeRespone: employeeResponse)
            }
            
        }
    }
}
