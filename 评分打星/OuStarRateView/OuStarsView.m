//
//  OuStarsView.m
//  OuStarRateView
//
//  Created by ouyangqi on 2019/4/9.
//  Copyright © 2019年 ouyangqi. All rights reserved.
//

#import "OuStarsView.h"


#define kStarMaxCount 5
#define kGrayImgName   @"Star-grey"
#define kYellowImgName  @"yellow_star"

@interface OuStarsView ()

@property (nonatomic, strong) UIView *grayView;
@property (nonatomic, strong) UIView *yellowView;

@property (nonatomic, assign) CGFloat realWidth;
@property (nonatomic, assign) CGFloat realHeight;

@end

@implementation OuStarsView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatInitUI];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self creatInitUI];
    }
    return self;
}

-(void)creatInitUI
{
    UIImage *grayImg = [UIImage imageNamed:kGrayImgName];
    if (grayImg.size.width*kStarMaxCount/grayImg.size.height < self.bounds.size.width/self.bounds.size.height)
    {
        //视图过长
        self.realHeight = self.bounds.size.height;
        self.realWidth = (grayImg.size.width*kStarMaxCount)/grayImg.size.height * self.realHeight;
    }
    else
    {
        self.realWidth = self.bounds.size.width;
        self.realHeight = grayImg.size.height / (grayImg.size.width*kStarMaxCount) * self.realWidth;
    }
    
    CGFloat scale = self.realHeight / grayImg.size.height;
    
    //灰底
    self.grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, grayImg.size.width*kStarMaxCount, grayImg.size.height)];
    self.grayView.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
    self.grayView.clipsToBounds = YES;
    self.grayView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:kGrayImgName]];
    self.grayView.transform = CGAffineTransformMakeScale(scale, scale);
    [self addSubview:self.grayView];
    
    //星星
    self.yellowView = [[UIView alloc] initWithFrame:self.grayView.bounds];
    self.yellowView.center = self.grayView.center;
    self.yellowView.clipsToBounds = YES;
    self.yellowView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:kYellowImgName]];
    self.yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    [self addSubview:self.yellowView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
    [self addGestureRecognizer:tapGesture];
}

-(void)setRate:(CGFloat)rate
{
    _rate = rate;
    
    if (rate > 1) {
        _rate = 1;
    }
    else if (rate < 0){
        _rate = 0;
    }
    
    [self setNeedsLayout];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.yellowView.frame = CGRectMake(self.grayView.frame.origin.x, self.grayView.frame.origin.y, self.realWidth * self.rate, self.realHeight);
}



-(void)gestureAction:(UITapGestureRecognizer *)gesture
{
    if (!self.allowMark) {
        return;
    }
    
    CGPoint point = [gesture locationInView:self];
    double num = (point.x - self.grayView.frame.origin.x) / (self.realWidth/5);
    if (num < 0) {
        num = 0;
    }
    
    self.rate = ceil(num) / kStarMaxCount < 1.0/kStarMaxCount ? 1.0 / kStarMaxCount : ceil(num) / kStarMaxCount;
}




@end
