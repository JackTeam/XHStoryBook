//
//  XHMenuItemButton.h
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-14.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    XHMenuItemButtonFadeIn,
    XHMenuItemButtonFadeOut
} XHMenuItemButtonState;
@interface XHMenuItemButton : UIButton
@property (nonatomic, assign) CGFloat degree;
@property (nonatomic, assign) XHMenuItemButtonState state;
- (void)show;
- (void)hide;
@end
