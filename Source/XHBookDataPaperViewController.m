//
//  XHBookDataPaperViewController.m
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-13.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHBookDataPaperViewController.h"

#import "XHMenuView.h"

@interface XHBookDataPaperViewController ()

@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) XHMenuView *menuView;
@end

@implementation XHBookDataPaperViewController

#pragma mark - Propertys

- (XHMenuView *)menuView {
    if (!_menuView) {
        _menuView = [[XHMenuView alloc] init];
        [self.view addSubview:_menuView];
    }
    return _menuView;
}

#pragma mark - Action

- (void)tapGestureRecognizerHandle:(UITapGestureRecognizer *)tapGestureRecognizer {
    if ([self.delegate respondsToSelector:@selector(tapBookDataPaperViewController:)]) {
        [self.delegate tapBookDataPaperViewController:self];
    }
}

#pragma mark - UIGesture Delegate Functions

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint touchPoint = [touch locationInView:self.view];
    if (touchPoint.x < 220 && touchPoint.x > 100 && ![touch.view isKindOfClass:[UIButton class]])
        return YES;
    else
        return NO;
}

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

- (void)_setupGesture {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerHandle:)];
    [tapGestureRecognizer setNumberOfTapsRequired:1];
    [tapGestureRecognizer setDelegate:self];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:249 green:234 blue:188 alpha:1.0];
    [self _setupGesture];
    
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 66)];
    _descriptionLabel.text = self.bookPaper.description;
    _descriptionLabel.textAlignment = NSTextAlignmentCenter;
    _descriptionLabel.textColor = [UIColor blackColor];
    _descriptionLabel.center = self.view.center;
    [self.view addSubview:self.descriptionLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
