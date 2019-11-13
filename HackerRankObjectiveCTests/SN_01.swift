//
//  SN_01.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/13.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class SN_01: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let solution = SolutionBivalue()
        var array = [0, 5, 4, 4, 5, 12]
        var result = solution.lengthOfLongestBivalues(&array)
        XCTAssertTrue(result == 4)
        
        array = [1, 2, 3, 2]
        result = solution.lengthOfLongestBivalues(&array)
        XCTAssertTrue(result == 3)
        
        array = [4, 2, 2, 4, 2]
        result = solution.lengthOfLongestBivalues(&array)
        XCTAssertTrue(result == 5)
        
        array = [4, 4]
        result = solution.lengthOfLongestBivalues(&array)
        XCTAssertTrue(result == 2)
        
    }
//    public func solution(_ A : inout [Int]) -> Int {
//    }

}

private class SolutionBivalue {
    func lengthOfLongestBivalues(_ A: inout [Int]) -> Int {
        var window: [Int] = []
        var output: [Int] = []      // put local max count
        
        var tempBivalue: [Int] = [] // should be two values only
        
        for item in A {
            if window.contains(item) || tempBivalue.count < 2 {
                if !tempBivalue.contains(item) {
                    tempBivalue.append(item)
                }
                window.append(item)
            } else {
                tempBivalue = []
                output.append(window.count)
                window = [window[window.count - 1], item]
            }
        }
        
        if output.count > 0 {
            return max(output.max()!, window.count)
        } else {
            return window.count
        }
    }
}

private class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var window: [Character] = []
        var localMax = 0
        var string = s
        var count = 0
        for item in s {
            if string.count != 0 {
                string = string.replacingOccurrences(of: string.prefix(1), with: "")
                count += 1
            }
            
            if !window.contains(item) {
                window.append(item)
            } else {
                window = Array(window[((window.firstIndex(of:item) ?? 0) + 1)...])
                window.append(item)
            }
            localMax = max(localMax, window.count)
            if localMax == count && string.count == 0 {
                break
            }
        }
        return localMax
    }
}
