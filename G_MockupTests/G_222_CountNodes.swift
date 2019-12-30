//
//  G_222_CountNodes.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/12/30.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class G_222_CountNodes: XCTestCase {

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

/**
* Definition for a binary tree node.
* public class TreeNode {
*     public var val: Int
*     public var left: TreeNode?
*     public var right: TreeNode?
*     public init(_ val: Int) {
*         self.val = val
*         self.left = nil
*         self.right = nil
*     }
* }
*/

private class Solution {
//    Runtime: 84 ms, faster than 61.07% of Swift online submissions for Count Complete Tree Nodes.
//    Memory Usage: 21.9 MB, less than 100.00% of Swift online submissions for Count Complete Tree Nodes.
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftDepth = treeDepth(root, true)
        let rightDepth = treeDepth(root, false)
        
        if leftDepth == rightDepth {
            return (1 << leftDepth) - 1 // 2^n - 1
        }
        
        return countNodes(root.left) + countNodes(root.right) + 1
    }
    
    func treeDepth(_ root: TreeNode?, _ isLeft: Bool) -> Int {
        var root = root
        var depth = 0
        
        while root != nil {
            root = isLeft ? root?.left : root?.right
            depth += 1
        }
        
        return depth
    }
}
