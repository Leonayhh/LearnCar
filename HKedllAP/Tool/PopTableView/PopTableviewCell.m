//
//  PopTableviewCell.m
//  PinchFish
//
//  Created by 进超王 on 16/10/14.
//  Copyright © 2016年 进超王. All rights reserved.
//

#import "PopTableviewCell.h"

@implementation PopTableviewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = RGBA(237, 237, 237, 1);
    [self.contentView addSubview:self.lineView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lineView.frame = CGRectMake(0, self.height - 1, self.width, 1);
}

@end
