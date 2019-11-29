//
//  G_66_plusOne.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/29.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class G_66_plusOne: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlusOne() {
        // 9 -> 1, 0
        let solution = Solution()
        var result = solution.plusOne([9, 9])
        XCTAssertTrue(result == [1, 0, 0])
        
        result = solution.plusOne([9])
        XCTAssertTrue(result == [1,0])
        
    }

}

private class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var output:[Int] = digits
        var carry = 0
        let digit = output[digits.count - 1] + 1
        if digit < 10 {
            output[digits.count - 1] += 1
            return output
        } else {
            carry = 1
            for i in stride(from: digits.count-1, to: -1, by: -1) {
                let digit = output[i] + carry
                carry = digit/10
                output[i] = digit % 10
                print(output, i, "carry:", carry)
            }
            if carry == 1 {
                output.insert(1, at: 0)
            }
            return output
        }
    }
}
