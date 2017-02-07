//
//  MineCell.m
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "MineCell.h"

@implementation MineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = RGBA(237, 237, 237, 1);
    [self.contentView addSubview:self.lineView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lineView.frame = CGRectMake(0, self.height - 1, self.width, 1);
}

@end
