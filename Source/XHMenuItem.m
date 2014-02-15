//
//  XHMenuItem.m
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-14.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHMenuItem.h"

@implementation XHMenuItem

- (id)initWithNormalImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage {
    self = [super init];
    if (self) {
        self.normalImage = normalImage;
        self.highlightedImage = highlightedImage;
    }
    return self;
}

@end
