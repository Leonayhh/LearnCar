//
//  TypeView.m
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "TypeView.h"

@implementation TypeView

- (instancetype)initWithFrame:(CGRect)frame {
    self =  [super initWithFrame:frame];
    if (self) {
        CGFloat kw = (kScreenW - 2) / 3;
        self.learnCarBtn = [YLButton buttonWithType:UIButtonTypeCustom];
        [self.learnCarBtn setImage:[UIImage imageNamed:@"car"] forState:UIControlStateNormal];
        [self.learnCarBtn setTitle:@"我要学车" forState:UIControlStateNormal];
        self.learnCarBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        self.learnCarBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.learnCarBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.learnCarBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        self.learnCarBtn.imageRect = CGRectMake(kw/2 - 17, 35, 34, 28);
        self.learnCarBtn.titleRect = CGRectMake(0, 80, kw, 15);
        [self addSubview:self.learnCarBtn];
        self.learnCarBtn.frame = CGRectMake(0, 0, kw, kw);
        self.learnCarBtn.backgroundColor = [UIColor whiteColor];
        [self.learnCarBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        self.orderDrivingBtn = [YLButton buttonWithType:UIButtonTypeCustom];
        [self.orderDrivingBtn setImage:[UIImage imageNamed:@"peijia"] forState:UIControlStateNormal];
        [self.orderDrivingBtn setTitle:@"预约陪驾" forState:UIControlStateNormal];
        self.orderDrivingBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        self.orderDrivingBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.orderDrivingBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.orderDrivingBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        self.orderDrivingBtn.imageRect = CGRectMake(kw/2 - 17, 35, 34, 34);
        self.orderDrivingBtn.titleRect = CGRectMake(0, 80, kw, 15);
        [self addSubview:self.orderDrivingBtn];
        self.orderDrivingBtn.frame = CGRectMake(kw + 1, 0, kw, kw);
        self.orderDrivingBtn.backgroundColor = [UIColor whiteColor];
        [self.orderDrivingBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        self.maintainBtn = [YLButton buttonWithType:UIButtonTypeCustom];
        [self.maintainBtn setImage:[UIImage imageNamed:@"weixiu"] forState:UIControlStateNormal];
        [self.maintainBtn setTitle:@"车保维修" forState:UIControlStateNormal];
        self.maintainBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        self.maintainBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.maintainBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.maintainBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        self.maintainBtn.imageRect = CGRectMake(kw/2 - 17, 35, 34, 34);
        self.maintainBtn.titleRect = CGRectMake(0, 80, kw, 15);
        [self addSubview:self.maintainBtn];
        self.maintainBtn.frame = CGRectMake(kw * 2 + 2, 0, kw, kw);
        self.maintainBtn.backgroundColor = [UIColor whiteColor];
        [self.maintainBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        self.oneView = [[UIView alloc] initWithFrame:CGRectMake(kw, 0, 1, kw)];
        self.oneView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.oneView];
        
        self.twoView = [[UIView alloc] initWithFrame:CGRectMake( 2*kw + 1, 0, 1, kw)];
        self.twoView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.twoView];
    }
    return self;
}

- (void)btnClick:(YLButton *) btn {
    if ([self.TypeViewDelegate respondsToSelector:@selector(btnClickWithYLButton:)]) {
        [self.TypeViewDelegate btnClickWithYLButton:btn];
    }
}


@end
