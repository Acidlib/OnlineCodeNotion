//
//  G_PhoneDirectory.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/28.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

//Design a Phone Directory which supports the following operations:
//
//get: Provide a number which is not assigned to anyone.
//check: Check if a number is available or not.
//release: Recycle or release a number.

//Example:
//
//// Init a phone directory containing a total of 3 numbers: 0, 1, and 2.
//PhoneDirectory directory = new PhoneDirectory(3);
//
//// It can return any available phone number. Here we assume it returns 0.
//directory.get();
//
//// Assume it returns 1.
//directory.get();
//
//// The number 2 is available, so return true.
//directory.check(2);
//
//// It returns 2, the only number that is left.
//directory.get();
//
//// The number 2 is no longer available, so return false.
//directory.check(2);
//
//// Release number 2 back to the pool.
//directory.release(2);
//
//// Number 2 is available again, return true.
//directory.check(2);

class G_PhoneDirectory: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testPhoneDirectory() {
        let solution = PhoneDirectory(1)
        XCTAssertTrue(solution.check(0) == true)
        XCTAssertTrue(solution.get() == 0)
        XCTAssertTrue(solution.check(0) == false)
        XCTAssertTrue(solution.get() == -1)
    }
}


private class PhoneDirectory {
    var stack = [Int]()
    /** Initialize your data structure here
        @param maxNumbers - The maximum numbers that can be stored in the phone directory. */
    init(_ maxNumbers: Int) {
        for i in 0..<maxNumbers {
            stack.append(i)
        }
    }
    
    /** Provide a number which is not assigned to anyone.
        @return - Return an available number. Return -1 if none is available. */
    func get() -> Int {
        if stack.count > 0 {
            let num = stack[0]
            stack.remove(at: 0)
            return num
        }
        return -1
    }
    
    /** Check if a number is available or not. */
    func check(_ number: Int) -> Bool {
        return (stack.contains(number))
    }
    
    /** Recycle or release a number. */
    func release(_ number: Int) {
        if !stack.contains(number) {
            stack.insert(number, at: 0)
        }
    }
}

/**
 * Your PhoneDirectory object will be instantiated and called as such:
 * let obj = PhoneDirectory(maxNumbers)
 * let ret_1: Int = obj.get()
 * let ret_2: Bool = obj.check(number)
 * obj.release(number)
 */


//Result:
//Runtime: 516 ms
//Memory Usage: 20.9 MB
//You are free to continue working on this question, but please note that only your first accepted submission will be counted.
