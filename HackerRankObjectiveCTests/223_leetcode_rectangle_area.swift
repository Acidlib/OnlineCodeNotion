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
        let result = solution.computeArea(-3, 0, 3, 4, 0, -1, 9, 2)
        XCTAssertTrue(result == 45)
    }

}

class Solution {
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        
    }
}