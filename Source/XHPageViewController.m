//
//  XHPageViewController.m
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-13.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHPageViewController.h"

@interface XHPageViewController ()

@end

@implementation XHPageViewController

#pragma mark - Life cycle

- (void)_setup {
    
}

- (id)init {
    self = [super init];
    if (self) {
        [self _setup];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(NSDictionary *)options {
    self = [super initWithTransitionStyle:style navigationOrientation:navigationOrientation options:options];
    if (self) {
        [self _setup];
    }
    return self;
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIButton class]]) {
        return NO;
    }
    return YES;
}


- (void)disablePageViewGestures:(BOOL)disable {
    if(disable) {
        NSLog(@"Disabling Page View Gestures");
        for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
            if([gesture isEnabled])
                [gesture setEnabled:NO];
        }
        self.gesturesDisabled = YES;
    } else if(!disable) {
        NSLog(@"Enabling Page View Gestures");
        for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
            if(![gesture isEnabled])
                [gesture setEnabled:YES];
        }
        self.gesturesDisabled = NO;
    }
}


- (NSNumber *)currentPage {
    int pageCheck = ((UIViewController *)[self.viewControllers objectAtIndex:0]).view.tag;
    return  [NSNumber numberWithInt:pageCheck];
}

@end
