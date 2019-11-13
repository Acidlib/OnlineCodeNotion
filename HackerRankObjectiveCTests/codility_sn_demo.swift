//
//  codility_sn_demo.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/13.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//  41. First Missing Positive

import XCTest

class codility_sn_demo: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    public func solution(_ A: [Int]) -> Int {
        if A.count == 0 { return 1}
        
        for i in 0...A.count {
            if i != 0 && A.contains(i) == false {
                return i
            }
            if i == A.count {
                return A.count + 1
            }
        }
        
        return 1
    }
}
