//
//  XHMenuView.m
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-14.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHMenuView.h"

#import "XHMenuItem.h"
#import "XHMenuItemButton.h"
#define XHMenuItemButtonTag 1000

@implementation XHMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)handleTap:(UITapGestureRecognizer *)tapGestureRecognizer {
    if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if (self.onScreen) {
            [self hide];
        } else {
            CGPoint tapPoint = [tapGestureRecognizer locationInView:tapGestureRecognizer.view];
            self.center = tapPoint;
            [self show];
        }
    }
    
}

- (void)addGestureRecognizerForView:(UIView *)view {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [view addGestureRecognizer:tapGestureRecognizer];
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    [self addGestureRecognizerForView:newSuperview];
}

- (void)show {
    self.onScreen = YES;
    float delay = 0.f; 
    for (XHMenuItemButton *button in self.subviews){
        [self performSelector:@selector(showButton:) withObject:button afterDelay:delay];
        delay += 0.05;
    }
}

- (void)hide {
    for (XHMenuItemButton *button in self.subviews){
        [button hide];
    }
    self.onScreen = NO;
}

- (void)reloadData {
    if (self.menuItems.count)
        [self _layoutSubViews];
}

- (void)_layoutSubViews {
    self.frame = CGRectMake(100, 100, ((UIImage *)((XHMenuItem *)([self.menuItems lastObject])).normalImage).size.height * 2, ((UIImage *)((XHMenuItem *)([self.menuItems lastObject])).normalImage).size.height * 2);
    if (self.subviews.count > 0)
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger i = 0;
    CGFloat degree = 360.f / self.menuItems.count;
    for (XHMenuItem *menuItem in self.menuItems){
        XHMenuItemButton *menuItemButton = [[XHMenuItemButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - menuItem.normalImage.size.width/2, 0, menuItem.normalImage.size.width, menuItem.normalImage.size.height)];
        if (menuItem.normalImage)
            [menuItemButton setBackgroundImage:menuItem.normalImage forState:UIControlStateNormal];
        if (menuItem.highlightedImage)
            [menuItemButton setBackgroundImage:menuItem.highlightedImage forState:UIControlStateHighlighted];
        menuItemButton.degree = i * degree;
        menuItemButton.hidden = YES;
        menuItemButton.tag = i + XHMenuItemButtonTag;
        [menuItemButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuItemButton];
        i++;
    }
}

- (void)buttonPressed:(XHMenuItemButton *)button {
    if (self.onScreen)
        [self hide];
    if (self.delegate){
        if ([self.delegate respondsToSelector:@selector(menuView:didSelectedItemAtIndex:)]){
            [self.delegate menuView:self didSelectedItemAtIndex:button.tag - XHMenuItemButtonTag];
        }
    }
}

- (void)showButton:(XHMenuItemButton *)button{
    [button show];
}

- (void)hideButton:(XHMenuItemButton *)button{
    [button hide];
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
