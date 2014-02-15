//
//  XHMenuView.h
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-14.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XHMenuView;
@protocol XHMenuViewDelegate <NSObject>

@optional
- (void)menuView:(XHMenuView *)menuView didSelectedItemAtIndex:(NSUInteger)index;

@end

@interface XHMenuView : UIView
@property (nonatomic, assign) id <XHMenuViewDelegate> delegate;
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, assign) BOOL onScreen;

- (void)show;
- (void)hide;
- (void)reloadData;
@end
