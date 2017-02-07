//
//  QBCell.m
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "QBCell.h"

@implementation QBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = RGBA(237, 237, 237, 1);
    [self addSubview:self.lineView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lineView.frame = CGRectMake(0, self.height - 1, self.width, 1);
}

@end
