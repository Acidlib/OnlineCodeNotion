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
        XCTAssertTrue(solution.plusOne([9, 9]) == [1, 0, 0])
        XCTAssertTrue(solution.plusOne([9]) == [1,0])
        
        let solutionBoost = SolutionBoost()
        XCTAssertTrue(solutionBoost.plusOne([9, 9]) == [1, 0, 0])
        XCTAssertTrue(solutionBoost.plusOne([9]) == [1,0])
    }

}

//Runtime: 16 ms, faster than 13.68% of Swift online submissions for Plus One.
//Memory Usage: 21.7 MB, less than 20.00% of Swift online submissions for Plus One.
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

// only do operation when value equals to 9
//Runtime: 8 ms, faster than 75.87% of Swift online submissions for Plus One.
//Memory Usage: 21.2 MB, less than 20.00% of Swift online submissions for Plus One.
private class SolutionBoost {
    func plusOne(_ digits: [Int]) -> [Int] {
        return plusOne(digits.reversed(), at: 0).reversed()
    }
    
    func plusOne(_ digits: [Int], at: Int) -> [Int] {
        var output:[Int] = digits
        let value = output[at]
        if value == 9 {
            output.remove(at: at)
            output.insert(0, at: at)
            if at == (digits.count - 1) {
                output.append(1)
                return output
            }
            return plusOne(output, at: at + 1)
        } else {
            let localValue = value + 1
            output.remove(at: at)
            output.insert(localValue, at: at)
            return output
        }
    }
}

//Runtime: 8 ms, faster than 75.87% of Swift online submissions for Plus One.
//Memory Usage: 20.8 MB, less than 20.00% of Swift online submissions for Plus One.
//Runtime: 4 ms, faster than 98.01% of Swift online submissions for Plus One.
//Memory Usage: 20.8 MB, less than 20.00% of Swift online submissions for Plus One.
private class SolutionOptimize {
    func plusOne(_ digits: [Int]) -> [Int] {
        var output:[Int] = digits
        let digit = output[digits.count - 1] + 1
        if digit == 10 {
            let carry = 1
            for i in stride(from: digits.count-1, to: -1, by: -1) {
                let digit = output[i] + carry
                if digit == 10 {
                    output[i] = 0
                } else {
                    output[i] = digit
                    return output
                }
            }
            output.insert(1, at: 0)
            return output
        } else {
            output[digits.count - 1] += 1
            return output
        }
    }
}
