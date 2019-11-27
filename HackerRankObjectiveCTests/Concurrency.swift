//
//  Concurrency.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/27.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

import XCTest

class Concurrency: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testConcurrency() {
        let q_one = DispatchQueue(label: "one")
        let q_two = DispatchQueue(label: "two")
        let group = DispatchGroup()

        var counter = 0
        var mutex = pthread_mutex_t()
        pthread_mutex_init(&mutex, nil)

        func operation() {
            for _ in 0 ..< 800 {
                pthread_mutex_lock(&mutex)
                counter += 1
                print(Thread.current, counter)
                pthread_mutex_unlock(&mutex)
            }
            print("finished")
        }

        q_one.async(group: group, execute: operation)
        q_two.async(group: group, execute: operation)
        group.wait()

        print(counter)
        
//        <NSThread: 0x7ff1fcd73850>{number = 2, name = (null)} 37
//        <NSThread: 0x7ff1fcf60c90>{number = 3, name = (null)} 38
//        <NSThread: 0x7ff1fcf60c90>{number = 3, name = (null)} 39
//        <NSThread: 0x7ff1fcf60c90>{number = 3, name = (null)} 40
//        <NSThread: 0x7ff1fcf60c90>{number = 3, name = (null)} 41
//        <NSThread: 0x7ff1fcf60c90>{number = 3, name = (null)} 42
//        <NSThread: 0x7ff1fcf60c90>{number = 3, name = (null)} 43
//        <NSThread: 0x7ff1fcf60c90>{number = 3, name = (null)} 44
//        <NSThread: 0x7ff1fcd73850>{number = 2, name = (null)} 45
    }

}
