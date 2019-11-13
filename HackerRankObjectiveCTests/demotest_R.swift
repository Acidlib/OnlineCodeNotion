//
//  demotest_R.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/13.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class demotest_R: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // ----------------- Answer 2 -----------------

        // Please "only" edit the code below to make `result` property becomes "2A3B4X4Y"
        let result = Test.load("AABBBXXXXYYYY", matchinghCondition: nil)
        XCTAssertTrue(result == "2A3B4X4Y")
    }

}

// Please read code below and see the instruction on the bottom part.

protocol ExamProtocol {
    func examProtocolFunction() -> String
}

extension String: ExamProtocol {
    
    struct Result {
        var character: Character
        var count: Int
    }
    
    var examProtocolValue: String {
        return reduce([]) { (result, character) -> [Result] in
            var newResult = result
            if let lastResult = result.last, lastResult.character == character {
                newResult[newResult.count - 1].count = lastResult.count + 1
            } else {
                newResult.append(Result(character: character, count: 1))
            }
            return newResult
        }.reduce("") { (result, counts) -> String in
            return result + String(counts.count) + String(counts.character)
        }
    }
    
    func examProtocolFunction() -> String {
        return examProtocolValue
    }
}

class Test {
    static func load<T: ExamProtocol>(_ value: T, matchinghCondition: ((String) -> Bool)?) -> String? {
        let duplicatedString = value.examProtocolFunction()
        return duplicatedString
        /*
        if let matchinghCondition = matchinghCondition, matchinghCondition(duplicatedString) {
            return duplicatedString
        } else {
            return nil
        }*/
    }
}

