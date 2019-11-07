//
//  SemiPrimesSwift.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/07.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//  https://app.codility.com/c/run/trainingFS9Z2H-WFF/

import XCTest

class SemiPrimesSwift: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testSemiPrime() {
        var P = [1,4,16]
        var Q = [26,10,20]
        let result1 = solution(26, &P, &Q)
        let answer1 = [10, 4, 0]
        XCTAssertEqual(result1, answer1)
    }
    
    public func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
        var output: [Int] = []
        for i in 0..<P.count {
            let result = findingPrimesArray(min: P[i], max: Q[i]).count
            output.append(result)
        }
        return output
    }

    func findingPrimesArray(min: Int, max: Int) -> ([Int]) {
        var primes: [Int] = []
        for candidate in 2...max {
            var isCandidatePrime: Bool = true
            for i in 2..<candidate {
                if candidate % i == 0 {
                    isCandidatePrime = false
                    break
                }
            }
            
            if isCandidatePrime && !primes.contains(candidate) {
                primes.append(candidate)
            }
        }
        
        var semiPrimes: [Int] = []
        // get the SemiPrimes Array
        for i in 0..<primes.count {
            for j in 0..<primes.count {
                let semiCandidate = primes[i] * primes[j]
                if semiCandidate >= min && semiCandidate <= max && !semiPrimes.contains(semiCandidate) {
                    semiPrimes.append(semiCandidate)
                }
            }
        }
        return semiPrimes
        
    }
}
