# MMParallaxScrollPresenter

![](https://github.com/MitchellMalleo/MMScrollPresenter/blob/master/mmParallaxPresenter.gif)

---
### Example Setup

1. Clone the repo and drag the MMParallaxPresenter folder into your project. This should include MMHeaderUIView.h/.m, MMParallaxPage.h/.m, and MMParallaxPresenter.h/.m
2. Drag and drop a UIScrollView into your Interface Builder and under the custom class section, subclass your UIScrollView to MMParallaxPresenter
3. Now add: `@property (weak, nonatomic) IBOutlet MMParallaxPresenter *scrollView;` to your list of properties and dont forget to link it up in your Interface Builder
4. Add a MMParallaxPage to the MMScrollPresenter. To do this, you have three init methods at your disposal. All the default views are shown in the above gif in this order:

		-(id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height andContentText:(NSString *)contentText;
		
		-(id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height withContentText:(NSString *)contentText andContextImage:(UIImage *)image;
		
		-(id)initWithScrollFrame:(CGRect)scrollFrame withHeaderHeight:(int)height andContentView:(UIView *)contentView;
		
* Here is the snippet of code slightly modified from the example app included in the repo. This shows how to initalize and setup a page and add it to your presenter:
    
    	MMParallaxPage *page1 = [[MMParallaxPage alloc] initWithScrollFrame:self.scrollView.frame withHeaderHeight:150 andContentText:[self sampleText]];
    	[page1.headerLabel setText:@"Section 1"];
    	[page1.headerView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stars.jpeg"]]];
    	
    	[self.scrollView addParallaxPageArray:@[page1]];

## License

MMParallaxPresenter is available under the MIT license. See the LICENSE file for more info.