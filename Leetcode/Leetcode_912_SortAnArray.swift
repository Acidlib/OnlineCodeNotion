//
//  Leetcode_912_SortAnArray.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/28.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class Leetcode_912_SortAnArray: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testSortArray() {
        var solution = SolutionHeapSort()
        var array = [5,2,3,1]
        var result = solution.sortArray(array)
        XCTAssertTrue(result[0] == 1)
        XCTAssertTrue(result[1] == 2)
        XCTAssertTrue(result[2] == 3)
        XCTAssertTrue(result[3] == 5)

        array = [5,1,1,2,0,0]
        result = solution.sortArray(array)
        XCTAssertTrue(result[0] == 0)
        XCTAssertTrue(result[1] == 0)
        XCTAssertTrue(result[2] == 1)
        XCTAssertTrue(result[3] == 1)
        XCTAssertTrue(result[4] == 2)
        XCTAssertTrue(result[5] == 5)
        
        // merge sort
        var solution2 = SolutionMergeSort()
        array = [5,2,3,1,4,6,9,8,7]
        result = solution2.sortArray(array)
        XCTAssertTrue(result[0] == 1)
        XCTAssertTrue(result[1] == 2)
        XCTAssertTrue(result[2] == 3)
        XCTAssertTrue(result[8] == 9)
    }

}

// heapsort: Time Limit Exceeded (maybe heapfiy takes too long)
private class SolutionHeapSort {
    func sortArray(_ nums: [Int]) -> [Int] {
        var array = nums
        heapify(&array, nums.count - 1)
        
        var endIndex = nums.count - 1
        while (endIndex > 0) {
            swap(&array, 0, endIndex)
            endIndex -= 1
            percolateDown(&array, 0, endIndex)
        }
        return array
    }
    
    func getParentIndex(_ index: Int, _ endIndex: Int) -> Int {
        if (index < 0 || index > endIndex) {
            return -1
        }
        return (index - 1) / 2
    }
    
    func getLeftChildIndex(_ index: Int, _ endIndex: Int) -> Int {
        let leftChildIndex = 2 * index + 1
        if (leftChildIndex > endIndex) {
            return -1
        }
        return leftChildIndex
    }

    func getRightChildIndex(_ index: Int, _ endIndex: Int) -> Int {
        let rightChildIndex = 2 * index + 2
        if (rightChildIndex > endIndex) {
            return -1
        }
        return rightChildIndex
    }
    
    func swap(_ array: inout [Int], _ index1: Int, _ index2: Int) {
        let tempValue = array[index1]
        array[index1] = array[index2]
        array[index2] = tempValue
    }
    
    func percolateDown(_ array: inout [Int], _ index: Int, _ endIndex: Int) {
        let leftChildIndex = getLeftChildIndex(index, endIndex)
        let rightChildIndex = getRightChildIndex(index, endIndex)

        if (leftChildIndex != -1 && array[leftChildIndex] > array[index]) {
            swap(&array, leftChildIndex, index)
            percolateDown(&array, leftChildIndex, endIndex)
        }
        if (rightChildIndex != -1 && array[rightChildIndex] > array[index]) {
            swap(&array, rightChildIndex, index)
            percolateDown(&array, rightChildIndex, endIndex)
        }
    }
    
    func heapify(_ array: inout [Int], _ endIndex: Int) {
        var index = getParentIndex(endIndex, endIndex)
        while (index >= 0) {
            percolateDown(&array, index, endIndex)
            index -= 1
        }
    }
}

private class SolutionMergeSort {
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count < 2 {
            return nums
        }

        var arrays = [[Int]]()
        for num in nums {
            arrays.append([num])
        }

        while arrays.count != 1 {
            let temp = merge(arr1: arrays[0], arr2: arrays[1])
            arrays.append(temp)
            arrays.removeFirst()
            arrays.removeFirst()
        }

        return arrays[0]
    }
    
    private func merge(arr1: [Int], arr2: [Int]) -> [Int] {
        var result = [Int]()
        var arr1 = arr1
        var arr2 = arr2

        while !arr1.isEmpty && !arr2.isEmpty {
            if arr1[0] == arr2[0] {
                result.append(arr1.removeFirst())
                result.append(arr2.removeFirst())
            } else if arr1[0] < arr2[0] {
                result.append(arr1.removeFirst())
            } else {
                result.append(arr2.removeFirst())
            }
        }

        while !arr1.isEmpty {
            result.append(arr1.removeFirst())
        }

        while !arr2.isEmpty {
            result.append(arr2.removeFirst())
        }

        return result
    }
}
