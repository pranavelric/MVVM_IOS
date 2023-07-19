//
//  EmployeeResource.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 19/07/23.
//

import Foundation


struct EmployeeResource{
    
    func fetchEmployee(completetion: @escaping (_ result: EmployeeResponseModel?)-> Void){
        let employeeUrl = URL(string: ApiEndpoints.employees )!
        let httpUtility = HttpUtility()
        httpUtility.getApiData(requestUrl: employeeUrl, resultType: EmployeeResponseModel.self){ (employeeResponse) in
            _ = completetion(employeeResponse)
            
            
        }
    }
    
}
