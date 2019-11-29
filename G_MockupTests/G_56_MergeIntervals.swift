//
//  G_56_MergeIntervals.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/30.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class G_56_MergeIntervals: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testMergeIntervals() {
        let solution = Solution()
        XCTAssertTrue(solution.merge([[4,5],[1,4],[0,1]]) == [[0,5]])
        XCTAssertTrue(solution.merge([[1,4],[4,5]]) == [[1,5]])
        XCTAssertTrue(solution.merge([]) == [])
    }

}

private class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count == 0 { return intervals }
        let sortedIntervals = intervals.sorted { (a, b) -> Bool in
            a[0] < b[0]
        }
        var stack: [[Int]] = [sortedIntervals[0]]
        for i in 1..<sortedIntervals.count {
            if sortedIntervals[i][0] <= stack[stack.count-1][1] {
                if let temp = stack.popLast() {
                    let end = sortedIntervals[i][1] > temp[1] ? sortedIntervals[i][1] : temp[1]
                    stack.append([temp[0], end])
                }
            } else {
                stack.append(sortedIntervals[i])
            }
        }
        return stack
    }
}
