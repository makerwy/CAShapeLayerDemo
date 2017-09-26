//
//  WYBottomView.h
//  CAShapeLayerDemo
//
//  Created by wangyang on 2017/9/12.
//  Copyright © 2017年 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYBottomView;

@protocol WYBottomViewDelegate <NSObject>

@optional

- (void)bottomView:(WYBottomView *)bottomView clickIndex:(NSInteger)index;

@end

@interface WYBottomView : UIView

@property (nonatomic, assign) id delegate;

@end
