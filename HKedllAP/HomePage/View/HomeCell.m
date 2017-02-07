//
//  HomeCell.m
//  LearnCar
//
//  Created by 进超王 on 17/1/12.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.typeLB.layer.cornerRadius = 7.5;
    self.typeLB.layer.masksToBounds = YES;
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = RGBA(237, 237, 237, 1);
    [self.contentView addSubview:self.lineView];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lineView.frame = CGRectMake(0, self.height - 1, self.width, 1);
}


@end
