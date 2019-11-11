//
//  Codility_R_demo.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/11.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class Codility_R_demo: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testCase() {
        var a = [1, 3, 6, 4, 1, 2]
        let result = solution(&a)
        XCTAssertTrue(result == 5)
    }

}

public func solution(_ A : inout [Int]) -> Int {
    var primer = 1
    let sortedA = A.sorted()
    for i in 0..<A.count {
        if sortedA[i] == primer {
            primer += 1
        }
    }
    return primer
}

