//
//  ImageScrollView.m
//  PhotoDemo
//
//  Created by zhoupengfei on 15/5/31.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "ImageScrollView.h"

@implementation ImageScrollView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        self.minimumZoomScale = 1;
        self.maximumZoomScale = 2.5;
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        self.imageView.userInteractionEnabled = YES;
        [self addSubview:self.imageView];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomScaleAction:)];
        tap.numberOfTapsRequired = 2;
        [self.imageView addGestureRecognizer:tap];
    }
    return self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

-(void)zoomScaleAction:(UITapGestureRecognizer*)tapGesture{
    if (self.zoomScale >= 2.5) {
        [self setZoomScale:1 animated:YES];
    }else{
       // [self setZoomScale:2.5 animated:YES];
        CGPoint point = [tapGesture locationInView:self];
        [self zoomToRect:CGRectMake(point.x -40,point.y -40, 80, 80) animated:YES];
    }
}



@end
