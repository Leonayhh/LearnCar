//
//  MsgCell.m
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "MsgCell.h"

@implementation MsgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.mesView.layer.cornerRadius = 5;
    self.mesView.layer.masksToBounds = YES;
    
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = RGBA(237, 237, 237, 1);
    [self.contentView addSubview:self.lineView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lineView.frame = CGRectMake(0, self.height - 1, self.width, 1);
}

@end
