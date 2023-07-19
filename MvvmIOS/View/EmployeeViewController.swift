//
//  EmployeeViewController.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 18/07/23.
//

import UIKit

class EmployeeViewController: UIViewController {
    

    private var employeeViewModel : EmployeeViewModel = EmployeeViewModel()
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
           view.backgroundColor = .red

           employeeViewModel.delegate = self
           fetchData()
           setupUI()
    }
    
    private func fetchData(){

        employeeViewModel.fetchUser()
    }
    private func setupUI(){
//        let screenSize: CGRect = view.bounds
//            
//            let screenWidth = screenSize.width
//            let screenHeight = screenSize.height
//     
//            tableView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        view.addSubview(tableView)
 
                
        // Table view constraints
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
    }
//    @objc func buttonTapped() {
//        // Handle button tap action
//    }


}
