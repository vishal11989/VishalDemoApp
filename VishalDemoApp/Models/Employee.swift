//
//  Employee.swift
//  VishalDemoApp
//
//  Created by Vishal Patel on 25/02/20.
//  Copyright © 2020 Vishal Patel. All rights reserved.
//

import Foundation

struct Employee: Decodable {
    let id:String
    let name:String
    let salary:String
    let age:String
    let profileImage:String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
        case profileImage = "profile_image"
    }
}
