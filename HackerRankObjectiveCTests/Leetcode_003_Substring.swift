//
//  Leetcode_003_Substring.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/11.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class Leetcode_003_Substring: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testLengthOfSubString() {
        let solution = Solution()
        let b = "abcabcabc"
        _ = solution.lengthOfLongestSubstring(b)
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
