//
//  ViewController.m
//  yoga-rounding
//
//  Created by Zuyang Kou on 2018/4/8.
//  Copyright © 2018 Zuyang Kou. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Yoga.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *container1;
@property (nonatomic, strong) UIView *container2;
@property (nonatomic, strong) UIView *nothingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.container1 = [[UIView alloc] init];
    [self.view addSubview:self.container1];

    self.nothingView = [[UIView alloc] init];
    [self.container1 addSubview:self.nothingView];

    self.container2 = [[UIView alloc] init];
    [self.container1 addSubview:self.container2];

    self.label = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"185zxcvs";
        label.font = [UIFont systemFontOfSize:12];
        label;
    });
    [self.container2 addSubview:self.label];

    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
    }];

    [self.container1 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.height = YGPercentValue(100);
        layout.position = YGPositionTypeAbsolute;
        layout.right = YGPointValue(15);
        layout.flexDirection = YGFlexDirectionRowReverse;
        layout.alignItems = YGAlignCenter;
    }];

    [self.nothingView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(6);
        layout.height = YGPointValue(10);
        layout.marginLeft = YGPointValue(6);
    }];

    [self.container2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.paddingLeft = YGPointValue(6);
        layout.paddingRight = YGPointValue(6);
        layout.height = YGPointValue(20);
        layout.flexDirection = YGFlexDirectionRow;
        layout.alignItems = YGAlignCenter;
    }];

    [self.label configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
    }];

    [self.view.yoga applyLayoutPreservingOrigin:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
