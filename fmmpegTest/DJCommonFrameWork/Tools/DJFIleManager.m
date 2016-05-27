//
//  DJFIleManager.m
//  fmmpegTest
//
//  Created by sogou on 16/5/27.
//  Copyright © 2016年 sogou. All rights reserved.
//

#import "DJFIleManager.h"

@implementation DJFIleManager

+ (BOOL)removeFile:(NSString *)filepath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager removeItemAtPath:filepath error:NULL];
}

@end
