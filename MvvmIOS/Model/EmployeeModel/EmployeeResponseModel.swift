//
//  EmployeeModel.swift
//  MvvmIOS
//
//  Created by Pranav Choudhary on 17/07/23.
//

import Foundation

struct EmployeeResponseModel : Codable{
    
   let users: [EmployeeModel]?
   let total: Int?
   let skip: Int?
   let limit: Int?
}

struct EmployeeModel : Codable{
    let id: Int?
    let firstName: String?
    let lastName: String?
    let maidenName: String?
    let age: Int?
    let gender: String?
    let email: String?
    let phone: String?
    let username: String?
    let password: String?
    let birthDate: String?
    let image: String?
    let bloodGroup: String?
    let height: Double?
    let weight: Double?
    let eyeColor: String?
    let hair: HairData?
    let domain: String?
    let ip: String?
    let address: AddressData?
    let macAddress: String?
    let university: String?
    let bank: BankData?
    let company: CompanyData?
    let ein: String?
    let ssn: String?
    let userAgent: String?
}



struct HairData: Codable {
    let color: String?
    let type: String?
}

struct AddressData: Codable {
    let address: String?
    let city: String?
    let coordinates: CoordinatesData?
    let postalCode: String?
    let state: String?
}

struct CoordinatesData: Codable {
    let lat: Double?
    let lng: Double?
}

struct BankData: Codable {
    let cardExpire: String?
    let cardNumber: String?
    let cardType: String?
    let currency: String?
    let iban: String?
}

struct CompanyData: Codable {
    let address: AddressData?
    let department: String?
    let name: String?
    let title: String?
}
