//
//  G_562_LongestLine.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/12/30.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class G_562_LongestLine: XCTestCase {

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

}

private class Solution {
//    Runtime: 356 ms, faster than 70.00% of Swift online submissions for Longest Line of Consecutive One in Matrix.
//    Memory Usage: 21.3 MB, less than 100.00% of Swift online submissions for Longest Line of Consecutive One in Matrix.
    func longestLine(_ M: [[Int]]) -> Int {
        if M.isEmpty || M[0].isEmpty { return 0 }

        // Matrix of Points
        var pm = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 4), count: M[0].count), count: M.count)
        var tempMax = 0

        for i in 0..<M.count {
            for j in 0..<M[0].count {
                if M[i][j] == 1 {
                    pm[i][j][0] = j > 0 ? 1 + pm[i][j - 1][0] : 1   // row info
                    pm[i][j][1] = i > 0 ? 1 + pm[i - 1][j][1] : 1   // col info
                    pm[i][j][2] = (i > 0 && j > 0) ? 1 + pm[i - 1][j - 1][2] : 1    // diganal info
                    pm[i][j][3] = (i > 0 && j < M[0].count - 1) ? 1 + pm[i - 1][j + 1][3] : 1  // anti-diaganal info
                    tempMax = max(pm[i][j][0], pm[i][j][1], pm[i][j][2], pm[i][j][3], tempMax)
                }
            }
        }
        
        return tempMax
    }
}
