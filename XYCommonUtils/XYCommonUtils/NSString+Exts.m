/*
 * NSString+Exts.m
 * NSString+Exts
 *
 * version 1.0-beta create 9-Aug-2013
 *
 * https://github.com/yanglishuan/Common+Utils
 *
 * BSD license follows (http://www.opensource.org/licenses/bsd-license.php)
 *
 * Copyright (c) 2013-2015 lishuan yang All Rights Reserved.
 *
 * if u find anything wrong or bug, please email to 2008.yls@163.com
 * or contact me on QQ 603291699, i will appreciate it.
 *
 */

#import "NSString+Exts.h"
#import "NSData+Exts.h"
#import <CommonCrypto/CommonCrypto.h>
#import "MF_Base64Additions.h"

@implementation NSString (Exts)

////////////////////////////// 加密、解密  /////////////////////////////////

/** md5 */
- (NSString *)md5
{
    NSString *password = self;
    const char *original_str = [password UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++) {
        [hash appendFormat:@"%02X", result[i]];
    }
    NSString *mdfiveString = [hash lowercaseString];
    NSLog(@"Encryption Result = %@",mdfiveString);
    return mdfiveString;
}

/** base64 */
- (NSString *)base64
{
    return [self base64String];
}

- (NSString *)stringFromBase64
{
    return [NSString stringFromBase64String:self];
}

/** aes256 */
- (NSData *)aes256WithKey:(NSString *)key
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data aes256EncryptWithKey:key];
}

- (NSString *)stringFromAES256:(NSData *)data withKey:(NSString *)key
{
    NSData *ret_data = [data aes256DecryptWithKey:key];
    return [[NSString alloc] initWithData:ret_data encoding:NSUTF8StringEncoding];
}

///////////////////////////// 正则表达式相关  ///////////////////////////////

/* 邮箱验证 MODIFIED BY HELENSONG */
- (BOOL)isValidateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

/* 手机号码验证 MODIFIED BY HELENSONG */
- (BOOL)isValidateMobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:self];
}

/* 车牌号验证 MODIFIED BY HELENSONG */
- (BOOL)isValidateCarNo
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:self];
}

/** 去掉两端空格和换行符 */
- (NSString *)stringByTrimmingBlank
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end

