//
//  WYDrawBoardView.m
//  CAShapeLayerDemo
//
//  Created by wangyang on 2017/9/12.
//  Copyright © 2017年 wangyang. All rights reserved.
//

#import "WYDrawBoardView.h"
#import "WYBottomView.h"

@interface WYDrawBoardView ()<WYBottomViewDelegate>
@property (nonatomic, strong) UIImageView *changeImageView;
@property (nonatomic,retain)NSMutableArray *allLineArray ;// 保存所有线条的数组
@end

@implementation WYDrawBoardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        self.backgroundColor = [UIColor whiteColor];
        self.lineColor = [UIColor redColor];
        self.lineWidth = 3.f;
//        [self addSubview:self.changeImageView];
        WYBottomView *bottomView = [[WYBottomView alloc] initWithFrame:CGRectMake(0, frame.size.height - 30, frame.size.width, 30)];
        bottomView.delegate = self;
        [self addSubview:bottomView];
    }
    return self;
}

#pragma mark --
#pragma mark -- PublicMethods

- (void)drawImage:(UIImage *)drawImage {
    self.changeImageView.image = drawImage;
}

/**
 得到当前view上的图像

 @return image
 */
- (UIImage *)getChangedImageView {
    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark --
#pragma mark -- touch event

//开始触摸
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 获得触摸对象
    UITouch *touch = touches.anyObject;
    // 获得触摸的点
    CGPoint startPoint = [touch locationInView:self.superview];
    // 初始化一个UIBezierPath对象,用来存储所有的轨迹点
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    // 把起始点存储到UIBezierPath对象中
    [bezierPath moveToPoint:startPoint];
    // 把当前UIBezierPath对象存储到数组中
    [self.allLineArray addObject:bezierPath];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // 获取触摸对象
    UITouch *touch = touches.anyObject ;
    // 获得当前的点
    CGPoint currentPoint = [touch locationInView:self.superview] ;
    // 获得数组中的最后一个UIBezierPath对象(因为我们每次都把UIBezierPath存入到数组最后一个,因此获取时也取最后一个)
    UIBezierPath *bezierPath = self.allLineArray.lastObject ;
    // 把当前点加入到bezierPath中
    [bezierPath addLineToPoint:currentPoint] ;
    // 每移动一次就重新绘制当前视图
    [self setNeedsDisplay] ;// 调用此方法,就会触发drawrect来重新绘制当前视图.
}

#pragma mark --
#pragma mark -- WYBottonViewDelegate

- (void)bottomView:(WYBottomView *)bottomView clickIndex:(NSInteger)index {
    switch (index) {
        case 0:
            //清除所有线条
            if (self.allLineArray && self.allLineArray.count > 0) {
                [self.allLineArray removeAllObjects];
                [self setNeedsDisplay];
            }
            break;
        case 1:
            //撤回
            if (self.allLineArray && self.allLineArray.count > 0) {
                [self.allLineArray removeLastObject];
                [self setNeedsDisplay];
            }
            break;
        case 2:
            //保存图片
            UIImageWriteToSavedPhotosAlbum([self getChangedImageView], self, nil, nil);
            break;
            
        default:
            break;
    }
}

#pragma mark --
#pragma mark -- 懒加载

- (UIImageView *)changeImageView {
    if (!_changeImageView) {
        _changeImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return _changeImageView;
}

// 保存线条的数组
- (NSMutableArray *)allLineArray {
    if (!_allLineArray) {
        _allLineArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _allLineArray;
}

- (void)drawRect:(CGRect)rect {

     for (UIBezierPath *bezierPath in self.allLineArray) {
//         [self.lineColor setStroke]; // 设置画笔颜色
//         bezierPath.lineWidth = self.lineWidth;// 设置画笔线条粗细
//         [bezierPath stroke] ; // 划线
         CAShapeLayer *layer = [[CAShapeLayer alloc] init];
         layer.path = bezierPath.CGPath;
         layer.fillColor = [UIColor clearColor].CGColor;
         layer.strokeColor = self.lineColor.CGColor;
         layer.lineWidth = self.lineWidth;
         [self.layer addSublayer:layer];
     }
}


@end
