//
//  Leetcode_002_twoNumbers.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/10.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class Leetcode_002_twoNumbers: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func textAddTwoNumber() {
        let solution = Solution()
        let ln1 = ListNode(2)
        let ln2 = ListNode(4)
        let ln3 = ListNode(3)
        ln1.next = ln2
        ln2.next = ln3


        let ln2_1 = ListNode(5)
        let ln2_2 = ListNode(6)
        let ln2_3 = ListNode(4)
        ln2_1.next = ln2_2
        ln2_2.next = ln2_3
        
        let result = solution.addTwoNumbers(ln1, ln2_1)
        print(result as Any)
    }

}


//Definition for singly-linked list.
public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
    }
}

private class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1: ListNode? = l1
        var list2: ListNode? = l2
        let dummy = ListNode(0)
        var current = dummy
        var carry = 0
        var sum: Int = 0
        while (list1 != nil || list2 != nil || carry > 0) {
            sum = (list1?.val ?? 0) + (list2?.val ?? 0) + carry
            carry = sum/10
            current.next = ListNode(sum % 10)
            current = current.next!
            list1 = list1?.next ?? nil
            list2 = list2?.next ?? nil

        }
        return dummy.next
    }
}
