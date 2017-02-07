//
//  CustomOrderCell.m
//  LearnCar
//
//  Created by 进超王 on 17/1/18.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "CustomOrderCell.h"

@implementation CustomOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.oneView = [[UIView alloc] init];
        self.oneView.backgroundColor = RGBA(237, 237, 236, 1);
        [self.contentView addSubview:self.oneView];
        
        self.twoView = [[UIView alloc] init];
        self.twoView.backgroundColor = RGBA(237, 237, 236, 1);
        [self.contentView addSubview:self.twoView];
        
        self.threeView = [[UIView alloc] init];
        self.threeView.backgroundColor = RGBA(237, 237, 236, 1);
        [self.contentView addSubview:self.threeView];
        
        self.headerImgview = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headerImgview];

        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = [UIFont systemFontOfSize:14];
        self.nameLabel.textColor = RGBA(93, 113, 119, 1);
        [self.contentView addSubview:self.nameLabel];
        
        self.typeLabel = [[UILabel alloc] init];
        self.typeLabel.font = [UIFont systemFontOfSize:13];
        self.typeLabel.textColor = RGBA(93, 113, 119, 1);
        [self.contentView addSubview:self.typeLabel];
        
        self.oneLabel = [[UILabel alloc] init];
        self.oneLabel.font = [UIFont systemFontOfSize:14];
        self.oneLabel.textColor = RGBA(93, 113, 119, 1);
        [self.contentView addSubview:self.oneLabel];

        self.twoLabel = [[UILabel alloc] init];
        self.twoLabel.font = [UIFont systemFontOfSize:14];
        self.twoLabel.textColor = RGBA(93, 113, 119, 1);
        [self.contentView addSubview:self.twoLabel];
        
        self.threeLabel = [[UILabel alloc] init];
        self.threeLabel.font = [UIFont systemFontOfSize:14];
        self.threeLabel.textColor = RGBA(93, 113, 119, 1);
        [self.contentView addSubview:self.threeLabel];

        
        self.fourLabel = [[UILabel alloc] init];
        self.fourLabel.font = [UIFont systemFontOfSize:14];
        self.fourLabel.textColor = RGBA(93, 113, 119, 1);
        [self.contentView addSubview:self.fourLabel];

        self.fiveLabel = [[UILabel alloc] init];
        self.fiveLabel.font = [UIFont systemFontOfSize:14];
        self.fiveLabel.textColor = RGBA(93, 113, 119, 1);
        [self.contentView addSubview:self.fiveLabel];

        
        self.sixLabel = [[UILabel alloc] init];
        self.sixLabel.font = [UIFont systemFontOfSize:14];
        self.sixLabel.textColor = RGBA(93, 113, 119, 1);
        [self.contentView addSubview:self.sixLabel];
        
        self.sevenLabel = [[UILabel alloc] init];
        self.sevenLabel.font = [UIFont systemFontOfSize:14];
        self.sevenLabel.textColor = RGBA(93, 113, 119, 1);
        [self.contentView addSubview:self.sevenLabel];

        self.diTuImgview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dingwei"]];
        [self.contentView addSubview:self.diTuImgview];
        
        self.yaJinLabel = [[UILabel alloc] init];
        self.yaJinLabel.font = [UIFont systemFontOfSize:14];
        self.yaJinLabel.textColor = RGBA(150, 170, 179, 1);
        [self.contentView addSubview:self.yaJinLabel];

        self.jinELabel = [[UILabel alloc] init];
        self.jinELabel.font = [UIFont systemFontOfSize:14];
        self.jinELabel.textColor = RGBA(150, 170, 179, 1);
        self.jinELabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.jinELabel];
        
        self.imgLbView = [[ImgLBView alloc] init];
        [self.contentView addSubview:self.imgLbView];
        
        self.quXiaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.quXiaoBtn.layer.cornerRadius = 5;
        self.quXiaoBtn.layer.borderWidth = 1;
        [self.quXiaoBtn addTarget:self action:@selector(queRenAndQuXiao:) forControlEvents:UIControlEventTouchUpInside];
        self.quXiaoBtn.tag = 1000;
        self.quXiaoBtn.layer.borderColor = RGBA(93, 113, 119, 1).CGColor;
        [self.contentView addSubview:self.quXiaoBtn];
        
        self.fuKuanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.fuKuanBtn.layer.cornerRadius = 5;
        self.fuKuanBtn.layer.borderWidth = 1;
        self.fuKuanBtn.tag = 1001;
        [self.fuKuanBtn addTarget:self action:@selector(queRenAndQuXiao:) forControlEvents:UIControlEventTouchUpInside];
        self.fuKuanBtn.layer.borderColor = RGBA(93, 113, 119, 1).CGColor;
        [self.contentView addSubview:self.fuKuanBtn];
    }
    return self;
}

