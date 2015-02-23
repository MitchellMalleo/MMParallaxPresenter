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

@property (weak, nonatomic) IBOutlet MMParallaxPresenter *mmParallaxPresenter;
@property (weak, nonatomic) IBOutlet UIButton *resetPresenter;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.mmParallaxPresenter setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
    PageViewController *pageThreeViewController = [[PageViewController alloc] initWithNibName:@"PageViewController" bundle:nil];
    
    MMParallaxPage *page1 = [[MMParallaxPage alloc] initWithScrollFrame:self.mmParallaxPresenter.frame withHeaderHeight:150 andContentText:[self sampleText]];
    [page1.headerLabel setText:@"Section 1"];
    [page1.headerView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stars.jpeg"]]];
    
    MMParallaxPage *page2 = [[MMParallaxPage alloc] initWithScrollFrame:self.mmParallaxPresenter.frame withHeaderHeight:150 withContentText:[self sampleText] andContextImage:[UIImage imageNamed:@"icon.png"]];
    [page2.headerLabel setText:@"Section 2"];
    [page2.headerView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mountains.jpg"]]];

    MMParallaxPage *page3 = [[MMParallaxPage alloc] initWithScrollFrame:self.mmParallaxPresenter.frame withHeaderHeight:150 andContentView:pageThreeViewController.view];
    [page3.headerLabel setText:@"Section 3"];
    [page3 setTitleAlignment:MMParallaxPageTitleBottomLeftAlignment];
    [page3.headerView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dock.jpg"]]];
    
    [self.mmParallaxPresenter addParallaxPageArray:@[page1, page2, page3]];
}

-(IBAction)resetPresenter:(id)sender
{
    [self.mmParallaxPresenter resetPresenter];
    
    MMParallaxPage *page1 = [[MMParallaxPage alloc] initWithScrollFrame:self.mmParallaxPresenter.frame withHeaderHeight:150 andContentText:[self sampleText]];
    [page1.headerLabel setText:@"Section 4"];
    [page1.headerView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"forest.jpg"]]];
    
    MMParallaxPage *page2 = [[MMParallaxPage alloc] initWithScrollFrame:self.mmParallaxPresenter.frame withHeaderHeight:150 withContentText:[self sampleText] andContextImage:[UIImage imageNamed:@"icon.png"]];
    [page2.headerLabel setText:@"Section 35"];
    [page2.headerView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mountains.jpg"]]];
    
    [self.mmParallaxPresenter addParallaxPageArray:@[page1, page2]];
}

-(NSString *)sampleText
{
    return @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n \n Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proideLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n \n Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint ehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
}

@end
