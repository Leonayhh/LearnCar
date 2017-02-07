//
//  KDCommonFunction.h
//  KedllDemo
//
//  Created by tracy wang on 15/11/27.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

//kedll
//该类封装了所有的常用函数
@interface KDCommonFunction : NSObject






/*
 *@brief 单例
 */
+(KDCommonFunction *) sharedCommonFunction;


/* @brief 将标准时间转换成多少时间前 例如 10分钟前
 * @param dateString 传入的时间参数 格式为2013-10-24 11:10:00
 * @return 返回转换后的时间
 */
-(NSString*)fbparserData:(NSString *)dateString;


/* @brief uiimage的缩放
 * @param image 传入的目标 scaleSize 缩放的比例
 * @return 返回缩放后的uiimage
 */
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;


/* @brief 获取沙盒的路径 可以自己拼接上自己的文件名
 * @param fileName 文件名字 比如：xxx.plist
 * @return 返回拼接后的完整文件路径
 */
-(NSString *)dataFilePath:(NSString *)fileName;


/* @brief 重新设置图片的大小
 * @param img 传入的iamge newsize 要设定的大小
 * @return 新的uiimage
 */
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)newsize;


/* @brief 正则检测手机号码格式是否正确
 * @param mobile 传入的手机号码
 * @return 布尔值
 */
-(BOOL) validateMobile:(NSString *)mobile;

/* @brief 正则检测邮箱格式是否正确
 * @param email 传入的邮箱地址
 * @return 布尔值
 */
-(BOOL) validateEmail:(NSString *)email;

/* @brief 正则检测用户名格式是否正确
 * @param name 传入的用户名 start 长度的开始 end 长度的结束 例如 6-12位
 * @return 布尔值
 */
- (BOOL) validateUserName:(NSString *)name start:(int)start end:(int)end;

/* @brief 字符串转时间
 * @param formatString 传入的时间格式 dateString 时间字符串
 * @return 时间类型
 */
- (NSDate *)dateFromString:(NSString *)formatString :(NSString *)dateString;


/* @brief 数字转周几  * @param num 传入的数字
 * @return 周几
 */
-(NSString *)numToWeak:(NSInteger)num;


/* @brief 截取当前视图，转成图片
 * @param theView 传入的视图
 * @return 图片
 */
- (UIImage *)imageFromView: (UIView *) theView;


/* @brief 裁剪图片
 * @param orgimage 传入的需要裁剪的图片 width 图片宽度 height 图片高度
 * @return 裁剪后的图片
 */
-(UIImage *) cuttingImage:(UIImage *)orgimage :(CGFloat) width :(CGFloat) height;

/* @brief 模糊图片
 * @param image 传入的图片
 * @return 模糊后的图片
 */
- (UIImage *)boxblurImageWithBlur:(UIImage *)image;


@end
