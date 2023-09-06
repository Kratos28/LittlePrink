//
//  T.h
//  Game34
//
//  Created by K on 2021/5/10.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define Game_Key @"5f8fb1a03fda36e4613dcbc4317a5ac4"
#define gameID @"248"
#define AD_ID @"1"
#define Partner_ID @"2"
#define game_pkg @"yanchengji"
#define SDK_Version @"1.1.1"




NS_ASSUME_NONNULL_BEGIN

@interface T : NSObject

/**
 * AES加密
 */
+ (NSString *)aesEncrypt:(NSString *)sourceStr;
 
/**
 * AES解密
 */
+ (NSString *)aesDe:(NSString *)secretStr;

+ (NSString *)getNowTimestamp;
+ (NSDictionary *)GetPlInfo;
+(NSString *)curIDFA;
+ (NSDictionary *)GetGameInfo;
+ (NSDictionary *)GetDeviceInfo;
+ (NSString *)getTimezone;
+ (NSDictionary *)GetOtherInfo;
+ (int )getdirection;
+ (float)safeBottomHeight;
+ (void)deviceMandatoryLandscapeWithNewOrientation:(UIInterfaceOrientation)interfaceOrientation;
+ (BOOL)luanage;
+ (BOOL)JK;


//参数排序
+ (NSString *)sortedWithDic:(NSDictionary *)dict;
+ (void)setdirection:(int)direction;
//获取当前时间
+ (NSString*)getDateTime;
//获取市区
+ (NSString *)getTimestamp;
@end

NS_ASSUME_NONNULL_END

