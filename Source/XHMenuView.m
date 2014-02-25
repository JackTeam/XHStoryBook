//
//  XHMenuView.m
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-17.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHMenuView.h"
#import "XHCommon.h"

@implementation XHMenuView

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if (newSuperview) {
        [self _addGestureForView:newSuperview];
    }
}

- (void)_addGestureForView:(UIView *)newSuperview {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerHandle:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    tapGestureRecognizer.numberOfTouchesRequired = 2;
    [newSuperview addGestureRecognizer:tapGestureRecognizer];
}

- (void)tapGestureRecognizerHandle:(UITapGestureRecognizer *)tapGestureRecognizer {
    CGPoint ponit1 = [tapGestureRecognizer locationOfTouch:0 inView:tapGestureRecognizer.view];
    CGPoint ponit2 = [tapGestureRecognizer locationOfTouch:1 inView:tapGestureRecognizer.view];
    CGRect touchRect = [XHCommon getRectWithStartPoint:ponit1 endPoint:ponit2];
    CGFloat centerX = CGRectGetMidX(touchRect);
    CGFloat centerY = CGRectGetMidY(touchRect);
    CGPoint center = CGPointMake(centerX, centerY);
    NSLog(@"center : %@", NSStringFromCGPoint(center));
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
