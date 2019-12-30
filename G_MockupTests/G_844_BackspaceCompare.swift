//
//  G_844_BackspaceCompare.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/12/30.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class G_844_BackspaceCompare: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMethod2() {
        let solution = Solution()
        var result = false
        
        result = solution.backspaceCompare510("ab#c", "ad#c")
        XCTAssert(result == true)
        
        result = solution.backspaceCompare510("ab##", "c#d#")
        XCTAssert(result == true)

        result = solution.backspaceCompare510("a##c", "#a#c")
        XCTAssert(result == true)
    }

}


private class Solution {
//    Runtime: 8 ms, faster than 72.73% of Swift online submissions for Backspace String Compare.
//    Memory Usage: 20.7 MB, less than 100.00% of Swift online submissions for Backspace String Compare.
//    Next challenges:
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let S = Array(S.compactMap({return $0}))
        let T = Array(T.compactMap({return $0}))
        var sSkip = 0
        var tSkip = 0
        var sPtr = S.count - 1
        var tPtr = T.count - 1
        
        while sPtr >= 0 || tPtr >= 0 {
            while  sPtr >= 0 && (S[sPtr] == "#" || sSkip != 0) {
                if S[sPtr] == "#"{
                    sSkip += 1
                } else {
                    sSkip -= 1
                }
                sPtr -= 1
            }
            
            while  tPtr >= 0 && (T[tPtr] == "#" || tSkip != 0) {
                if T[tPtr] == "#"{
                    tSkip += 1
                } else {
                    tSkip -= 1
                }
                tPtr -= 1
            }
            
            if tPtr >= 0 && sPtr >= 0{
                if T[tPtr] != S[sPtr]{
                    return false
                }
            } else if !(tPtr < 0 && sPtr < 0) {
                return false
            }
            
            sPtr -= 1
            tPtr -= 1
        }
        return true
    }
    
//    Runtime: 8 ms, faster than 72.73% of Swift online submissions for Backspace String Compare.
//    Memory Usage: 21 MB, less than 100.00% of Swift online submissions for Backspace String Compare.
    func backspaceCompare510(_ S: String, _ T: String) -> Bool {
        var S = Array(S.compactMap({return $0}))
        var T = Array(T.compactMap({return $0}))
        
        var sCount = 0
        var tCount = 0
        
        while S.count > 0 || T.count > 0 {
            let s = popLastElement(stack: &S, popQueue: &sCount).0
            let t = popLastElement(stack: &T, popQueue: &tCount).0
            if s != t {
                return false
            }
        }
        return true
    }
    
    func popLastElement(stack: inout [Character], popQueue: inout Int) -> (Character, Int) {
        if let s: Character = stack.popLast() {
            if s == "#" {
                popQueue += 1
                return popLastElement(stack: &stack, popQueue: &popQueue)
            } else {
                if popQueue > 0 {
                    popQueue -= 1
                    return popLastElement(stack: &stack, popQueue: &popQueue)
                } else {
                    return (s, 0)
                }
            }
        }
        return (Character(" "), popQueue)
    }
}
