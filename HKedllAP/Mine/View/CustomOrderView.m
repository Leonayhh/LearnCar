//
//  CustomOrderView.m
//  LearnCar
//
//  Created by 进超王 on 17/1/18.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "CustomOrderView.h"

@implementation CustomOrderView

- (instancetype) initWithFrame:(CGRect)frame    {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.oneView = [[UIView alloc] init];
        self.oneView.backgroundColor = RGBA(237, 237, 236, 1);
        [self addSubview:self.oneView];
        
        self.twoView = [[UIView alloc] init];
        self.twoView.backgroundColor = RGBA(109, 203, 233, 1);
        [self addSubview:self.twoView];
        
        self.typeLabel = [[UILabel alloc] init];
        self.typeLabel.font = [UIFont systemFontOfSize:15];
        self.typeLabel.textColor = RGBA(93, 113, 119, 1);
        [self addSubview:self.typeLabel];
        
        
        self.oneLabel = [[UILabel alloc] init];
        self.oneLabel.font = [UIFont systemFontOfSize:14];
        self.oneLabel.textColor = RGBA(93, 113, 119, 1);
        [self addSubview:self.oneLabel];
        
        self.twoLabel = [[UILabel alloc] init];
        self.twoLabel.font = [UIFont systemFontOfSize:14];
        self.twoLabel.textColor = RGBA(93, 113, 119, 1);
        [self addSubview:self.twoLabel];
        
        self.threeLabel = [[UILabel alloc] init];
        self.threeLabel.font = [UIFont systemFontOfSize:14];
        self.threeLabel.textColor = RGBA(93, 113, 119, 1);
        [self addSubview:self.threeLabel];
        
        
        self.fourLabel = [[UILabel alloc] init];
        self.fourLabel.font = [UIFont systemFontOfSize:14];
        self.fourLabel.textColor = RGBA(93, 113, 119, 1);
        [self addSubview:self.fourLabel];
        
        self.fiveLabel = [[UILabel alloc] init];
        self.fiveLabel.font = [UIFont systemFontOfSize:14];
        self.fiveLabel.textColor = RGBA(93, 113, 119, 1);
        [self addSubview:self.fiveLabel];
        
        
        self.sixLabel = [[UILabel alloc] init];
        self.sixLabel.font = [UIFont systemFontOfSize:14];
        self.sixLabel.textColor = RGBA(93, 113, 119, 1);
        [self addSubview:self.sixLabel];
        
        self.sevenLabel = [[UILabel alloc] init];
        self.sevenLabel.font = [UIFont systemFontOfSize:14];
        self.sevenLabel.textColor = RGBA(93, 113, 119, 1);
        [self addSubview:self.sevenLabel];
        
        self.eightLabel = [[UILabel alloc] init];
        self.eightLabel.font = [UIFont systemFontOfSize:14];
        self.eightLabel.textColor = RGBA(93, 113, 119, 1);
        [self addSubview:self.eightLabel];
        
        self.diTuImgview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dingwei"]];
        [self addSubview:self.diTuImgview];
    }
    return self;
}

- (void)setDataWithModel:(OrderModel *)model {
    
    //设置左边
    [self.twoView setFrame:CGRectMake(15, 10, 5, 20)];
    
    //设置类型的lable
    [self.typeLabel setFrame:CGRectMake(self.twoView.right + 10, 10, kScreenW - 45, 20)];
    
    //第一条分割线
    [self.oneView setFrame:CGRectMake(0, self.twoView.bottom + 10, kScreenW, 1)];
    
    //第一个显示的lable
    [self.oneLabel setFrame:CGRectMake(15, self.oneView.bottom + 10, kScreenW - 30, 15)];
    
    //第二个显示的lable
    [self.twoLabel setFrame:self.oneLabel.height ? CGRectMake(15, self.oneLabel.bottom + 10, kScreenW - 30, 15) : CGRectMake(15, self.oneLabel.bottom, 0, 0)];
    
    //第三个显示的lable
    [self.threeLabel setFrame:self.oneLabel.height ? CGRectMake(15, self.twoLabel.bottom + 10, kScreenW - 30, 15) : CGRectMake(15, self.twoLabel.bottom, 0, 0)];
    
    //第四个显示的lable
    [self.fourLabel setFrame:self.oneLabel.height ? CGRectMake(15, self.threeLabel.bottom + 10, kScreenW - 30, 15) : CGRectMake(15, self.threeLabel.bottom, 0, 0)];
    //第五个显示的lable
    [self.fiveLabel setFrame:self.oneLabel.height ? CGRectMake(15, self.fourLabel.bottom + 10, kScreenW - 30, 15) : CGRectMake(15, self.fourLabel.bottom, 0, 0)];
    
    //第六个显示的lable
    [self.sixLabel setFrame:self.oneLabel.height ? CGRectMake(15, self.fiveLabel.bottom + 10, kScreenW - 30, 15) : CGRectMake(15, self.fiveLabel.bottom, 0, 0)];
    
    //第七个显示的lable
    [self.sevenLabel setFrame:self.oneLabel.height ? CGRectMake(15, self.sixLabel.bottom + 10, kScreenW - 30, 15) : CGRectMake(15, self.sixLabel.bottom, 0, 0)];
    
    //第八个显示的lable
    [self.eightLabel setFrame:self.oneLabel.height ? CGRectMake(15, self.sevenLabel.bottom + 10, kScreenW - 55, 15) : CGRectMake(15, self.sevenLabel.bottom, 0, 0)];
    
    [self.diTuImgview setFrame:self.oneLabel.height ? CGRectMake(kScreenW - 35, self.sevenLabel.bottom + 12.5, 20, 20) : CGRectMake(15, self.sevenLabel.bottom, 0, 0)];
    
    //重新设置frame
    [self setFrame:CGRectMake(0, 0, kScreenW, self.diTuImgview.bottom + 10)];
    self.height = self.diTuImgview.bottom + 7.5;
}

@end
