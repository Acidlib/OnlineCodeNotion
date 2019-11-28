//
//  G_280_wiggleSort.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/28.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class G_280_wiggleSort: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWiggleSort() {
        let solution = Solution()
        var nums = [3,5,2,1,6,4]
        solution.wiggleSort(&nums)
        XCTAssertTrue(nums == [3,5,1,6,2,4])
    }

}

private class Solution {
    func wiggleSort(_ nums: inout [Int]) {
        if nums.count == 1 { return }
        for i in 0..<nums.count-1 {
            if i%2 == 0 {
                if nums[i] < nums[i+1] {
                    continue
                } else {
                    nums.swapAt(i, i+1)
                }
            } else {
                if nums[i] < nums[i+1] {
                    nums.swapAt(i, i+1)
                } else {
                    continue
                }
            }
        }
    }
}
