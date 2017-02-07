//
//  HKCtrlProtocol.h
//  GangQinEJia
//  控制器协议
//  Created by ly on 15/12/4.
//  Copyright © 2015年 kedll. All rights reserved.
//

#ifndef HKCtrlProtocol_h
#define HKCtrlProtocol_h

@protocol HKCtrlProtocol

//从子级回来
- (void)OnSubCtrlCallRC:(id)obj;

//刷新父级
- (void)NeedRefreshFatherCtrl:(id)obj;

@end

#endif /* HKCtrlProtocol_h */
