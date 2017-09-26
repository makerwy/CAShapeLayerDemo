//
//  ViewController.m
//  CAShapeLayerDemo
//
//  Created by wangyang on 2017/9/12.
//  Copyright © 2017年 wangyang. All rights reserved.
//

#import "ViewController.h"
#import "WYDrawBoardView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    WYDrawBoardView *drawBoardView = [[WYDrawBoardView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:drawBoardView];
    [drawBoardView drawImage:[UIImage imageNamed:@"icon_share_book"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
