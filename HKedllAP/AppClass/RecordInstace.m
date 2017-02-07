//
//  RecordInstace.m
//  LearnCar
//
//  Created by 进超王 on 17/1/12.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "RecordInstace.h"

@implementation RecordInstace

+ (RecordInstace *)shareRecord {
    static RecordInstace *stance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stance = [[RecordInstace alloc] init];
        stance.titleNameStr = @"首页";
    });
    return stance;
}

@end
