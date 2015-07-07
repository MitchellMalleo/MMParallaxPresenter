# MMParallaxPresenter

![](https://github.com/MitchellMalleo/MMParallaxPresenter/blob/master/mmParallaxPresenter.gif)

## Description

MMParallaxPresenter is a UIScrollView that displays text / views with a vertical parallex effect.

## Requirements

- ARC
- iOS 5.0+

## Installation

1. MMParallaxPresenter can be installed via [Cocoapods](http://cocoapods.org/) by adding `pod 'VAProgressCircle'` to your podfile, or you can manually add `MMParallaxPage.h/.m` and `MMParallaxPresenter.h/.m` into your project.
2. Drag and drop a UIScrollView into your Interface Builder and under the custom class section, subclass your UIScrollView to MMParallaxPresenter
3. Now add: `@property (weak, nonatomic) IBOutlet MMParallaxPresenter *mmParallaxPresenter;` to your list of properties and dont forget to link it up in your Interface Builder

## Usage

Add a MMParallaxPage to the MMScrollPresenter. To do this, you have three init methods at your disposal. All the default views are shown in the above gif in this order:

		- (id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height 
			andContentText:(NSString *)contentText;
		
		- (id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height 
			withContentText:(NSString *)contentText andContextImage:(UIImage *)image;
		
		- (id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height 
			andContentView:(UIView *)contentView;
		
This shows how to initalize and setup a page and add it to your presenter:
    
    	MMParallaxPage *page1 = [[MMParallaxPage alloc] 
    		initWithScrollFrame:self.mmParallaxPresenter.frame 
    		withHeaderHeight:150 andContentText:[self sampleText]];
    		
    	page1.headerLabel.text = @"Section 1";
    	
    	[page1.headerView addSubview:[[UIImageView alloc] 
    		initWithImage:[UIImage imageNamed:@"stars.jpeg"]]];
    	
    	[self.scrollView addParallaxPageArray:@[page1]];

## License

MMParallaxPresenter is available under the MIT license. See the LICENSE file for more info.