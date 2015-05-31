//
//  ViewController.m
//  PhotoDemo
//
//  Created by zhoupengfei on 15/5/31.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "ViewController.h"
#import "ImageScrollView.h"
@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollerView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height);
    self.scrollerView.tag = INT_MAX;
    self.scrollerView.pagingEnabled = YES;
    self.scrollerView.delegate = self;
    CGFloat x = 0;
    for (int index = 0; index < 2; index++) {
        ImageScrollView * imageView = [[ImageScrollView alloc]initWithFrame:CGRectMake(x, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        imageView.tag = index+100;
        imageView.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",index]];
        [self.scrollerView addSubview:imageView];
        x += [UIScreen mainScreen].bounds.size.width;
    }

}

int pre;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int currentPage = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    ImageScrollView * imageScrollerView =(ImageScrollView*) [scrollView viewWithTag:pre +100];
    if (currentPage != pre && imageScrollerView.zoomScale >1) {
        [imageScrollerView setZoomScale:1];
    }
    pre = currentPage;
}


@end
