//
//  KDCommonFunction.m
//  KedllDemo
//
//  Created by tracy wang on 15/11/27.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "KDCommonFunction.h"
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <Accelerate/Accelerate.h>


#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
#define kCGImageAlphaNoneSkipLast  (kCGBitmapByteOrderDefault | kCGImageAlphaNoneSkipLast)
#else
#define kCGImageAlphaNoneSkipLast  kCGImageAlphaNoneSkipLast
#endif

@implementation KDCommonFunction

+(KDCommonFunction *) sharedCommonFunction
{
    
    static KDCommonFunction *_conmmonFunction=nil;
    
    static dispatch_once_t t;
    //相当于线程同步
    dispatch_once(&t,^{
        
        _conmmonFunction=[[self alloc] init];
        
        
    });
    
    return _conmmonFunction;
    
}


-(id) init
{
    
    if (self=[super init])
    {
        
        
        NSLog(@"alloc");
        
    }
    
    
    return self;
    
}


-(NSString *)fbparserData:(NSString *)dateString
{
    
    dateString=[dateString stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    
    //  dateString=[NSString stringWithFormat:@"%@%@",dateString,@" +0000"];
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    //  [inputFormatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_CN"] autorelease]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate = [inputFormatter dateFromString:dateString];
    // NSLog(@"date = %@", inputDate);
    //  NSLog(@"locdate:%@",[NSDate date]);
    
    NSTimeInterval nowinterval=[[NSDate date] timeIntervalSinceDate: inputDate];
    
    int interval=(int)nowinterval;
    
    NSString *returnString=nil;
    if (interval<60*60) {
        returnString=[NSString stringWithFormat:@"%d分前",(int)interval/60];
    }else if (interval<60*60*24) {
        returnString=[NSString stringWithFormat:@"%d小时前",(int)interval/(60*60)];
    }else if (interval<60*60*24*30) {
        returnString=[NSString stringWithFormat:@"%d天前",(int)interval/(60*60*24)];
    }else if (interval<60*60*24*30*12) {
        returnString=[NSString stringWithFormat:@"%d月前",(int)interval/(60*60*24*30)];
    }else {
        returnString=[NSString stringWithFormat:@"%d年前",(int)interval/(60*60*24*30*365)];
    }
    
    
    return returnString;
    
    
}


//缩放
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize

{
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
    
}


-(NSString *)dataFilePath:(NSString *)fileName
{
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory=[paths objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:fileName];
    
    
    
}




//图片大小
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)newsize{
    
    UIGraphicsBeginImageContext(newsize);
    
    
    [img drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
    
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
    
    
}


//手机号码格式验证
-(BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

//邮箱格式验证
-(BOOL) validateEmail:(NSString *)email
{
    
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
    
    
    
}


//用户名  只能输入6-12个以字母开头、可带数字、“_”、“.”的字串
- (BOOL) validateUserName:(NSString *)name start:(int)start end:(int)end
{
    NSString *userNameRegex = [NSString stringWithFormat:@"^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){%d,%d}$",start-1,end-1];
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
    
}


//字符串转nsdate
- (NSDate *)dateFromString:(NSString *)formatString :(NSString *)dateString
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:formatString];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    
    return destDate;
    
}


-(NSString *)numToWeak:(NSInteger)num
{
    
    NSString *curString=nil;
    
    if (num==1)
    {
        curString=@"周日";
    }
    else if (num==2)
    {
        
        curString=@"周一";
        
        
    }
    else if (num==3)
    {
        
        curString=@"周二";
        
        
    }
    else if (num==4)
    {
        
        curString=@"周三";
        
        
    }
    else if (num==5)
    {
        
        curString=@"周四";
        
        
    }
    else if (num==6)
    {
        
        curString=@"周五";
        
        
    }
    else if (num==7)
    {
        
        curString=@"周六";
        
        
    }
    
    
    return curString;
    
}


//截图
- (UIImage *)imageFromView: (UIView *) theView
{
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(theView.frame.size.width, theView.frame.size.height), YES, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
    
    
}

//裁剪
-(UIImage *) cuttingImage:(UIImage *)orgimage :(CGFloat) width :(CGFloat) height
{
    
    UIImage *newImage=nil;
    
    CGImageRef ref=nil;
    
    if (orgimage.size.width<width*2 && orgimage.size.height<height*2)
    {
        
        
        ref=CGImageCreateWithImageInRect(orgimage.CGImage, CGRectMake(orgimage.size.width/2-width/2, orgimage.size.height/2-height/2, width, height));
        
    }
    else if (orgimage.size.width<width*2 && orgimage.size.height>=height*2)
    {
        
        ref=CGImageCreateWithImageInRect(orgimage.CGImage, CGRectMake(0, orgimage.size.height/2-height/2, width, height));
        
    }
    else if (orgimage.size.width>=width*2 && orgimage.size.height<height*2)
    {
        
        ref=CGImageCreateWithImageInRect(orgimage.CGImage, CGRectMake(orgimage.size.width/2-width/2, 0, width, height));
        
    }
    else if (orgimage.size.width>=width*2 && orgimage.size.height>=height*2)
    {
        
        ref=CGImageCreateWithImageInRect(orgimage.CGImage, CGRectMake(orgimage.size.width/2-width, orgimage.size.height/2-height, width*2, height*2));
        
    }
    else
    {
        
        ref=CGImageCreateWithImageInRect(orgimage.CGImage, CGRectMake(0, 0,orgimage.size.width, orgimage.size.height));
        
    }
    
    
    newImage=[UIImage imageWithCGImage:ref];
    
    
    CGImageRelease(ref);
    
    return newImage;
    
    
}


- (UIImage *)boxblurImageWithBlur:(UIImage *)image
{
    CGFloat blur = 0.6;
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 50);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    
    vImage_Error error;
    
    void *pixelBuffer;
    
    
    //create vImage_Buffer with data from CGImageRef
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    //perform convolution
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL,kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    //  CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
    
    
    
}



- (void)dealloc
{
    
    
    
    
    
    
    
}



@end
