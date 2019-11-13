//
//  SemiPrimesSwift.swift
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/07.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//  https://app.codility.com/c/run/trainingFS9Z2H-WFF/

import XCTest

class SemiPrimesSwift: XCTestCase {
    var primes: [Int] = []
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
        let lb = primes.last ?? 2
        if lb < max {
            for candidate in lb...max {
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
        }
        
        var semiPrimes: [Int] = []
        // get the SemiPrimes Array
        var i = 0
        while i < primes.count && primes[i] <= max {
            var j = 0
            while j < primes.count && primes[j] <= max {
                let semiCandidate = primes[i] * primes[j]
                if semiCandidate > max { j = primes.count }
                if semiCandidate >= min && semiCandidate <= max && !semiPrimes.contains(semiCandidate) {
                    semiPrimes.append(semiCandidate)
                }
                j += 1
            }
            i += 1
        }
        return semiPrimes
        
    }
}
