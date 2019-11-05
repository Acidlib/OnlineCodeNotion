//
//  Encryption.m
//  HackerRankObjectiveCTests
//
//  Created by Yi-Ling Wu on 2019/11/05.
//  Copyright © 2019 Yi-Ling Wu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>

#include "math.h"

@interface Encryption : XCTestCase

@end

@interface Solution:NSObject
- (NSString *) encryption:(NSString *)s;
@end

@implementation Solution
// Complete the encryption function below.
- (NSString *) encryption:(NSString *)s {
    NSString *stripedS = [s stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSInteger ub = ceil(sqrt(s.length));
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < stripedS.length; i++) {
        char c = [stripedS characterAtIndex:i];
        NSString *temp = array.count <= i%ub ? @"" : array[i%ub];
        temp = [temp stringByAppendingFormat:@"%c", c];
        array[i%ub] = temp;
    }
    NSString *output = @"";
    for (int i = 0; i < array.count; i ++) {
        output = i == 0 ? [output stringByAppendingFormat:@"%@", array[i]] : [output stringByAppendingFormat:@" %@", array[i]];
    }
    return output;
}

@end

@implementation Encryption

- (void)setUp {
}

- (void)tearDown {
}

- (void)testEncryption {
    Solution *solution = [[Solution alloc] init];
    NSString *output = [solution encryption:@"haveaniceday"];
    XCTAssertTrue([output isEqualToString: @"hae and via ecy"]);
    output = [solution encryption:@"feedthedog"];
    XCTAssertTrue([output isEqualToString: @"fto ehg ee dd"]);
    output = [solution encryption:@"wclwfoznbmyycxvaxagjhtexdkwjqhlojykopldsxesbbnezqmixfpujbssrbfhlgubvfhpfliimvmnny"];
    XCTAssertTrue([output isEqualToString: @"wmgjpnull cyjqlejgi lyhhdzbui wctlsqsbm fxeoxmsvv ovxjeirfm zadysxbhn nxkkbffpn bawobphfy"]);
}


@end
