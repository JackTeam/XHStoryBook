//
//  XHMenuView.m
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-17.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
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
