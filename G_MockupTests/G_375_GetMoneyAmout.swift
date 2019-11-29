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
        let result = solution.getMoneyAmount(4)
        XCTAssertTrue(result == 4)
    }

}

private class Solution {
    func getMoneyAmount(_ n: Int) -> Int {
        var payment: [[Int]] = []
        for i in 0..<n {
            payment.append([Int](repeating: 0, count: i+1))

        }
        
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
        return payment[n-1][0]
    }
}
