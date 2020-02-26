//
//  EmployeeCustomCell.swift
//  VishalDemoApp
//
//  Created by Vishal Patel on 25/02/20.
//  Copyright © 2020 Vishal Patel. All rights reserved.
//

import UIKit
import Kingfisher
class EmployeeCustomCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    var employee:Employee?{
        didSet{
            setDataInView()
        }
    }
    
    func setDataInView(){
        guard let employee = employee else { return }
        
        lblName.text = employee.name
        
        let url = URL(string: employee.profileImage)
        imgProfile.kf.setImage(with: url)
    }
}
