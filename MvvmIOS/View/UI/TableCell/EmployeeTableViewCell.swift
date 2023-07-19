//
//  EmployeeTableViewCell.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 18/07/23.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    static let identifier = "EMPLOYEE_CELL"
    // UI elements
       private let profileImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFit
           imageView.layer.cornerRadius = 25
           imageView.clipsToBounds = true
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contactDetailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // Constraints
    private var expandedConstraints: [NSLayoutConstraint] = []
    private var collapsedConstraints: [NSLayoutConstraint] = []
   
    
    // Flag to track cell state
    private var isExpanded: Bool = false {
        didSet {
            toggleCellExpansion()
        }
    }
    
    
    // Employee model object
    var employee :EmployeeModel?{
        didSet{
            configureCell()
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .blue
        setupUI()
        configureGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(contactDetailsLabel)
        
        // Profile Image View constraints
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Name Label constraints
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ])
        
        // Contact Details Label constraints
        NSLayoutConstraint.activate([
            contactDetailsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contactDetailsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            contactDetailsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contactDetailsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        // Collapsed constraints
       collapsedConstraints = [
           contactDetailsLabel.heightAnchor.constraint(equalToConstant: 0)
       ]
        
        // Expanded constraints
        expandedConstraints = [
            contactDetailsLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ]
        
        // Activate collapsed constraints initially
        NSLayoutConstraint.activate(collapsedConstraints)
        
    }
    
    private func configureGestureRecognizer(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        contentView.addGestureRecognizer(tapGesture)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func toggleCellExpansion(){
        NSLayoutConstraint.deactivate(isExpanded ? collapsedConstraints : expandedConstraints)
        NSLayoutConstraint.activate(isExpanded ? expandedConstraints:collapsedConstraints)
        UIView.animate(withDuration: 0.3){
            self.contentView.layoutIfNeeded()
        }
        
    }
    
    @objc private func cellTapped(){
        isExpanded.toggle()
    }
    
    // MARK: - Cell Configuration
    
    private func configureCell() {
        guard let employee = employee else {
            return
        }
        let imageURL = NSURL(string: employee.image ?? "")
        let imagedData = NSData(contentsOf: imageURL! as URL)!
        profileImageView.image = UIImage(data: imagedData as Data)
//        profileImageView.image = UIImage(named: employee.image)
        nameLabel.text = "\(employee.firstName!) \(employee.lastName!)"
        contactDetailsLabel.text = "Phone: \(employee.phone!)\nEmail: \(employee.email!)\nAddress: \(employee.address!)"
    }
    

}
