//
//  XYCommonUtilsTests.m
//  XYCommonUtilsTests
//
//  Created by yanglishuan on 13-8-9.
//  Copyright (c) 2013年 yls. All rights reserved.
//

#import "XYCommonUtilsTests.h"
#import "XYCommonUtils.h"

@implementation XYCommonUtilsTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testXYCommonUtils
{
    NSString *str1 = @"xy common utils";
    NSString *md5_str1 = [str1 md5];
    
    NSLog(@"str1 = %@", str1);
    NSLog(@"md5_str1 = %@", md5_str1);
}

@end
