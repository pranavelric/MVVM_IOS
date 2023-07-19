//
//  EmployeeVCExtension.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 19/07/23.
//
//username: 'kminchelle',
//password: '0lelplR',
import Foundation
import UIKit

private var employees : [EmployeeModel] = []

extension EmployeeViewController : UITableViewDelegate, UITableViewDataSource, EmployeeViewModelDelegate{

    func didReceiveEmployeeResponse(employeeRespone: EmployeeResponseModel?) {

        if(employeeRespone?.users != nil &&  employeeRespone?.total != nil && employeeRespone?.users?.count != nil){
            debugPrint("the users are here")
            employees = employeeRespone!.users!
        }
        else{
            let alert = UIAlertController(title: Contants.ErrorAlertTitle, message: "Something went wrong!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Contants.OkAlertTitle,style: .default,handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as! EmployeeTableViewCell
        cell.employee = employees[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
