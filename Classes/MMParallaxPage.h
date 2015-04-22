//
//  MMParallaxPage.h
//  MMParallaxScrollPresenter
//
//  Created by Malleo, Mitch on 12/2/14.
//  Copyright (c) 2014 Mitchell Malleo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum MMParallaxPageTitleAlignment{
    MMParallaxPageTitleBottomLeftAlignment,
    MMParallaxPageTitleBottomRightAlignment,
    MMParallaxPageTitleTopLeftAlignment,
    MMParallaxPageTitleTopRightAlignment
} MMParallaxPageTitleAlignment;

@interface MMHeaderUIView : UIView

- (void)addTitle:(UIView *)view;

@property int contentHeight;
@property int contentWidth;

@end

@interface MMParallaxPage : NSObject

- (id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height andContentText:(NSString *)contentText;
- (id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height withContentText:(NSString *)contentText andContextImage:(UIImage *)image;
- (id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height andContentView:(UIView *)contentView;

- (void)setTitleAlignment:(MMParallaxPageTitleAlignment)titleAlignment;
- (int)headerHeight;
- (int)headerContentHeight;

//Defaults to YES
@property BOOL shouldAddShadowToHeaderImage;

@property (strong, nonatomic) MMHeaderUIView *headerView;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UILabel *headerLabel;
@property (strong, nonatomic) UILabel *contentLabel;

@end
