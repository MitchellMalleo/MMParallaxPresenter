//
//  MMParallaxPresenter.h
//  MMParallaxScrollPresenter
//
//  Created by Malleo, Mitch on 12/2/14.
//  Copyright (c) 2014 Mitchell Malleo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMParallaxPage.h"

#define kMaxContentHeight 10000
#define kContentLabelPadding 10

#define kHeaderTitleSize 35
#define kHeaderTitlePadding 10

@interface MMParallaxPresenter : UIScrollView <UIScrollViewDelegate>

//Defaults to NO
@property BOOL headerImagesShouldOnlyScrollAtTop;

-(void)resetPresenter;
-(void)addParallaxPage:(MMParallaxPage *)page;
-(void)addParallaxPageArray:(NSArray *)pageArray;

@end
