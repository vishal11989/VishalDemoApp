//
//  DetailViewController.swift
//  VishalDemoApp
//
//  Created by Vishal Patel on 25/02/20.
//  Copyright © 2020 Vishal Patel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var employee:Employee?
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataInView()
    }
    
    func setDataInView(){
        
        guard let employee = employee else { return }
        
        self.title = employee.name
        
        lblName.text = employee.name
        lblAge.text = employee.age
        lblSalary.text = employee.salary
        
        let url = URL(string: employee.profileImage)
        imgProfile.kf.setImage(with: url)
    }
    
}
