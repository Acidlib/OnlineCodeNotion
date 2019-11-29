//
//  Leetcode_731_MyCalendar_II.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/30.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class Leetcode_731_MyCalendar_II: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCalendarTwo() {
        let solution = MyCalendarTwo()
        XCTAssertTrue(solution.book(28, 46) == true)
        XCTAssertTrue(solution.book(9, 21) == true)
        XCTAssertTrue(solution.book(21, 39) == true)
        XCTAssertTrue(solution.book(37, 48) == false)
        XCTAssertTrue(solution.book(38, 50) == false)
        XCTAssertTrue(solution.book(22, 39) == false)
        XCTAssertTrue(solution.book(45, 50) == true)
        XCTAssertTrue(solution.book(1, 12) == true)
        XCTAssertTrue(solution.book(40, 50) == false)
        XCTAssertTrue(solution.book(31, 44) == false)
    }

}

private class MyCalendarTwo {
    var timeTable: [(start: Int, end: Int)] = []
    var doubleTable: [(start: Int, end: Int)] = []
    init() {
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        var couldBeBooked = true
        for elem in doubleTable {
            let result = isOverlapping(start, end, elem.start, elem.end)
            if result.0 == true {
                couldBeBooked = false
                break
            }
        }
        
        if couldBeBooked == false {
            return false
        }

        for elem in timeTable {
            // the rest tables
            let result = isOverlapping(start, end, elem.start, elem.end)
            if result.0 == true {
                doubleTable.append(result.1)
            }
        }
        
        timeTable.append((start, end))
        return true
    }

    func isOverlapping(_ x1: Int,_ x2: Int,_ y1: Int,_ y2: Int) -> (Bool, (start: Int, end: Int)){
        return (max(x1, y1) < min(x2, y2), (max(x1, y1), min(x2, y2)))
    }
}
