//
//  codility_sn_demo.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/13.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//  41. First Missing Positive

import XCTest

class codility_sn_demo: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    public func solution(_ A : inout [Int]) -> Int {
        let i = 1
        for elem in A {
            if elem == i {
                i ++
            }
        }
    }
    
public func solution(_ A: [Int]) -> Int {
    if nums.count == 0 { return 1}
    
    for i in 0...A.count {
        if i != 0 && nums.contains(i) == false {
            return i
        }
        if i == nums.count {
            return nums.count + 1
        }
    }
    
    return 1
}
    
    public int firstMissingPositive(int[] nums) {
        int n = nums.length, p = 0;
        if (n == 0) return 1;
        
        while (p < n) {
            // add nums[p] into set, swap until nums[p] in position (using 1-index)
            if (nums[p] >= 0 && nums[p] < n && nums[nums[p]] != nums[p]) {
                swap(nums, nums[p], p);
            } else {
                p++;
            }
        }
        for (int i = 1; i < n; i++) {
            // traverse and find the first missing in the set
            if (nums[i] != i) return i;
        }
        // check nums[0] in case the last element was swapped here
        return nums[0] == n ? n + 1 : n;
    }
    
    public void swap(int[] nums, int a, int b) {
        int t = nums[a];
        nums[a] = nums[b];
        nums[b] = t;
    }

}
