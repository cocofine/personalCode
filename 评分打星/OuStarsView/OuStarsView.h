//
//  OuStarsView.h
//  OuStarRateView
//
//  Created by ouyangqi on 2019/4/9.
//  Copyright © 2019年 ouyangqi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OuStarsView : UIView

@property (nonatomic, assign) CGFloat rate;     //比例0~1

@property (nonatomic, assign) BOOL allowMark;//是否允许评分

@end

NS_ASSUME_NONNULL_END
