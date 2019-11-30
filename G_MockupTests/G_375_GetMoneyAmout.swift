//
//  G_375_GetMoneyAmout.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/29.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//
// ref: https://leetcode.com/problems/guess-number-higher-or-lower-ii/discuss/414928/A-long-but-quickclear-python-solution-with-explain

import XCTest

class G_375_GetMoneyAmout: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testMoneyAmount() {
        let solution = Solution()
        XCTAssertTrue(solution.getMoneyAmount(4) == 4)
        
        let soutionBoost = SolutionBoost()
        XCTAssertTrue(soutionBoost.getMoneyAmount(4) == 4)
    }
}

//Runtime: 176 ms, faster than 18.75% of Swift online submissions for Guess Number Higher or Lower II.
//Memory Usage: 22 MB, less than 100.00% of Swift online submissions for Guess Number Higher or Lower II.
private class Solution {
    func getMoneyAmount(_ n: Int) -> Int {
        var payment: [[Int]] = []
        if n < 2 {
            return 0
        }
        let start = Date()
        for i in 0..<n {
            payment.append([Int](repeating: 0, count: i+1))
        }
        print("timeInterval: \(start.timeIntervalSince1970 - Date().timeIntervalSince1970)")
        
        for i in 0..<n {
            for j in stride(from: i, to: -1, by: -1) {
                print(index)
                if i == j {
                    payment[i][j] = 0
                } else if i == j+1 {
                    payment[i][j] = j+1
                } else if i == j+2 {
                    payment[i][j] = j+2
                } else {
                    var minValue = min(j+1+payment[i][j+1], i+1+payment[i-1][j])
                    for k in j+1..<i {
                        let num = k+1+max(payment[k-1][j],payment[i][k+1])
                        if num < minValue {
                            minValue = num
                        }
                    }
                    payment[i][j] = minValue
                }
            }
        }
        print(payment)
        return payment[n-1][0]
    }
}

//Runtime: 92 ms, faster than 43.75% of Swift online submissions for Guess Number Higher or Lower II.
//Memory Usage: 20.8 MB, less than 100.00% of Swift online submissions for Guess Number Higher or Lower II.
private class SolutionBoost {
    func getMoneyAmount(_ n: Int) -> Int {
        if n < 2 {
            return 0
        }
        var dp: [[Int]] = []
        for i in 0...n {
            dp.append([])
            for j in 0...n {
                dp[i].append(0)
            }
        }
        
        for i in 0...n {
            dp[i][i] = 0
        }
        for offset in 1..<n {
            for i in 1...n-offset {
                let j = i + offset
                var v = Int.max
                for k in i...j {
                    let left = dp[i][k-1]
                    let right = k < j ? dp[k+1][j] : 0
                    v = min(v, max(left, right) + k)
                }
                dp[i][j] = v
            }
        }
        return dp[1][n]
    }
}

//------ i = 1,  j = 2
//left:1, 0  right: 2, 2
//left:1, 1  right: 0
//------ 2 3
//left:2, 1  right: 3, 3
//left:2, 2  right: 0
//------ 3 4
//left:3, 2  right: 4, 4
//left:3, 3  right: 0
//------ 1 3
//left:1, 0  right: 2, 3
//left:1, 1  right: 3, 3
//left:1, 2  right: 0
//------ 2 4
//left:2, 1  right: 3, 4
//left:2, 2  right: 4, 4
//left:2, 3  right: 0
//------ 1 4
//left:1, 0  right: 2, 4
//left:1, 1  right: 3, 4
//left:1, 2  right: 4, 4
//left:1, 3  right: 0
//
//[[0, 0, 0, 0, 0],
//[0, 0, 1, 2, 4],
//[0, 0, 0, 2, 3],
//[0, 0, 0, 0, 3],
//[0, 0, 0, 0, 0]]"
