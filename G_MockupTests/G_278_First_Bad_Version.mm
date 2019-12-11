//
//  G_278_First_Bad_Version.m
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/12/10.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

#import <XCTest/XCTest.h>

//Runtime: 0 ms, faster than 100.00% of C++ online submissions for First Bad Version.
//Memory Usage: 8 MB, less than 100.00% of C++ online submissions for First Bad Version.

//bool isBadVersion(int version);
//
//class Solution {
//public:
//    int firstBadVersion(int n) {
//        int low = 0;
//        int high = n;
//
//        while (low < high) {
//            int mid = (low/2 + high/2);
//            if (!isBadVersion(mid) && isBadVersion(mid+1)) {
//                return mid+1;
//            } else if (!isBadVersion(mid)) {
//                low = mid + 1;
//            } else {
//                high = mid;
//            }
//        }
//        return low;
//    }
//};

@interface G_278_First_Bad_Version : XCTestCase
//@property (nonatomic) Solution solution;
@end

@implementation G_278_First_Bad_Version

- (void)setUp {
}

- (void)tearDown {
}

- (void)testExample {
//    self.solution = *(new Solution);
//    int result = self.solution.firstBadVersion(4);
}

@end
