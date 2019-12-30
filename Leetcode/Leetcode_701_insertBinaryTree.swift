//
//  Leetcode_701_insertBinaryTree.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/11.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class Leetcode_701_insertBinaryTree: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testcases() {
        //[4,2,7,1,3]
        let node1 = TreeNode(4)
        node1.left = TreeNode(2)
        node1.right = TreeNode(7)

        let solution = Solution()
        let _ = solution.insertIntoBST(node1, 5)
    }

}

private class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if let root = root {
            if root.val < val {
                root.right = insertIntoBST(root.right, val)
            } else {
                root.left = insertIntoBST(root.left, val)
            }
            return root
        } else {
            return TreeNode(val)
        }
    }
}

/**
Definition for a binary tree node.*/
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
