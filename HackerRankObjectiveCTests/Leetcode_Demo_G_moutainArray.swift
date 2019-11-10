//
//  Leetcode_Demo_G_moutainArray.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/11.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

//Given an array A of integers, return true if and only if it is a valid mountain array.
//
//Recall that A is a mountain array if and only if:
//
//A.length >= 3
//There exists some i with 0 < i < A.length - 1 such that:
//A[0] < A[1] < ... A[i-1] < A[i]
//A[i] > A[i+1] > ... > A[A.length - 1]
//
//
//Example 1:
//
//Input: [2,1]
//Output: false
//Example 2:
//
//Input: [3,5,5]
//Output: false
//Example 3:
//
//Input: [0,3,2,1]
//Output: true

class Leetcode_Demo_G_moutainArray: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCases() {
        let s = Solution()
        _ = s.validMountainArray([0,3,2,1])
    }
}

private class Solution {
    enum Status: CaseIterable {
        case none, accending, decending
    }

    func validMountainArray(_ A: [Int]) -> Bool {
        var status: Status = .none
        for (idx, _) in A.enumerated() {
            
            if idx > 0 {print(idx, A[idx-1], A[idx], status)}
            if idx == 0 { status = .none }
            else if idx > 0 && A[idx - 1] < A[idx] && (status == .accending || status == .none ) { status = .accending }
            else if idx > 0 && A[idx - 1] > A[idx] && (status == .accending || status == .decending) { status = .decending}
            else {
                print("gotcha", idx, A[idx-1], A[idx], status)
                status = .none
                break
            }
        }
        print("", status)
        return status == .decending ? true : false
    }
}



