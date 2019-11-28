//
//  G_Reorder_array.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/28.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

//Given an unsorted array nums, reorder it in-place such that nums[0] <= nums[1] >= nums[2] <= nums[3]....
//Input: nums = [3,5,2,1,6,4]
//Output: One possible answer is [3,5,1,6,2,4]

class G_Reorder_array: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testWiggleSort() {
        let solution = Solution()
        var nums = [3,5,2,1,6,4]
        solution.heapSort(&nums)
        XCTAssertTrue(nums == [1,2,3,4,5,6])
    }
}

private class Solution {
    func heapSort(_ nums: inout [Int]) {
        let len = nums.count
        heapBuild(&nums,len)
        for newLen in stride(from: (len-1), to: 1, by: -1) {
            swap(&nums, newLen, 0)
            heapAdjust(&nums, 0, newLen)
        }
    }
    
    func heapBuild(_ nums: inout [Int],_ len: Int) {
        for i in stride(from: (len/2-1), to: 0, by: -1) {
            heapAdjust(&nums, i, len)
        }
    }
    
    func heapAdjust(_ nums: inout [Int], _ i: Int, _ end: Int) {
        let ded = i
        let son = 2*i + 1
        var largest = ded
        if (son < end && nums[largest] < nums[son]) {
            largest = son
        }
        if (son+1 < end && nums[largest] < nums[son+1]) {
            largest = son + 1
        }
        
        if (largest != i) {
            swap(&nums, largest, i)
            heapAdjust(&nums, largest, end)
        }
    }
    
    func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
        let temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
}
