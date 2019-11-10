//
//  223_leetcode_rectangle_area.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/10.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//  https://leetcode.com/problems/rectangle-area/

import XCTest

class _23_leetcode_rectangle_area: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testComputeArea() {
        let solution = Solution()
        
        var result = solution.computeArea(-2, -2, 2, 2, 3, 3, 4, 4)
        XCTAssertTrue(result == 17)
        
        result = solution.computeArea(-5, -5, 0, 3, -3, -3, 3, 3)
        XCTAssert(result == 58)
        
        result = solution.computeArea(-3, 0, 3, 4, 0, -1, 9, 2)
        XCTAssertTrue(result == 45)
        
        result = solution.computeArea(-2, -2, 2, 2, -2, -2, 2, 2)
        XCTAssertTrue(result == 16)
    }
}

class Solution {
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        var intercept: Int = 0
        if A > E && A > G || C < E && C < G || B > H && B > F || F > D && F > B {
            // ignore
        } else {
            let sortedRow = [A, C, G, E].sorted()
            let sortedCol = [B, D, H, F].sorted()
            intercept = (sortedRow[2] - sortedRow[1]) * (sortedCol[2] - sortedCol[1])
        }
        return (C-A)*(D-B) + (G-E)*(H-F) - intercept
    }
}
