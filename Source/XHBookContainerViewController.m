//
//  XHBookContainerViewController.m
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-13.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHBookContainerViewController.h"

#import "XHCommon.h"

@interface XHBookContainerViewController () <XHBookDataPaperViewControllerDelegate>

@property (readonly, strong, nonatomic) XHBookModelManager *bookModelManager;

@property (nonatomic, assign) BOOL isShowNavigationBar;
- (void)showNaivgationBar;
- (void)hideNaivgationBar;
@end

@implementation XHBookContainerViewController
@synthesize bookModelManager = _bookModelManager;

#pragma mark - Propertys

- (XHBookModelManager *)bookModelManager {
    if (!_bookModelManager) {
        _bookModelManager = [[XHBookModelManager alloc] init];
    }
    return _bookModelManager;
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

- (void)showNaivgationBar {
    [self _controlNavigationBar:YES];
}

- (void)hideNaivgationBar {
    [self _controlNavigationBar:NO];
}

- (void)_controlNavigationBar:(BOOL)show {
    CGRect naivgationBarFrame = self.navigationController.navigationBar.frame;
    CGFloat padding = 0;
    if ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7.0) {
        padding = 20;
    }
    if (show) {
        naivgationBarFrame.origin.y += 44 + padding;
    } else {
        naivgationBarFrame.origin.y -= 44 + padding;
    }
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.navigationController.navigationBar.frame = naivgationBarFrame;
    } completion:^(BOOL finished) {
        self.isShowNavigationBar = show;
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self hideNaivgationBar];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)_setupPageViewController {
    self.pageViewController = [[XHPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    
    XHBookDataPaperViewController *startingViewController = [self.bookModelManager viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.pageViewController.dataSource = self.bookModelManager;
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    
    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
    [self.pageViewController didMoveToParentViewController:self];
    
    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:153 green:102 blue:51 alpha:1.0];
    self.title = NSLocalizedString(@"StoryBook", @"");
    [self _setupPageViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - XHBookDataPaperViewControllerDelegate method

- (void)tapBookDataPaperViewController:(XHBookDataPaperViewController *)bookDataPaperViewController {
    if (self.isShowNavigationBar) {
        [self hideNaivgationBar];
    } else {
        [self showNaivgationBar];
    }
}

#pragma mark - UIPageViewController delegate methods

 - (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
     
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers {
    if (self.isShowNavigationBar) {
        [self hideNaivgationBar];
    }
}

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (UIInterfaceOrientationIsPortrait(orientation) || ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)) {
        // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
        
        UIViewController *currentViewController = self.pageViewController.viewControllers[0];
        NSArray *viewControllers = @[currentViewController];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        
        self.pageViewController.doubleSided = NO;
        return UIPageViewControllerSpineLocationMin;
    }
    
    // In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.
    XHBookDataPaperViewController *currentViewController = self.pageViewController.viewControllers[0];
    NSArray *viewControllers = nil;
    
    NSUInteger indexOfCurrentViewController = [self.bookModelManager indexOfViewController:currentViewController];
    if (indexOfCurrentViewController == 0 || indexOfCurrentViewController % 2 == 0) {
        UIViewController *nextViewController = [self.bookModelManager pageViewController:self.pageViewController viewControllerAfterViewController:currentViewController];
        viewControllers = @[currentViewController, nextViewController];
    } else {
        UIViewController *previousViewController = [self.bookModelManager pageViewController:self.pageViewController viewControllerBeforeViewController:currentViewController];
        viewControllers = @[previousViewController, currentViewController];
    }
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    
    return UIPageViewControllerSpineLocationMid;
}

@end
