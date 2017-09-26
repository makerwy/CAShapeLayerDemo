//
//  WYBottomView.m
//  CAShapeLayerDemo
//
//  Created by wangyang on 2017/9/12.
//  Copyright © 2017年 wangyang. All rights reserved.
//

#import "WYBottomView.h"

#define ButtonWidth ([UIScreen mainScreen].bounds.size.width - 20)/ 3.0

@interface WYBottomView ()

/**
 清空所有的线条
 */
@property (nonatomic, strong) UIButton *cleanAllButton;

/**
 撤回上一步
 */
@property (nonatomic, strong) UIButton *cleanLastButton;

/**
 保存到本地
 */
@property (nonatomic, strong) UIButton *saveButton;

@end

@implementation WYBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self addSubview:self.cleanAllButton];
        [self addSubview:self.cleanLastButton];
        [self addSubview:self.saveButton];
    }
    return self;
}

#pragma mark --
#pragma mark -- Methods

- (void)clickButton:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(bottomView:clickIndex:)]) {
        [self.delegate bottomView:self clickIndex:button.tag - 100];
    }
}

#pragma mark --
#pragma mark -- 懒加载

- (UIButton *)cleanAllButton {
    if (!_cleanAllButton) {
        _cleanAllButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cleanAllButton.backgroundColor = [UIColor redColor];
        _cleanAllButton.frame = CGRectMake(5, 0, ButtonWidth, 30);
        _cleanAllButton.tag = 100;
        _cleanAllButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cleanAllButton setTitle:@"清空" forState:UIControlStateNormal];
        [_cleanAllButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cleanAllButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cleanAllButton;
}

- (UIButton *)cleanLastButton {
    if (!_cleanLastButton) {
        _cleanLastButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cleanLastButton.backgroundColor = [UIColor redColor];
        _cleanLastButton.frame = CGRectMake(ButtonWidth + 10, 0, ButtonWidth, 30);
        _cleanLastButton.tag = 101;
        _cleanLastButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cleanLastButton setTitle:@"撤销" forState:UIControlStateNormal];
        [_cleanLastButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cleanLastButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cleanLastButton;
}

- (UIButton *)saveButton {
    if (!_saveButton) {
        _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _saveButton.backgroundColor = [UIColor redColor];
        _saveButton.frame = CGRectMake(ButtonWidth * 2 + 15, 0, ButtonWidth, 30);
        _saveButton.tag = 102;
        _saveButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_saveButton setTitle:@"保存" forState:UIControlStateNormal];
        [_saveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_saveButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveButton;
}
@end
