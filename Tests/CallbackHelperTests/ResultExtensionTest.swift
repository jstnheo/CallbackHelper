//
//  ResultExtensionTest.swift
//  KinsaKitTests
//
//  Created by Jon Trainer on 5/7/19.
//  Copyright © 2019 Kinsa, Inc. All rights reserved.
//

import XCTest
@testable import CallbackHelper

class ResultExtensionTest: XCTestCase {

    func test_success_convenience() {
        let result: Result<Void, Error> = Result.success
        if case .success = result {
            XCTAssert(true)
        }
    }
    
    func test_fail_convenience() {
        let testError = NSError(domain: "test", code: 123, userInfo: nil)
        let result: Result<Void, Error> = Result.failure(testError)

        if case .failure(let error) = result {
            XCTAssertNotNil(error)
        }
    }
    
    func test_fail() {
        XCTAssert(false)
    }
}
