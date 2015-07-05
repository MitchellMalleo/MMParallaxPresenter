//
//  MMParallaxPage.m
//  MMParallaxScrollPresenter
//
//  Created by Malleo, Mitch on 12/2/14.
//  Copyright (c) 2014 Mitchell Malleo. All rights reserved.
//

#import "MMParallaxPage.h"
#import "MMParallaxPresenter.h"

#pragma mark - MMHeaderUIView

@implementation MMHeaderUIView

#pragma mark - Public methods

- (void)addSubview:(UIView *)view
{
    if([view isKindOfClass:[UIImageView class]])
    {
        view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, self.contentWidth, self.contentHeight);
        [super addSubview:view];
    }
}

- (void)addTitle:(UIView *)view
{
    [super addSubview:view];
}

@end

@interface MMParallaxPage()

@property (nonatomic) MMParallaxPageTitleAlignment titleAlignment;

@property (nonatomic) int headerHeight;
@property (nonatomic) int headerContentHeight;


@end

#pragma mark - MMParallaxPage

@implementation MMParallaxPage

#pragma mark - Lifecycle

- (instancetype)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height andContentText:(NSString *)contentText
{
    self = [super init];
    
    if(self)
    {
        self.headerHeight = height;
        self.headerContentHeight = height * 2;
        
        self.headerView = [[MMHeaderUIView alloc] initWithFrame:CGRectMake(0, 0, scrollFrame.size.width, self.headerHeight)];
        self.headerView.contentHeight = self.headerContentHeight;
        self.headerView.contentWidth = scrollFrame.size.width;
        
        self.headerLabel = [[UILabel alloc] init];
        self.headerLabel.adjustsFontSizeToFitWidth = YES;
        self.headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:MMParallaxPresenterHeaderTitleSize];
        self.headerLabel.frame = CGRectMake(MMParallaxPresenterContentLabelPadding, self.headerHeight / 2 - MMParallaxPresenterHeaderTitleSize - MMParallaxPresenterHeaderTitlePadding, scrollFrame.size.width - (MMParallaxPresenterHeaderTitlePadding * 2), MMParallaxPresenterHeaderTitleSize + 10);
        self.headerLabel.text = @"Default Title";
        self.headerLabel.textColor = [UIColor whiteColor];
        self.headerLabel.textAlignment = NSTextAlignmentRight;
        [self.headerView addTitle:self.headerLabel];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.text = contentText;
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:16];
        self.contentLabel.frame = CGRectMake(MMParallaxPresenterHeaderTitlePadding, MMParallaxPresenterHeaderTitlePadding, scrollFrame.size.width - (MMParallaxPresenterHeaderTitlePadding * 2), MMParallaxPresenterMaxContentHeight);
        [self.contentLabel sizeToFit];
        
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.headerHeight, scrollFrame.size.width, self.contentLabel.frame.size.height + (MMParallaxPresenterContentLabelPadding * 2))];
        [self.contentView addSubview:self.contentLabel];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setTitleAlignment:MMParallaxPageTitleBottomRightAlignment];
        self.shouldAddShadowToHeaderImage = YES;
    }
    
    return self;
}

- (instancetype)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height withContentText:(NSString *)contentText andContextImage:(UIImage *)image
{
    self = [super init];
    
    if(self)
    {
        self.headerHeight = height;
        self.headerContentHeight = height * 2;
        
        self.headerView = [[MMHeaderUIView alloc] initWithFrame:CGRectMake(0, 0, scrollFrame.size.width, self.headerHeight)];
        self.headerView.contentHeight = self.headerContentHeight;
        self.headerView.contentWidth = scrollFrame.size.width;
        
        self.headerLabel = [[UILabel alloc] init];
        self.headerLabel.adjustsFontSizeToFitWidth = YES;
        self.headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:MMParallaxPresenterHeaderTitleSize];
        self.headerLabel.frame = CGRectMake(MMParallaxPresenterContentLabelPadding, self.headerHeight - MMParallaxPresenterHeaderTitleSize - MMParallaxPresenterHeaderTitlePadding, scrollFrame.size.width - (MMParallaxPresenterHeaderTitlePadding * 2), MMParallaxPresenterHeaderTitleSize + 10);
        self.headerLabel.text = @"Default Title";
        self.headerLabel.textColor = [UIColor whiteColor];
        self.headerLabel.textAlignment = NSTextAlignmentRight;
        [self.headerView addTitle:self.headerLabel];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.text = contentText;
        self.contentLabel.numberOfLines = 0;
        [self.contentLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:16]];
        self.contentLabel.frame = CGRectMake(80, 20, scrollFrame.size.width - 90 - MMParallaxPresenterContentLabelPadding, MMParallaxPresenterMaxContentHeight);
        [self.contentLabel sizeToFit];
        
        UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
        iconView.image = image;
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(39, 80, 1, self.contentLabel.frame.size.height - 60)];
        line.backgroundColor = [UIColor colorWithRed:151/255.0f green:151/255.0f blue:151/255.0f alpha:1.0f];
        
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.headerHeight, scrollFrame.size.width, self.contentLabel.frame.size.height + 50)];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:iconView];
        [self.contentView addSubview:line];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setTitleAlignment:MMParallaxPageTitleBottomRightAlignment];
        self.shouldAddShadowToHeaderImage = YES;
    }
    
    return self;
}

