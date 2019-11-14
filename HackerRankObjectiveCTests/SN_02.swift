//
//  SN_2.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/13.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class SN_2: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let solution = Solution()
        var array = [1, 4, 7, 3, 3, 5]
        let result = solution.solution(&array)
        XCTAssertTrue(result == 4)
    }

}

private class Solution {
    public func solution(_ A : inout [Int]) -> Int {
        var dict: [Int: Int] = [:]
        for i in 0..<A.count {
            dict[i] = A[i]
        }
        let sortedDic = dict.sorted { $0.1 < $1.1 }
        
        var outputArray: [Int] = []
        for i in 1..<sortedDic.count {
            let diff = abs(sortedDic[i].key - sortedDic[i-1].key)
            if diff > 1 {
                outputArray.append(diff)
            }
        }
        return outputArray.max() ?? -1
    }
}
