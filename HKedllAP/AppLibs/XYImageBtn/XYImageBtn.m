//
//  XYImageBtn.m
//  GangQinEJia
//
//  Created by ly on 15/11/20.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "XYImageBtn.h"

@implementation XYImageBtn
@synthesize btnImageView,btnTitleView,titleHeight,titleWidth,imgWidth,imgHeight;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        titleHeight=20;//默认20高度
        titleWidth=self.width;
        imgWidth=self.width;
        imgHeight=self.height-titleHeight;


    }
    return self;
}

-(void)startCreate{
    //标题
    btnTitleView=[[UILabel alloc] initWithFrame:CGRectMake(0, self.height-titleHeight, titleWidth,titleHeight)];
    btnTitleView.font=[UIFont systemFontOfSize:[XYStringOperate GetFontSizeByScreenWithPrt:13]];
    btnTitleView.textAlignment=1;
    btnTitleView.textColor=Color_CommonBlackFontColor;
    btnTitleView.numberOfLines=0;
    [self addSubview:btnTitleView];

    //图片
    btnImageView=[[UIImageView alloc] initWithFrame:CGRectMake((self.width-imgWidth)/2, (self.height-titleHeight-imgHeight)/2, imgWidth, imgHeight)];
    [self addSubview:btnImageView];

}


@end
