//
//  MMParallaxPresenter.m
//  MMParallaxScrollPresenter
//
//  Created by Malleo, Mitch on 12/2/14.
//  Copyright (c) 2014 Mitchell Malleo. All rights reserved.
//

#import "MMParallaxPresenter.h"

@interface MMParallaxPresenter()

@property (strong, nonatomic) NSMutableArray *pageArray;
@property (strong, nonatomic) NSMutableArray *headerScrollViewArray;
@property (strong, nonatomic) NSMutableArray *innerHeaderScrollViewArray;

@property (strong, nonatomic) UIScrollView *headerScrollView;
@property (strong, nonatomic) UIScrollView *innerHeaderScrollView;
@property int totalContentSize;
@property BOOL wasReset;

@end

#pragma mark - MMParallaxPresenter

@implementation MMParallaxPresenter

#pragma mark - Public methods

- (void)addParallaxPage:(MMParallaxPage *)page
{
    if(!self.pageArray || self.wasReset)
    {
        if(self.wasReset)
        {
            self.totalContentSize = 0;
            self.wasReset = NO;
        }
        
        [self setupPresenter];
        
        self.headerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, [page headerHeight])];
        self.headerScrollView.backgroundColor = [UIColor blackColor];
        [self bringSubviewToFront:self.headerScrollView];
        
        self.innerHeaderScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, [page headerHeight])];
        
        self.innerHeaderScrollView.contentSize = CGSizeMake(self.frame.size.width, [page headerContentHeight]);
    }
    else
    {
        int currentContentHeight = 0;
        
        for(int i = 0; i < [self.pageArray count]; i++)
        {
            MMParallaxPage *page = [self.pageArray objectAtIndex:i];
            
            currentContentHeight = currentContentHeight + page.contentView.frame.size.height + [page headerHeight];
        }
        
        self.headerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, currentContentHeight - 1, self.frame.size.width, [page headerHeight])];
        self.innerHeaderScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, [page headerHeight] + 1)];
        
        self.innerHeaderScrollView.contentSize = CGSizeMake(self.frame.size.width, [page headerContentHeight]);
        
        page.contentView.frame = CGRectMake(0, currentContentHeight + [page headerHeight], self.frame.size.width, page.contentView.frame.size.height);
    }
    
    self.headerScrollView.userInteractionEnabled = NO;
    self.innerHeaderScrollView.userInteractionEnabled = NO;
    self.delaysContentTouches = NO;
    
    if(page.shouldAddShadowToHeaderImage)
    {
        [self addShadowToScrollView:self.headerScrollView];
    }
    
    self.headerScrollView.clipsToBounds = NO;
    
    [self.pageArray addObject:page];
    [self.headerScrollViewArray addObject:self.headerScrollView];
    [self.innerHeaderScrollViewArray addObject:self.innerHeaderScrollView];
    
    [self.innerHeaderScrollView addSubview:page.headerView];
    [self.headerScrollView  addSubview:self.innerHeaderScrollView];
    [self.headerScrollView addSubview:page.headerLabel];
    [page.headerLabel bringSubviewToFront:page.headerLabel];
    
    [self addSubview:page.contentView];
    [self addSubview:self.headerScrollView];
    
    self.innerHeaderScrollView.userInteractionEnabled = NO;
    
    self.totalContentSize = self.totalContentSize + page.contentView.frame.size.height + [page headerHeight];
    
    self.contentSize = CGSizeMake(0, self.totalContentSize);
}

- (void)addParallaxPageArray:(NSArray *)pageArray
{
    for(int i = 0; i < [pageArray count]; i++)
    {
        MMParallaxPage *page = [pageArray objectAtIndex:i];
        
        if([page isKindOfClass:[MMParallaxPage class]])
        {
            [self addParallaxPage:page];
        }
    }
}

- (void)reset
{
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
    self.contentSize = CGSizeMake(0, 0);
    self.wasReset = YES;
}

#pragma mark - Private methods

- (void)setupPresenter
{
    self.pageArray = [[NSMutableArray alloc] init];
    self.headerScrollViewArray = [[NSMutableArray alloc] init];
    self.innerHeaderScrollViewArray = [[NSMutableArray alloc] init];
    
    if(!self.headerImagesShouldOnlyScrollAtTop)
    {
        self.headerImagesShouldOnlyScrollAtTop = NO;
    }
    
    self.delegate = self;
}

