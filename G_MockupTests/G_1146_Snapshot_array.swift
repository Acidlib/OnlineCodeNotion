//
//  G_1146_Snapshot_array.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/12/10.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class G_1146_Snapshot_array: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testExample() {
    }

    func testSanpShortArray() {
        let snapshotArr = SnapshotArray(3); // set the length to be 3
        snapshotArr.set(0,5);               // Set array[0] = 5
        XCTAssertTrue(snapshotArr.snap() == 0)
        snapshotArr.set(0,6);
        XCTAssertTrue(snapshotArr.get(0,0) == 5)

        // ["SnapshotArray","set","set","set","snap","get","snap"]
        // [[1],[0,4],[0,16],[0,13],[],[0,0],[]]
        let snapshotArr2 = SnapshotArray(1)
        snapshotArr2.set(0,4)
        snapshotArr2.set(0,16)
        snapshotArr2.set(0,13)
        XCTAssertTrue(snapshotArr2.snap() == 0)
        XCTAssertTrue(snapshotArr2.get(0,0) == 13)
        XCTAssertTrue(snapshotArr2.snap() == 1)
        
        let snapshotArrBoost = SnapshotArrayBoost(3); // set the length to be 3
        snapshotArrBoost.set(0,5);               // Set array[0] = 5
        XCTAssertTrue(snapshotArrBoost.snap() == 0)
        snapshotArrBoost.set(0,6);
        XCTAssertTrue(snapshotArrBoost.get(0,0) == 5)

        // ["SnapshotArray","set","set","set","snap","get","snap"]
        // [[1],[0,4],[0,16],[0,13],[],[0,0],[]]
        let snapshotArrBoost2 = SnapshotArrayBoost(1)
        snapshotArrBoost2.set(0,4)
        snapshotArrBoost2.set(0,16)
        snapshotArrBoost2.set(0,13)
        XCTAssertTrue(snapshotArrBoost2.snap() == 0)
        XCTAssertTrue(snapshotArrBoost2.get(0,0) == 13)
        XCTAssertTrue(snapshotArrBoost2.snap() == 1)

        // ["SnapshotArray","set","snap","snap","snap","get","snap","snap","get"]
        // [[1],[0,15],[],[],[],[0,2],[],[],[0,0]]
        // Expected [null,null,0,1,2,15,3,4,15]
        let snapshotArrBoost3 = SnapshotArrayBoost(1)
        snapshotArrBoost3.set(0,15)
        XCTAssertTrue(snapshotArrBoost3.snap() == 0)
        XCTAssertTrue(snapshotArrBoost3.snap() == 1)
        XCTAssertTrue(snapshotArrBoost3.snap() == 2)
        XCTAssertTrue(snapshotArrBoost3.get(0,2) == 15)
        XCTAssertTrue(snapshotArrBoost3.snap() == 3)
        XCTAssertTrue(snapshotArrBoost3.snap() == 4)
        XCTAssertTrue(snapshotArrBoost3.get(0,2) == 15)
    }

}

// Explanation:
//Input: ["SnapshotArray","set","snap","set","get"]
//[[3],[0,5],[],[0,6],[0,0]]
//Output: [null,null,0,null,5]
//Explanation:
//SnapshotArray snapshotArr = new SnapshotArray(3); // set the length to be 3
//snapshotArr.set(0,5);  // Set array[0] = 5
//snapshotArr.snap();  // Take a snapshot, return snap_id = 0
//snapshotArr.set(0,6);
//snapshotArr.get(0,0);  // Get the value of array[0] with snap_id = 0, return 5

// ****** Time Limit Exceeded ******
private class SnapshotArray {
    var snapshots: [Int: [Int: Int]]
    var count: Int
    
    init(_ length: Int) {
        self.count = 0
        self.snapshots = [:]
    }
    
    func set(_ index: Int, _ val: Int) {
        if self.snapshots[self.count] != nil {
            self.snapshots[self.count]![index] = val
        } else {
            self.snapshots[self.count] = [index: val]
        }
    }
    
    func snap() -> Int {
        count += 1
        snapshots[count] = self.snapshots[self.count - 1]
        return count - 1
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        if let snapshots = self.snapshots[snap_id], let idx = snapshots[index] {
            return idx
        } else {
            return 0
        }
    }
}

/**
 * Your SnapshotArray object will be instantiated and called as such:
 * let obj = SnapshotArray(length)
 * obj.set(index, val)
 * let ret_2: Int = obj.snap()
 * let ret_3: Int = obj.get(index, snap_id)
 */


// ******  ******
// Runtime: 912 ms, faster than 13.04% of Swift online submissions for Snapshot Array.
// Memory Usage: 28.1 MB, less than 100.00% of Swift online submissions for Snapshot Array.
private class SnapshotArrayBoost {
    var snapshots: [[Int: Int]] = [[Int:Int]]()
    var count: Int
    
    init(_ length: Int) {
        self.count = 0
        self.snapshots.append([Int : Int]())
    }
    
    func set(_ index: Int, _ val: Int) {
        self.snapshots[self.snapshots.count - 1][index] = val
    }
    
    func snap() -> Int {
        // continue add new dic
        self.snapshots.append([Int: Int]())
        return snapshots.count - 2
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        // could be [:], thus tracing forward
        for i in stride(from:snap_id,through:0,by:-1) {
            if snapshots[i][index] != nil {
                return snapshots[i][index]!
            }
        }
        return 0
    }
}
