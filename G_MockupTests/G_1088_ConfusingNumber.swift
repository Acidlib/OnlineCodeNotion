//
//  G_1088_ConfusingNumber.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/12/31.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class G_1088_ConfusingNumber: XCTestCase {

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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testCofuseNumber() {
        let solution = Solution()
        var result = false
        result = solution.confusingNumber(25)
        XCTAssertTrue(result == false)

        result = solution.confusingNumber(11)
        XCTAssertTrue(result == false)

        result = solution.confusingNumber(89)
        XCTAssertTrue(result == true)

        result = solution.confusingNumber(667)
        XCTAssertTrue(result == false)
        
        result = solution.confusingNumber(916)
        XCTAssertTrue(result == false)
    }
}

private class Solution {
    // Runtime: 4 ms, faster than 94.12% of Swift online submissions for Confusing Number.
    // Memory Usage: 21.2 MB, less than 100.00% of Swift online submissions for Confusing Number.
    func confusingNumber(_ N: Int) -> Bool {
        let num = String(N).compactMap{ $0.wholeNumberValue }
        var newNum: [Int] = []
        
        for n in stride(from: num.count-1, to: -1, by: -1) {
            if let newn = revertibleNumber(N: num[n]) {
                newNum.append(newn)
                continue
            } else {
                return false
            }
        }
        return num != newNum
    }
    
    func revertibleNumber(N: Int) -> Int? {
        if N == 6 {
            return 9
        } else if N == 9 {
            return 6
        } else if N == 1 {
            return 1
        } else if N == 0 {
            return 0
        } else if N == 8 {
            return 8
        } else {
            return nil
        }
    }
}
