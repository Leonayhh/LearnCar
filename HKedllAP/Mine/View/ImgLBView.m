//
//  ImgLBView.m
//  LearnCar
//
//  Created by 进超王 on 17/1/18.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "ImgLBView.h"

@implementation ImgLBView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"youhuijuan1"]];
        [self addSubview:self.imgView];
        
        self.getLB = [[UILabel alloc] init];
        [self addSubview:self.getLB];
    }
    return self;
}


- (void)setTextWithString:(NSString *)str withFrame:(CGRect)frame {
    if (!self.isGet) {
        [self.imgView setFrame:CGRectMake(frame.origin.x, frame.origin.y, 20, 20)];
        [self.getLB setFrame:CGRectMake(25 + frame.origin.x, frame.origin.y, frame.size.width - 25, frame.size.height)];
        self.getLB.textColor = RGBA(232, 85, 42, 1);
        self.getLB.font = [UIFont systemFontOfSize:15];
    } else {
        [self.getLB setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
        self.getLB.textColor = [UIColor lightGrayColor];
        self.getLB.font = [UIFont systemFontOfSize:12];
    }
    self.getLB.text = str;

}



@end