- (void)setDataWithModel:(OrderModel *)model {
    //设置头像
    [self.headerImgview setFrame:CGRectMake(15, 5, 40, 40)];
    self.headerImgview.clipsToBounds=YES;
    self.headerImgview.image = [UIImage imageNamed:@"default"];
    
    //设置姓名
    [self.nameLabel setFrame:CGRectMake(0, 0, 120, 30)];
    [self.nameLabel setLeft:self.headerImgview.right + 5];
    [self.nameLabel setCenterY:self.headerImgview.centerY];
    
    //第一条分割线
    [self.oneView setFrame:CGRectMake(0, self.headerImgview.bottom + 5, kScreenW, 1)];
    
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
    [self.sevenLabel setFrame:self.oneLabel.height ? CGRectMake(15, self.sixLabel.bottom + 10, kScreenW - 55, 15) : CGRectMake(15, self.sixLabel.bottom, 0, 0)];
    [self.diTuImgview setFrame:self.oneLabel.height ? CGRectMake(kScreenW - 35, self.sixLabel.bottom + 12.5, 20, 20) : CGRectMake(15, self.sixLabel.bottom, 0, 0)];
    
    //第二条分割线
    [self.twoView setFrame:CGRectMake(0, self.sevenLabel.bottom + +10, kScreenW, 1)];
    
    //押金的lable
    [self.yaJinLabel setFrame:CGRectMake(15, self.twoView.bottom + 10, (kScreenW - 30) / 2, 15)];
    
    //付款的lable
    [self.jinELabel setFrame:CGRectMake(kScreenW / 2, self.twoView.bottom + 10, (kScreenW - 30) / 2, 15)];
    
    //第三条分割线
    [self.threeView setFrame:CGRectMake(0, self.jinELabel.bottom + 10, kScreenW, 1)];
    
    //取消的按钮
    [self.quXiaoBtn setFrame:CGRectMake(kScreenW / 2 - 5, self.threeView.bottom + 10, (kScreenW / 2 - 30) / 2, 25)];
    
    //付款的按钮
    [self.fuKuanBtn setFrame:CGRectMake(kScreenW / 2 + (kScreenW / 2 - 30) / 2 + 15, self.threeView.bottom + 10, (kScreenW / 2 - 30) / 2, 25)];
    
    //文字图片的Lable
    [self.imgLbView setTextWithString:@"321" withFrame:CGRectMake(15, self.threeView.bottom + 10, kScreenW, 25)];
    self.imageView.centerY = self.fuKuanBtn.centerY;

    //重新设置frame
    [self setFrame:CGRectMake(0, 0, kScreenW, self.fuKuanBtn.bottom + 10)];
    self.height = self.fuKuanBtn.bottom + 10;
}

- (void)queRenAndQuXiao:(UIButton *)btn {
    
    if ([self.orderCellDelegate respondsToSelector:@selector(clickWithTag:)]) {
        [self.orderCellDelegate clickWithTag:btn.tag];
    }
}


@end
