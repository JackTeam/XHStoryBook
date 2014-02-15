//
//  XHMenuItem.h
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-14.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHMenuItem : NSObject
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *highlightedImage;
- (id)initWithNormalImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage;
@end
