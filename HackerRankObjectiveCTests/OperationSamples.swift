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
    
    func testOperationQueue() {
        let test = TEST()
        test.run()
    }

}

// MARK: - StackableOperationsQueue performs functions from the stack one by one (serial performing)

class StackableOperationsQueue {
    private let semaphore = DispatchSemaphore(value: 1)
    private lazy var operations = [QueueOperation]()
    private lazy var isExecuting = false

    fileprivate func _append(operation: QueueOperation) {
        semaphore.wait()
        operations.append(operation)
        semaphore.signal()
        execute()
    }

    func append(operation: QueueOperation) { _append(operation: operation) }

    private func execute() {
        semaphore.wait()
        guard !operations.isEmpty, !isExecuting else { semaphore.signal(); return }
        let operation = operations.removeFirst()
        isExecuting = true
        semaphore.signal()
        operation.perform()
        semaphore.wait()
        isExecuting = false
        semaphore.signal()
        execute()
    }
}

// MARK: - StackableOperationsCuncurentQueue performs functions from the stack one by one (serial performing) but in cuncurent queue

class StackableOperationsCuncurentQueue: StackableOperationsQueue {
    private var queue: DispatchQueue
    init(queue: DispatchQueue) { self.queue = queue }
    override func append(operation: QueueOperation) {
        queue.async { [weak self] in self?._append(operation: operation) }
    }
}

// MARK: QueueOperation interface

protocol QueueOperation: class {
    var сlosure: (() -> Void)? { get }
    var actualityCheckingClosure: (() -> Bool)? { get }
    init (actualityCheckingClosure: (() -> Bool)?, serialClosure: (() -> Void)?)
    func perform()
}

extension QueueOperation {
    // MARK: - Can queue perform the operation `сlosure: (() -> Void)?` or not
    var isActual: Bool {
        guard   let actualityCheckingClosure = self.actualityCheckingClosure,
                self.сlosure != nil else { return false }
        return actualityCheckingClosure()
    }
    func perform() { if isActual { сlosure?() } }

    init (actualIifNotNill object: AnyObject?, serialClosure: (() -> Void)?) {
        self.init(actualityCheckingClosure: { return object != nil }, serialClosure: serialClosure)
    }
}

class SerialQueueOperation: QueueOperation {
    let сlosure: (() -> Void)?
    let actualityCheckingClosure: (() -> Bool)?
    required init (actualityCheckingClosure: (() -> Bool)?, serialClosure: (() -> Void)?) {
        self.actualityCheckingClosure = actualityCheckingClosure
        self.сlosure = serialClosure
    }
}


class TEST {
    private lazy var stackableOperationsQueue: StackableOperationsCuncurentQueue = {
        let queue = DispatchQueue(label: "custom_queue", qos: .userInitiated,
                                  attributes: [.concurrent], autoreleaseFrequency: .workItem, target: nil)
        return StackableOperationsCuncurentQueue(queue: queue)
    }()

    private func addOperationToQueue(closure: (() -> Void)?) {
        let operation = SerialQueueOperation(actualIifNotNill: self) { closure?() }
        stackableOperationsQueue.append(operation: operation)
        print("!!!! Function added ")
    }

    private func simpleFunc(index: Int) {
        print("Func \(index) started")
        sleep(UInt32(0.5))
        print("Func \(index) ended")
    }

    func run() {
        (0...3).forEach { index in
            addOperationToQueue { [weak self] in
                self?.simpleFunc(index: index)
            }
        }
    }
}