#pragma mark - UIScrollViewDelegate & ScrollViewUtilityMethods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView == self)
    {
        int currentContentHeight = 0;
        
        for(int i = 0; i < [self.headerScrollViewArray count]; i++)
        {
            UIScrollView *currentHeaderScrollView = [self.headerScrollViewArray objectAtIndex:i];
            UIScrollView *currentInnerHeaderScrollView = [self.innerHeaderScrollViewArray objectAtIndex:i];
            MMParallaxPage *page = [self.pageArray objectAtIndex:i];
            
            if(i == 0)
            {
                if(self.contentOffset.y < 0)
                {
                    currentHeaderScrollView.contentOffset = CGPointMake(0, self.contentOffset.y / 2);
                    currentInnerHeaderScrollView.contentOffset = CGPointMake(0, -(currentInnerHeaderScrollView.frame.size.height / page.contentView.frame.size.height) * self.contentOffset.y);
                }
                else if(self.contentOffset.y < page.contentView.frame.size.height)
                {
                    currentHeaderScrollView.contentOffset = CGPointMake(0, -self.contentOffset.y);
                    
                    currentInnerHeaderScrollView.contentOffset = CGPointMake(0, (currentInnerHeaderScrollView.frame.size.height / page.contentView.frame.size.height) * self.contentOffset.y);
                }
                else
                {
                    currentHeaderScrollView.contentOffset = CGPointMake(0, -page.contentView.frame.size.height);
                }
                
                currentContentHeight = page.contentView.frame.size.height + [page headerHeight];
            }
            else if(i < [self.headerScrollViewArray count])
            {
                currentHeaderScrollView.contentOffset = CGPointMake(0, 0);
                
                if(self.contentOffset.y > currentContentHeight)
                {
                    currentContentHeight = currentContentHeight + page.contentView.frame.size.height + [page headerHeight];
                    
                    if(currentContentHeight > self.contentOffset.y && self.contentOffset.y + [page headerHeight] < currentContentHeight)
                    {
                        currentHeaderScrollView.contentOffset = CGPointMake(0, currentContentHeight - self.contentOffset.y - page.contentView.frame.size.height - [page headerHeight]);
                        
                        if(!self.headerImagesShouldOnlyScrollAtTop)
                        {
                            currentInnerHeaderScrollView.contentOffset = CGPointMake(0, ((currentInnerHeaderScrollView.frame.size.height / page.contentView.frame.size.height) * -currentHeaderScrollView.contentOffset.y + ([page headerContentHeight] - [page headerHeight])) / 2);
                        }
                        else if(self.headerImagesShouldOnlyScrollAtTop)
                        {
                            currentInnerHeaderScrollView.contentOffset = CGPointMake(0, (currentInnerHeaderScrollView.frame.size.height / page.contentView.frame.size.height) * -currentHeaderScrollView.contentOffset.y);
                        }
                    }
                    else
                    {
                        currentHeaderScrollView.contentOffset = CGPointMake(0, -page.contentView.frame.size.height);
                    }
                }
                else if(currentHeaderScrollView.frame.origin.y - self.contentOffset.y < self.frame.size.height && self.contentOffset.y - currentHeaderScrollView.frame.origin.y < 0 && !self.headerImagesShouldOnlyScrollAtTop)
                {
                    currentInnerHeaderScrollView.contentOffset = CGPointMake(0, -((((currentHeaderScrollView.frame.origin.y - self.contentOffset.y) / self.frame.size.height * ([page headerContentHeight] - [page headerHeight])) - ([page headerContentHeight] - [page headerHeight]))) / 2);
                }
            }
        }
    }
}

- (void)addShadowToScrollView:(UIScrollView *)scrollView
{
    scrollView.layer.shadowOpacity = 1.0;
    scrollView.layer.shadowOffset = CGSizeMake(0, 0);
    scrollView.layer.shadowRadius = 8;
    scrollView.layer.shadowColor = [UIColor blackColor].CGColor;
}

@end
