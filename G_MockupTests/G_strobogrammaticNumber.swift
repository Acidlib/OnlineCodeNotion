//
//  G_strobogrammaticNumber.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/28.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

//A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
//Write a function to determine if a number is strobogrammatic. The number is represented as a string.
//Input:  "69"
//Output: true
//
//Input:  "88"
//Output: true
//
//Input:  "962"
//Output: false

//wiki: 0, 1, 8 are symmetrical around the horizontal axis, and 6 and 9 are the same as each other when rotated 180 degrees

//Result:
//Runtime: 4 ms
//Memory Usage: 20.6 MB
//You are free to continue working on this question, but please note that only your first accepted submission will be counted.

class G_strobogrammaticNumber: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testIsStrobogrammatic() {
        let solution = Solution()
        var result = solution.isStrobogrammatic("69")
        XCTAssertTrue(result)
        
        result = solution.isStrobogrammatic("88")
        XCTAssertTrue(result)
        
        result = solution.isStrobogrammatic("962")
        XCTAssertTrue(result == false)
        
    }
}

private class Solution {
    func isStrobogrammatic(_ num: String) -> Bool {
        for n in 0...(num.count/2) {
            let i = num.index(num.startIndex, offsetBy: n)
            let j = num.index(num.startIndex, offsetBy: num.count-n-1)
            if ((num[i] == "0" && num[j] == "0") ||
                (num[i] == "1" && num[j] == "1") ||
                (num[i] == "8" && num[j] == "8") ||
                (num[i] == "6" && num[j] == "9") ||
                (num[i] == "9" && num[j] == "6")) {
                continue
            } else {
                return false
            }
        }
        return true
    }
}
