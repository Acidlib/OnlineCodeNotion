//
//  Leetcode_587_erectFence.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/11.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest
import Foundation

class Leetcode_587_erectFence: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testOuterTrees() {
        let solution = Solution()
        var result: [[Int]]
        var expected: [[Int]]
        
        result = solution.outerTrees([[0,0],[0,1],[0,2],[1,2],[2,2],[3,2],[3,1],[3,0],[2,0]])
        expected = [[3,0],[3,2],[0,0],[1,2],[0,1],[0,2],[3,1],[2,0],[2,2]]
        XCTAssertTrue(result.count == expected.count)
        for elem in expected {
            XCTAssertTrue(result.contains(elem))
        }
        
        result = solution.outerTrees([[5,5],[4,8],[1,3],[5,9],[3,0],[0,4],[3,2],[8,9],[9,3]])
        expected = [[3,0],[0,4],[4,8],[5,9],[8,9],[9,3]]
        XCTAssertTrue(result.count == expected.count)
        for elem in expected {
            XCTAssertTrue(result.contains(elem))
        }
        
        result = solution.outerTrees([[3,3],[2,4],[2,2],[7,4],[3,4]])
        expected = [[2,2],[3,4],[7,4],[2,4]]
        XCTAssertTrue(result.count == expected.count)
        for elem in expected {
            XCTAssertTrue(result.contains(elem))
        }
        
        result = solution.outerTrees([[3,7],[6,8],[7,8],[11,10],[4,3],[8,5],[7,13],[4,13]])
        expected = [[3,7],[7,13],[11,10],[8,5],[4,13],[4,3]]
        XCTAssertTrue(result.count == expected.count)
        for elem in expected {
            XCTAssertTrue(result.contains(elem))
        }
        
        result = solution.outerTrees([[1,1],[2,2],[2,0],[2,4],[3,3],[4,2]])
        expected = [[2,4],[3,3],[4,2],[1,1],[2,0]]
        XCTAssertTrue(result.count == expected.count)
        for elem in expected {
            XCTAssertTrue(result.contains(elem))
        }
        
        result = solution.outerTrees([[1,1],[2,2],[2,0],[2,4],[3,3],[4,2]])
        expected = [[1,1],[2,0],[4,2],[3,3],[2,4]]
        XCTAssertTrue(result.count == expected.count)
        for elem in expected {
            XCTAssertTrue(result.contains(elem))
        }
        
        result = solution.outerTrees([[1,1],[2,2],[2,0],[2,4],[3,3],[4,2]])
        expected = [[1,1],[2,0],[4,2],[3,3],[2,4]]
        XCTAssertTrue(result.count == expected.count)
        for elem in expected {
            XCTAssertTrue(result.contains(elem))
        }
    }
}

private class Solution {
    func outerTrees(_ points: [[Int]]) -> [[Int]] {
        var outputArray: [[Int]] = []
        
        // find origin
        var points = points
        let origin = points.min { a, b in
            (a[0] == b[0] ? a[1] < b[1] : a[0] < b[0])
        }
        points = points.filter {$0 != origin}
        
        // create output
        outputArray.append(origin!)
        
        // sort points by slope
        points.sort(by: { slope($0, origin!) ==  slope($1, origin!) ?
            ($0[1] == $1[1] ? $0[0] < $1[0] : $0[1] > $1[1])
            : slope($0, origin!) < slope($1, origin!) })
        
        for p in points {
            outputArray.append(p)
            while outputArray.count > 2 &&
                cross(a: outputArray[outputArray.count-3], b: outputArray[outputArray.count-2], c: outputArray[outputArray.count-1]) < 0 {
                    outputArray.remove(at: outputArray.count-2)
            }
        }
        
        return outputArray
    }
    
    func cross(a: [Int], b: [Int], c: [Int]) -> Int {
        return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])
    }
    
    func slope(_ p1: [Int], _ p2: [Int]) -> Float {
        return p1[0] == p2[0] ? Float.greatestFiniteMagnitude : Float(p1[1]-p2[1]) / Float(p1[0]-p2[0])
        
    }
}

// result:
//Runtime: 424 ms, faster than 100.00% of Swift online submissions for Erect the Fence.
//Memory Usage: 21.4 MB, less than 100.00% of Swift online submissions for Erect the Fence.


/* codility
public struct Point2D {
    public var x: Int = 0
    public var y: Int = 0
    public init () {}
}


func slope(p1: Point2D, p2: Point2D) -> Float {
    return Float((p1.y-p2.y) / (p1.x-p2.x))
    
}

public func solution(_ A : inout [Point2D]) -> Int {
    var outputArray: [Point2D] = []
    let origin = A.min { a, b in (a.x < b.x && a.y < b.y)}
    
    outputArray.append(origin!)
    A.sort { a, b in slope(p1: a, p2: origin!) < slope(p1: b, p2: origin!)}
    
    for p in A {
        outputArray.append(p)
        while outputArray.count > 2 && cross(a: outputArray[0], b: outputArray[1], c: outputArray[2]) < 0 {
            outputArray.remove(at: 2)
        }
    }
    return outputArray.count
}

func cross(a: Point2D, b: Point2D, c: Point2D) -> Int {
    return (b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x)
}
 */
