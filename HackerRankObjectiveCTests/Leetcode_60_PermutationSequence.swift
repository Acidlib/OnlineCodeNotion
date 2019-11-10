//
//  Leetcode_60_PermutationSequence.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/10.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class Leetcode_60_PermutationSequence: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testComputeArea() {
        let solution = Solution()

        var result = solution.getPermutation(2, 2)
        XCTAssertTrue(result == "21")
        
        result = solution.getPermutation(4, 9)
        XCTAssertTrue(result == "2314")
        
        result = solution.getPermutation(3, 3)
        XCTAssertTrue(result == "213")
        

    }
}

private class Solution {
    var primerK: Int = 0
    var numberArr: [Int] = []
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var outputString: String = ""
        numberArr = Array(1...n)
        primerK = k - 1
        for i in 0..<n {
            let fac = factorial(n - i)
            primerK = primerK % fac
            var idx = Int(( Double(primerK) / Double(fac/(n-i)) ))
            if idx < 0 { idx = 0 }
            outputString = "\(outputString)\(String(numberArr[idx]))"
            numberArr.remove(at: idx)
        }
        return outputString
    }
    
    func factorial(_ n: Int) -> Int {
      var n = n
      var result = 1
      while n > 1 {
        result *= n
        n -= 1
      }
      return result
    }
}
