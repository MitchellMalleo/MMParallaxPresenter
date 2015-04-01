//
//  MMParallaxPresenter.h
//  MMParallaxScrollPresenter
//
//  Created by Malleo, Mitch on 12/2/14.
//  Copyright (c) 2014 Mitchell Malleo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMParallaxPage.h"

static int const MMParallaxPresenterMaxContentHeight = 10000;
static int const MMParallaxPresenterContentLabelPadding = 10;

static int const MMParallaxPresenterHeaderTitleSize = 35;
static int const MMParallaxPresenterHeaderTitlePadding = 10;

@interface MMParallaxPresenter : UIScrollView <UIScrollViewDelegate>

//Defaults to NO
@property BOOL headerImagesShouldOnlyScrollAtTop;

- (void)reset;
- (void)addParallaxPage:(MMParallaxPage *)page;
- (void)addParallaxPageArray:(NSArray *)pageArray;

@end
