//
//  CountSemiprimes.m
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/06.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface SemiPrimes:NSObject
- (NSMutableArray *)solution:(int)N P:(NSMutableArray *)P Q:(NSMutableArray *)Q;
@end

@implementation SemiPrimes
- (NSMutableArray *)solution:(int)N P:(NSMutableArray *)P Q:(NSMutableArray *)Q {
    NSMutableArray *output = [NSMutableArray new];
    for (int i = 0; i < P.count; i ++) {
        NSInteger result = [self findingPrimesArray:[P[i] integerValue] max:[Q[i] integerValue]].count;
        [output addObject:@(result)];
    }
    return output;
}

- (NSMutableArray *)findingPrimesArray:(NSInteger)min max:(NSInteger)max {
    NSMutableArray *primes = [NSMutableArray new];
    // create a prime array
    for (int candidate = 2; candidate < max; candidate ++) {
        BOOL isCandidatePrime = true;
        for (int i = 2; i < candidate; i ++) {
            if (candidate % i == 0) {
                isCandidatePrime = false;
                break;
            }
        }
        if (isCandidatePrime && ![primes containsObject:@(candidate)]) {
            [primes addObject:@(candidate)];
        }
    }
    
    NSMutableArray *semiPrimes = [NSMutableArray new];
    // get the SemiPrimes Array
    for (int i = 0; i < primes.count; i++) {
        for (int j = 0; j < primes.count; j++) {
            int semiCandidate = [[primes objectAtIndex:i] intValue] * [[primes objectAtIndex:j] intValue];
            if (semiCandidate >= min && semiCandidate <= max && ![semiPrimes containsObject:@(semiCandidate)]) {
                [semiPrimes addObject:@(semiCandidate)];
            }
        }
    }
    return semiPrimes;
}
@end

@interface CountSemiprimes : XCTestCase

@end

@implementation CountSemiprimes

- (void)setUp {
}

- (void)tearDown {
}

- (void)testSemiPrime {
    SemiPrimes *semiPrimes = [[SemiPrimes alloc] init];
    NSArray *result1 = [[semiPrimes solution:26 P:[@[@1,@4,@16] mutableCopy] Q:[@[@26,@10,@20] mutableCopy]] copy];
    NSArray *answer1 = @[@(10), @(4), @(0)];
    XCTAssertTrue([result1 isEqualToArray:answer1]);
}

@end
