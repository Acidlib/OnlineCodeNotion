//
//  G_833_findReplaceString.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/29.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class G_833_findReplaceString: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testReplaceString() {
        let solution = Solution()
        var result = solution.findReplaceString("abcd", [0,2], ["a", "cd"], ["eee", "ffff"])
        XCTAssertTrue(result == "eeebffff")
        
        result = solution.findReplaceString("abcd", [0,2], ["ab", "ec"], ["eee", "ffff"])
        XCTAssertTrue(result == "eeecd")
    }

}

extension String {
    func substring(with nsrange: NSRange) -> Substring? {
        guard let range = Range(nsrange, in: self) else { return nil }
        return self[range]
    }
}

//Runtime: 28 ms, faster than 76.19% of Swift online submissions for Find And Replace in String.
//Memory Usage: 21.2 MB, less than 100.00% of Swift online submissions for Find And Replace in String.
private class Solution {
    func findReplaceString(_ S: String, _ indexes: [Int], _ sources: [String], _ targets: [String]) -> String {
        var array = S.compactMap({ return "\($0)" })
        for i in 0..<indexes.count {
            let target = sources[i]
            if let substring = S.substring(with: NSRange(location: indexes[i], length: target.count)), substring != sources[i] {
                continue
            }
            for j in indexes[i]+1..<indexes[i]+target.count {
                array[j] = ""
            }
            array[indexes[i]] = "\(targets[i])"
        }
        return array.joined(separator: "")
    }
}
