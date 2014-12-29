//
//  MainViewController.m
//  MMParallaxScrollPresenter
//
//  Created by Malleo, Mitch on 12/2/14.
//  Copyright (c) 2014 Mitchell Malleo. All rights reserved.
//

#import "MainViewController.h"
#import "MMParallaxPresenter.h"
#import "PageViewController.h"
#import "MMParallaxPage.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet MMParallaxPresenter *scrollView;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PageViewController *pageThreeViewController = [[PageViewController alloc] initWithNibName:@"PageViewController" bundle:nil];
    
    MMParallaxPage *page1 = [[MMParallaxPage alloc] initWithScrollFrame:self.scrollView.frame withHeaderHeight:150 andContentText:[self sampleText]];
    [page1.headerLabel setText:@"Section 1"];
    [page1.headerView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stars.jpeg"]]];
    
    MMParallaxPage *page2 = [[MMParallaxPage alloc] initWithScrollFrame:self.scrollView.frame withHeaderHeight:150 withContentText:[self sampleText] andContextImage:[UIImage imageNamed:@"console.png"]];
    [page2.headerLabel setText:@"Section 2"];
    [page2.headerView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mountains.jpg"]]];

    MMParallaxPage *page3 = [[MMParallaxPage alloc] initWithScrollFrame:self.scrollView.frame withHeaderHeight:150 andContentView:pageThreeViewController.view];
    [page3.headerLabel setText:@"Section 3"];
    [page3 setTitleAlignment:MMParallaxPageTitleBottomLeftAlignment];
    [page3.headerView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dock.jpg"]]];
    
    [self.scrollView addParallaxPageArray:@[page1, page2, page3]];
}

-(NSString *)sampleText
{
    return @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n \n Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proideLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n \n Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint ehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
}

@end
