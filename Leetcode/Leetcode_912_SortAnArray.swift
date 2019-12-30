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
    
    func testQuickSort() {
        let solutionQuick = SolutionQuickSort()
        let array = [1,2,5,4,6,7,9,8,3]
        let result = solutionQuick.sortArray(array)
        XCTAssertTrue(result[0] == 1)
        XCTAssertTrue(result[1] == 2)
        XCTAssertTrue(result[2] == 3)
        XCTAssertTrue(result[8] == 9)
        
    }
    
    func testMergeSort() {
        let solution2 = SolutionMergeSort()
        let array = [5,2,3,1,4,6,9,8,7]
        let result = solution2.sortArray(array)
        XCTAssertTrue(result[0] == 1)
        XCTAssertTrue(result[1] == 2)
        XCTAssertTrue(result[2] == 3)
        XCTAssertTrue(result[8] == 9)
    }
    
    // ETL
    func testHeapSort() {
        let solution = SolutionHeapSort()
        var array = [1,2,5,4,6,7,9,8,3]
        var result = solution.sortArray(array)
        XCTAssertTrue(result[0] == 1)
        XCTAssertTrue(result[1] == 2)
        XCTAssertTrue(result[2] == 3)
        XCTAssertTrue(result[8] == 9)
        
        array = [5,2,3,1]
        result = solution.sortArray(array)
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
    }

}

// Runtime: 1432 ms, faster than 5.26% of Swift online submissions for Sort an Array.
// Memory Usage: 25.2 MB, less than 20.00% of Swift online submissions for Sort an Array.

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

// heapsort: Time Limit Exceeded (maybe heapfiy takes too long)
// Although time complexity is the same, the constant factors are not.
// Generally merge sort will be significantly faster on a typical system with a 4 or greater way cache, since merge sort will perform sequential reads from two runs and sequential writes to a single merged run
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


// Runtime: 172 ms, faster than 80.45% of Swift online submissions for Sort an Array.
// Memory Usage: 23.8 MB, less than 20.00% of Swift online submissions for Sort an Array.
private class SolutionQuickSort {
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        let result = quickSort(&nums, 0, nums.count - 1)
        return result
    }
    
    func swap(_ array: inout [Int], _ index1: Int, _ index2: Int) {
        let tempValue = array[index1]
        array[index1] = array[index2]
        array[index2] = tempValue
    }
    
    func quickSort(_ listToSort: inout [Int], _ low: Int, _ high: Int) -> [Int] {
        if low >= high { return listToSort }
        let pivot = partition(&listToSort, low, high)
        _ = quickSort(&listToSort, low, pivot - 1)
        _ = quickSort(&listToSort, pivot + 1, high)
        return listToSort
    }
    
    func partition(_ listToSort: inout [Int], _ low: Int, _ high: Int) -> Int {
        //var listToSort = listToSort
        let pivot = listToSort[low]
        var l = low
        var h = high
        while l < h {
            while listToSort[l] <= pivot && l < h {
                l += 1
            }
            while listToSort[h] > pivot {
                h -= 1
            }
            if l < h {
                swap(&listToSort, l, h)
            }
        }
        swap(&listToSort, low, h)
        return h
    }
}
