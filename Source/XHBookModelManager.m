//
//  XHBookModelManager.m
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-13.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHBookModelManager.h"

#import "XHBookDataViewController.h"

@interface XHBookModelManager ()

@property (nonatomic, strong) NSArray *books;

@end

@implementation XHBookModelManager

#pragma mark - Propertys

- (NSArray *)books {
    if (!_books) {
        _books = [[NSArray alloc] init];
    }
    return _books;
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

- (XHBookDataViewController *)viewControllerAtIndex:(NSUInteger)index {
    // Return the data view controller for the given index.
    if (([self.books count] == 0) || (index >= [self.books count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    XHBookDataViewController *bookDataViewController = [[XHBookDataViewController alloc] init];
    
    return bookDataViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:(XHBookDataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:(XHBookDataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.books count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

@end
