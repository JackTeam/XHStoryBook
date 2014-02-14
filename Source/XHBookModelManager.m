//
//  XHBookModelManager.m
//  XHStoryBook
//
//  Created by 曾 宪华 on 14-2-13.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHBookModelManager.h"

@interface XHBookModelManager ()

@property (nonatomic, strong) NSArray *bookPapers;

@end

@implementation XHBookModelManager

#pragma mark - Propertys

- (NSArray *)bookPapers {
    if (!_bookPapers) {
        _bookPapers = [[NSArray alloc] init];
    }
    return _bookPapers;
}

#pragma mark - Life cycle

- (void)_setup {
    NSMutableArray *bookPapers = [NSMutableArray new];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSMutableArray *monthSymbols = [[dateFormatter monthSymbols] copy];
    for (NSString *description in monthSymbols) {
        XHBookPaper *bookPaper = [[XHBookPaper alloc] init];
        bookPaper.description = description;
        [bookPapers addObject:bookPaper];
    }
    self.bookPapers = bookPapers;
}

- (id)init {
    self = [super init];
    if (self) {
        [self _setup];
    }
    return self;
}

- (NSUInteger)indexOfViewController:(XHBookDataPaperViewController *)viewController
{
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.bookPapers indexOfObject:viewController.bookPaper];
}

- (XHBookDataPaperViewController *)viewControllerAtIndex:(NSUInteger)index {
    // Return the data view controller for the given index.
    if (([self.bookPapers count] == 0) || (index >= [self.bookPapers count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    XHBookDataPaperViewController *bookDataViewController = [[XHBookDataPaperViewController alloc] init];
    bookDataViewController.bookPaper = self.bookPapers[index];
    return bookDataViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:(XHBookDataPaperViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:(XHBookDataPaperViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.bookPapers count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

@end
