//
//  XHCommon.m
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-14.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHCommon.h"

@implementation XHCommon
+ (CGFloat)getAdaptorHeight {
    CGFloat adaptorHeight = 0;
    if ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7.0) {
        adaptorHeight += 64;
    }
    return adaptorHeight;
}
@end
