//
//  G_1055_ShortestWay.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/12/31.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class G_1055_ShortestWay: XCTestCase {

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
    
    func testShortestWay() {
        let solution = Solution()
        var result = -1
        
        result = solution.shortestWay("abc", "acdbc")
        XCTAssertTrue(result == -1)
        
        result = solution.shortestWay("xyz", "xzyxz")
        XCTAssertTrue(result == 3)
        
        result = solution.shortestWay("abc", "abcbc")
        XCTAssertTrue(result == 2)
        
    }

}

private class Solution {
    // greedy search
    // Runtime: 1192 ms, faster than 28.89% of Swift online submissions for Shortest Way to Form String.
    // Memory Usage: 20.5 MB, less than 100.00% of Swift online submissions for Shortest Way to Form String.
    func shortestWay(_ source: String, _ target: String) -> Int {
        let S = Array(source)
        let T = Array(target)
        
        var partitionCount = 0
        var targetIndex = 0
        
        var charIncluded = true
        
        while targetIndex < T.count {
            partitionCount += 1
            charIncluded = false
            for c in 0..<S.count {
                if targetIndex < target.count, S[c] == T[targetIndex] {
                    targetIndex += 1
                    charIncluded = true
                }
            }
            if charIncluded == false {
                return -1
            }
        }
        return partitionCount == 0 ? -1 : partitionCount
    }
}
