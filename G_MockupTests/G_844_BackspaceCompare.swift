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

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
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
    
    func backspaceCompare510(_ S: String, _ T: String) -> Bool {
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
}
