//
//  RecordInstace.h
//  LearnCar
//
//  Created by 进超王 on 17/1/12.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecordInstace : NSObject

@property (nonatomic, strong) NSString *titleNameStr;

+(RecordInstace *)shareRecord;

@end
