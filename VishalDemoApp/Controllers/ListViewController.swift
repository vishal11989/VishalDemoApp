//
//  ListViewController.swift
//  VishalDemoApp
//
//  Created by Vishal Patel on 25/02/20.
//  Copyright © 2020 Vishal Patel. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblEmployee: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var arrEmployee = [Employee]()
    var employee:Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Employees List"
        
        tblEmployee.register(UINib.init(nibName: "EmployeeCustomCell", bundle: nil), forCellReuseIdentifier: "EmployeeCustomCell")
        tblEmployee.tableFooterView = UIView()
        
        loadEmployeeList()
    }
    
    // MARK: - API Calls
    func loadEmployeeList(){
        
        activity.isHidden = false
        activity.startAnimating()
        
        let apiClient = APIClient()
        apiClient.fetch(url: employeeList) { (response: Result<ServiceResponse<[Employee]>, Error>) in
            switch response {
            case .failure(let error):
                print(error)
            case .success(let res):
                if res.status == "success" {
                    self.arrEmployee = res.data
                }
            }
            
            DispatchQueue.main.async {
                self.tblEmployee.reloadData()
                self.activity.isHidden = true
                self.activity.stopAnimating()
            }
        }
    }
    
    // MARK: - Sort Methods
    func sortByName(){
        arrEmployee.sort { (emp1, emp2) -> Bool in
            return emp1.name < emp2.name
        }
    }
    
    func sortByAge(){
        arrEmployee.sort { (emp1, emp2) -> Bool in
            return emp1.age < emp2.age
        }
    }
    
    // MARK: - Sort Buttons Action
    @IBAction func btnSortByNameClicked(_ sender: Any) {
        sortByName()
        tblEmployee.reloadData()
    }
    
    @IBAction func btnSortByAgeClicked(_ sender: Any) {
        sortByAge()
        tblEmployee.reloadData()
    }
    
    // MARK: - tableView Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEmployee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCustomCell", for: indexPath) as! EmployeeCustomCell
        cell.employee = arrEmployee[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        employee = arrEmployee[indexPath.row]
        self.performSegue(withIdentifier: "ShowEmployeeDetail", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
        arrEmployee.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
     }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEmployeeDetail" {
            let destination = segue.destination as! DetailViewController
            
            if let employee = employee{
                destination.employee = employee
            }
        }
    }

}
