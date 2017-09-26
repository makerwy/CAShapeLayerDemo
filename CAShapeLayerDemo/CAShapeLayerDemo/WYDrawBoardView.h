//
//  WYDrawBoardView.h
//  CAShapeLayerDemo
//
//  Created by wangyang on 2017/9/12.
//  Copyright © 2017年 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYDrawBoardView : UIView

@property (nonatomic, strong) UIColor *lineColor;//线条颜色

@property (nonatomic, assign) CGFloat lineWidth;

- (void)drawImage:(UIImage *)drawImage;



@end
