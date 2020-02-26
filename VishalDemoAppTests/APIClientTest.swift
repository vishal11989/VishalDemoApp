//
//  APIClientTest.swift
//  VishalDemoAppTests
//
//  Created by Vishal Patel on 26/02/20.
//  Copyright © 2020 Vishal Patel. All rights reserved.
//

import XCTest
@testable import VishalDemoApp

class APIClientTest: XCTestCase {

    let apiClient = APIClient()
    
    func testFetchEmployeeListService() {
        
        let serviceExpectation = expectation(description: "Completion handler invoked")
        
        var responseError: Error?
        var arrEmployee = [Employee]()
        
        apiClient.fetch(url: employeeList) { (response: Result<ServiceResponse<[Employee]>, Error>) in
            switch response {
            case .failure(let error):
                responseError = error
            case .success(let res):
                if res.status == "success" {
                    arrEmployee = res.data
                }
                serviceExpectation.fulfill()
            }
        }
        
        wait(for: [serviceExpectation], timeout: 5.0)
        
        XCTAssertNil(responseError)
        XCTAssertTrue(arrEmployee.count > 0, "Getting empty Employee list")

    }

}
