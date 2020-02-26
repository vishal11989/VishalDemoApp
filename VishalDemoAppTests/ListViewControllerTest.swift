//
//  ListViewControllerTest.swift
//  VishalDemoAppTests
//
//  Created by Vishal Patel on 26/02/20.
//  Copyright © 2020 Vishal Patel. All rights reserved.
//

import XCTest
@testable import VishalDemoApp

class ListViewControllerTest: XCTestCase {

    let listController = ListViewController()
    
    func testSortByNameFunctanaity(){
        
        let emp1 = Employee.init(id: "1", name: "Zara", salary: "170750", age: "63")
        let emp2 = Employee.init(id: "2", name: "Adolf", salary: "320800", age: "61")
        
        let arrEmployee = [emp1, emp2]
        listController.arrEmployee = arrEmployee
        listController.sortByName()
        
        let firstEmployee = listController.arrEmployee[0]
        let secondEmployee = listController.arrEmployee[1]
        
        XCTAssertTrue(firstEmployee.name == "Adolf", "Sort By Name is Not working")
        XCTAssertTrue(secondEmployee.name == "Zara", "Sort By Name is Not working")
    }
    
    func testSortByAgeFunctanaity(){
        
        let emp1 = Employee.init(id: "1", name: "Zara", salary: "170750", age: "63")
        let emp2 = Employee.init(id: "2", name: "Adolf", salary: "320800", age: "61")
        
        let arrEmployee = [emp1, emp2]
        listController.arrEmployee = arrEmployee
        listController.sortByAge()
        
        let firstEmployee = listController.arrEmployee[0]
        let secondEmployee = listController.arrEmployee[1]
        
        XCTAssertTrue(firstEmployee.age == "61", "Sort By Age is Not working")
        XCTAssertTrue(secondEmployee.age == "63", "Sort By Age is Not working")
    }
    

}
