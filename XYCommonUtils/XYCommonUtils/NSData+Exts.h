//
//  NSData+Exts.h
//  XYCommonUtils
//
//  Created by yanglishuan on 13-8-9.
//  Copyright (c) 2013年 yls. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Exts)

////////////////////////////// 加密、解密  /////////////////////////////////

/** 加密 */
- (NSData *)aes256EncryptWithKey:(NSString *)key;

/** 解密 */
- (NSData *)aes256DecryptWithKey:(NSString *)key;


@end