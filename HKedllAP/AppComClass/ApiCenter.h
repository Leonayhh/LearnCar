//
//  ApiCenter.h
//  GangQinEJia
//
//  Created by ly on 15/12/3.
//  Copyright © 2015年 kedll. All rights reserved.
//

#ifndef ApiCenter_h
#define ApiCenter_h

#define HostAddr                   @"http://www.yuwowang.com"
#define KEDIOS_RandomURCID          [XYStringOperate GetRandomString:@"" lenght:14]
#define api_DevicPost               @"/AppleNS/PostDeviceToken.aspx"//发送设备号
#define api_Version                 @"/xml/Version.xml"//总配置文件
#define api_AreaData                 @"api_AreaData"//城市配置文件
//网络接口----------------------------------------------------------------
#define api_AMAPI_KeepHeart        @"/CAPool/KeepHeart.aspx"
#define api_CAPool_RptError        @"/CAPool/RptError.aspx"
#define api_CAPool_ClientRegister  @"/CAPool/ClientRegister.aspx"//注册
#define api_CAPool_ClientLogin     @"/CAPool/ClientLogin.aspx"//登录
#define api_AFU2012_PostFilesTS    @"/AFU2012/PostFilesTS.aspx"//用户上传
#define api_CAPool_UpdUABinder     @"/CAPool/UpdUABinder.aspx"//更新绑定
#define api_VerificationSMS        @"/CAPool/VerificationSMS.aspx"
#define api_IsUSExits              @"/CAPool/IsUSExits.aspx"
#define api_GetTokenBySMS          @"/CAPool/GetTokenBySMS.aspx"
#define api_ComHtmlPage            @"/CAPool/ComHtmlPage.aspx"
#define api_PostCGMsg              @"/CAPool/PostCGMessage.aspx"
#define api_AMAPI_userinfo         @"/AMAPI/userinfo.aspx"//用户信息
#define api_AMAPI_signin           @"/AMAPI/signin.aspx"//签到
#define api_camp_member            @"/AMAPI/DListCenter.aspx"//阵营成员列表
#define api_apply_joinCamp         @"/AMAPI/SimplePlanCmd.aspx"//申请加入阵营
#define api_apply_exitCamp         @"/AMAPI/SimplePlanCmd.aspx"//申请退出阵营
#define api_user_order             @"/AMAPI/UserOrder.aspx"   //用户订单
//===========================api================================
#define api_ListCenter              @"/AMAPI/DataListCenter.aspx"
#define api_AMAPI_SimplePlanCmd     @"/CAPool/UpdClienter.aspx"
#define api_cmd__UserInfo           @"cmd=UserInfo"
#define api_type_GetLicenseID       @"api_type_GetLicenseID"//GetLicenseID
#define api_type_UpdHeaderImg       @"/CAPool/UpdClienter.aspx"//修改头像
#define api_product_topicContent    @"/AMAPI/SimplePlanCmd.aspx"//上传话题
//===========================AppType================================
#define api_type_GetCampList       @"/AMAPI/DListCenter.aspx" //获取阵营


#endif /* ApiCenter_h */