- (instancetype)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height andContentView:(UIView *)contentView
{
    self = [super init];
    
    if(self)
    {
        self.headerHeight = height;
        self.headerContentHeight = height * 2;
        
        self.headerView = [[MMHeaderUIView alloc] initWithFrame:CGRectMake(0, 0, scrollFrame.size.width, self.headerHeight)];
        self.headerView.contentHeight = self.headerContentHeight;
        self.headerView.contentWidth = scrollFrame.size.width;
        
        self.headerLabel = [[UILabel alloc] init];
        self.headerLabel.adjustsFontSizeToFitWidth = YES;
        [self.headerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:MMParallaxPresenterHeaderTitleSize]];
        [self.headerLabel setFrame:CGRectMake(MMParallaxPresenterHeaderTitlePadding, self.headerHeight - MMParallaxPresenterHeaderTitleSize - MMParallaxPresenterHeaderTitlePadding, scrollFrame.size.width - (MMParallaxPresenterHeaderTitlePadding * 2), MMParallaxPresenterHeaderTitleSize + 10)];
        self.headerLabel.text = @"Default Title";
        self.headerLabel.textColor = [UIColor whiteColor];
        self.headerLabel.textAlignment = NSTextAlignmentRight;
        [self.headerView addTitle:self.headerLabel];
        
        self.contentView = contentView;
        self.contentView.frame = CGRectMake(0, self.headerHeight, scrollFrame.size.height, contentView.frame.size.height);
        [self setTitleAlignment:MMParallaxPageTitleBottomRightAlignment];
        self.shouldAddShadowToHeaderImage = YES;
    }
    
    return self;
}

#pragma mark - Custom Accessors

- (int)headerHeight
{
    return _headerHeight;
}

- (int)headerContentHeight
{
    return _headerContentHeight;
}

- (void)setTitleAlignment:(MMParallaxPageTitleAlignment)titleAlignment
{
    _titleAlignment = titleAlignment;
    [self setupTitleFrame];
}

#pragma mark - Private methods

- (void)setupTitleFrame
{
    if(self.titleAlignment == MMParallaxPageTitleBottomLeftAlignment)
    {
        self.headerLabel.frame = CGRectMake(MMParallaxPresenterHeaderTitlePadding, self.headerHeight - MMParallaxPresenterHeaderTitleSize - MMParallaxPresenterHeaderTitlePadding, self.headerLabel.frame.size.width, self.headerLabel.frame.size.height);
        self.headerLabel.textAlignment = NSTextAlignmentLeft;
    }
    else if(self.titleAlignment == MMParallaxPageTitleBottomRightAlignment)
    {
        self.headerLabel.frame = CGRectMake(MMParallaxPresenterHeaderTitlePadding, self.headerHeight - MMParallaxPresenterHeaderTitleSize - MMParallaxPresenterHeaderTitlePadding, self.headerLabel.frame.size.width, self.headerLabel.frame.size.height);
        self.headerLabel.textAlignment = NSTextAlignmentRight;
    }
    else if(self.titleAlignment == MMParallaxPageTitleTopLeftAlignment)
    {
        self.headerLabel.frame = CGRectMake(MMParallaxPresenterHeaderTitlePadding, 0, self.headerLabel.frame.size.width, self.headerLabel.frame.size.height);
        self.headerLabel.textAlignment = NSTextAlignmentLeft;
    }
    else if(self.titleAlignment == MMParallaxPageTitleTopRightAlignment)
    {
        self.headerLabel.frame = CGRectMake(MMParallaxPresenterHeaderTitlePadding, 0, self.headerLabel.frame.size.width, self.headerLabel.frame.size.height);
        self.headerLabel.textAlignment = NSTextAlignmentRight;
    }
}

@end
