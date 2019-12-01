//
//  OperationSamples.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/12/01.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class OperationSamples: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOperationBlock() {
        let operation = BlockOperation()
        let operationBlock = {
            print("I am operation Block")
        }

        operation.addExecutionBlock {
            operationBlock()
        }

        operation.start()
        print("\(operation.debugDescription)")
        XCTAssertTrue(operation.isFinished)
    }
    
    func testOperationBlockInQueue() {
        let op0 = BlockOperation()
        op0.completionBlock = {
            print("op0 completionBlock")
        }
        op0.addExecutionBlock {
            print("op0 executionBlock #1")
        }
        op0.addExecutionBlock {
            print("op0 executionBlock #2")
        }
        op0.queuePriority = .veryHigh


        let op1 = BlockOperation()
        op1.addDependency(op0)
        op1.completionBlock = {
            print("op1 completionBlock")
        }
        op1.addExecutionBlock {
            print("op1 executionBlock")
        }


        let op2 = BlockOperation()
        op2.addDependency(op1)
        op2.completionBlock = {
            print("op2 completionBlock")
        }
        op2.addExecutionBlock {
            print("op2 executionBlock")
        }
        
        let operationQueue = OperationQueue()
        operationQueue.addOperations([op0, op1, op2], waitUntilFinished: true)
        print("\(operationQueue.debugDescription)")
        XCTAssertTrue(operationQueue.operationCount == 0)
    }
    

}
