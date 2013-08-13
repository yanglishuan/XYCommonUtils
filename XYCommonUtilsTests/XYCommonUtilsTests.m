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
    
    NSString *baidu = @"http://www.baidu.com";
    NSString *baidu1 = @"htt://www.baidu.com";
    NSString *baidu2 = @"https://www.baidu.com";
    NSString *baidu3 = @"htt://www.baidu";
    NSString *baidu4 = @"https://www";
    
    NSLog(@"%@ %@ url", baidu, [baidu isValidateUrl] ? @"is" : @"is not");
    NSLog(@"%@ %@ url", baidu1, [baidu1 isValidateUrl] ? @"is" : @"is not");
    NSLog(@"%@ %@ url", baidu2, [baidu2 isValidateUrl] ? @"is" : @"is not");
    NSLog(@"%@ %@ url", baidu3, [baidu3 isValidateUrl] ? @"is" : @"is not");
    NSLog(@"%@ %@ url", baidu4, [baidu4 isValidateUrl] ? @"is" : @"is not");
}

@end
