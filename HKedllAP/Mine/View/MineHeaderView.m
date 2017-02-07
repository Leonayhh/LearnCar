//
//  MineHeaderView.m
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "MineHeaderView.h"

@implementation MineHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backImgview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mineBack"]];
        [self addSubview: self.backImgview];
        
        self.headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.headerBtn setImage:[UIImage imageNamed:@"default"] forState:UIControlStateNormal];
        [self.headerBtn setImage:[UIImage imageNamed:@"default"] forState:UIControlStateHighlighted];
        [self addSubview: self.headerBtn];
        
        self.messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.messageBtn setImage:[UIImage imageNamed:@"msg1"] forState:UIControlStateNormal];
        [self.messageBtn setImage:[UIImage imageNamed:@"msg1"] forState:UIControlStateHighlighted];
        self.messageBtn.badgeValue = @"3";
        self.messageBtn.badgeMinSize = 0.7;
        [self addSubview:self.messageBtn];
        
        self.nameLB = [[UILabel alloc] init];
        self.nameLB.textColor = [UIColor whiteColor];
        self.nameLB.text = @"那是谁";
        self.nameLB.textAlignment = NSTextAlignmentRight;
        self.nameLB.font = [UIFont systemFontOfSize:18];
        [self addSubview:self.nameLB];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backImgview.frame = CGRectMake(0, 0, self.width, self.height);
    self.messageBtn.frame = CGRectMake(self.width - 40, 30, 20, 20);
    self.headerBtn.frame = CGRectMake(self.width - 130, 90, 110, 110);
    self.nameLB.frame = CGRectMake(10, self.headerBtn.top + 45, self.width - 150, 20);
    self.messageBtn.badgeOriginX = self.messageBtn.width - 5;
}



@end
