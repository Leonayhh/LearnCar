//
//  PopheaderView.m
//  LearnCar
//
//  Created by 进超王 on 17/1/19.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "PopheaderView.h"

@implementation PopheaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.cancelLB = [[UILabel alloc] init];
        self.cancelLB.text = @"取消订单";
        self.cancelLB.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.cancelLB];
        
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cancelBtn setImage:[UIImage imageNamed:@"Shape"] forState:UIControlStateNormal];
        [self addSubview:self.cancelBtn];

        
       
        
        self.line = [[UIView alloc] init];
        self.line.backgroundColor = RGBA(237, 237, 237, 1);
        [self addSubview:self.line];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.cancelLB.frame = CGRectMake(0, 10, kScreenW, 19);
    self.cancelBtn.frame = CGRectMake(15, 10, 20, 20);
    self.line.frame = CGRectMake(0, self.cancelLB.bottom + 10, kScreenW, 1);
}

@end
