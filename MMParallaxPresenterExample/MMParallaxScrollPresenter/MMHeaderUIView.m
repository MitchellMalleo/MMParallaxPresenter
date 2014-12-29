//
//  MMHeaderUIView.m
//  MMParallaxScrollPresenter
//
//  Created by Malleo, Mitch on 12/29/14.
//

#import "MMHeaderUIView.h"

@implementation MMHeaderUIView

-(void)addSubview:(UIView *)view
{
    if([view isKindOfClass:[UIImageView class]])
    {
        [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, self.contentWidth, self.contentHeight)];
        [super addSubview:view];
    }
}

-(void)addTitle:(UIView *)view
{
    [super addSubview:view];
}

@end
