//
//  MMParallaxPage.h
//  MMParallaxScrollPresenter
//
//  Created by Malleo, Mitch on 12/2/14.
//  Copyright (c) 2014 Mitchell Malleo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMHeaderUIView.h"
#import <UIKit/UIKit.h>

typedef enum MMParallaxPageTitleAlignment{
    MMParallaxPageTitleBottomLeftAlignment,
    MMParallaxPageTitleBottomRightAlignment,
    MMParallaxPageTitleTopLeftAlignment,
    MMParallaxPageTitleTopRightAlignment
} MMParallaxPageTitleAlignment;

@interface MMParallaxPage : NSObject

- (id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height andContentText:(NSString *)contentText;
- (id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height withContentText:(NSString *)contentText andContextImage:(UIImage *)image;
- (id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height andContentView:(UIView *)contentView;

- (void)setTitleAlignment:(MMParallaxPageTitleAlignment)titleAlignment;
- (int)headerHeight;
- (int)headerContentHeight;

//Defaults to YES
@property BOOL shouldAddShadowToHeaderImage;

@property (nonatomic, strong) MMHeaderUIView *headerView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end
