//
//  T.m
//  Game34
//
//  Created by K on 2021/5/10.
//

#import "T.h"
#import <UIKit/UIKit.h>
#import "sys/utsname.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

#import <objc/message.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>
#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

@implementation T
#define AES(x) [T aesDe:(x)]

+ (void)setdirection:(int)direction
{

    [[NSUserDefaults standardUserDefaults]setInteger:direction forKey:@"direction"];
    [[NSUserDefaults standardUserDefaults]synchronize];
 
}

+ (void)deviceMandatoryLandscapeWithNewOrientation:(UIInterfaceOrientation)interfaceOrientation
{

    
    if([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
            SEL selector = NSSelectorFromString(@"setOrientation:");
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
            [invocation setSelector:selector];
            [invocation setTarget:[UIDevice currentDevice]];
            int val = interfaceOrientation;
            [invocation setArgument:&val atIndex:2];
            [invocation invoke];
        }
    
}


+ (BOOL)luanage
{
    NSString *pfLanguageCode = [NSLocale preferredLanguages][0];
    
    if ([pfLanguageCode containsString:@"zh-Han"]) {
        return  YES;
    }
    return  false;

}

+(int)comDate:(NSString*)date01 withDa:(NSString*)date02
{

    int ci;
     
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];


    NSDate *dt1 =  [[NSDate alloc] init];
    NSDate *dt2 =  [[NSDate alloc] init];
    dt1 = [df dateFromString:date01];
    dt2 = [df dateFromString:date02];
    NSInteger result = [dt1 compare:dt2];

     switch (result)

     {

     //date02比date01大

         case NSOrderedAscending: ci=1; break;

         //date02比date01小

         case NSOrderedDescending: ci=-1; break;

         //date02=date01

         case NSOrderedSame: ci=0; break;

         default: NSLog(@"erorr  %@, %@", dt2, dt1); break;

     }

     return ci;

}

+ (NSString*)getCustamp
{

    NSDate *date = [NSDate date];
       //下面是单独获取每项的值
       NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
       NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitWeekday | NSCalendarUnitHour |NSCalendarUnitMinute |NSCalendarUnitSecond;
       comps = [calendar components:unitFlags fromDate:date];
       //年
    NSInteger year=[comps year];
       //月
    NSInteger month = [comps month];
       //日
    NSInteger day = [comps day];
       //时
    NSInteger hour = [comps hour];
       //分
    NSInteger minute = [comps minute];
       //秒
    NSInteger second = [comps second];
    NSString *s  = [NSString stringWithFormat:@"%ld-%02ld-%02ld %02ld:%02ld:%02ld",year,month,day,hour,minute,second];
    
    return  s;
    
}
+ (BOOL)JK
{

    //MjAyMC0wNi0xNSAxOTo1OToyOA==  2020-06-15 19:59:28
    //MjAyMS0wNC0xOCAxMDowMDoyOA==  2021-04-18 10:00:28
//    NSString *str = @"2021-09-12 10:00:28";
    //2021-09-27 10:00:28
    NSString *str =  @"2023-09-20 10:00:28";
    int d = [T comDate:[T getCustamp] withDa:str];
    if ([T luanage]  && d == -1)
    {
        
       return true;
    }else
    {   return false;
    }
}





//const NSString *AESKey = @"abcdefghABCDEFGH";
const NSString *AESKey = @"abcdefgh";
+ (NSString *)aesEncrypt:(NSString *)sourceStr{
    if (!sourceStr) {
        return nil;
    }
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [AESKey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
     
    NSData *sourceData = [sourceStr dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [sourceData length];
    size_t buffersize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(buffersize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr, kCCBlockSizeAES128, NULL, [sourceData bytes], dataLength, buffer, buffersize, &numBytesEncrypted);
     
    if (cryptStatus == kCCSuccess) {
        NSData *encryptData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        //对加密后的二进制数据进行base64转码
        return [encryptData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    } else {
        free(buffer);
        return nil;
    }
}
 
+ (NSString *)aesDe:(NSString *)secretStr{
    if (!secretStr) {
        return nil;
    }
    //先对加密的字符串进行base64解码
    NSData *decodeData = [[NSData alloc] initWithBase64EncodedString:secretStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
     
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [AESKey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
     
    NSUInteger dataLength = [decodeData length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr, kCCBlockSizeAES128, NULL, [decodeData bytes], dataLength, buffer, bufferSize, &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return result;
    } else {
        free(buffer);
        return nil;
    }
}


+ (NSString *)sortedWithDic:(NSDictionary *)dict
{
    NSArray*keys = [dict allKeys];
    
      NSArray*sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2) {
      return [obj1 compare:obj2 options:NSNumericSearch];

      }];
      NSString*str =@"";
      for(NSInteger i = 0;i<sortedArray.count;i++) {

          
          NSString *categoryId = sortedArray[i];
          id value = [dict objectForKey:categoryId];

          if([value isKindOfClass:[NSDictionary class]]) {

              value = [self stringWithDict:value];
          }

          if([str length] !=0) {
              str = [str stringByAppendingString:@","];
           }
      
          str = [str stringByAppendingFormat:@"%@={%@}",categoryId,value];
          
      }
      
      str = [str stringByReplacingOccurrencesOfString:@"}," withString:@"}&"];

      return str;
}

+ (NSString*)stringWithDict:(NSDictionary*)dict{

    NSArray*keys = [dict allKeys];

    NSArray*sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2) {

    return [obj1 compare:obj2 options:NSNumericSearch];

    }];

    NSString*str =@"";

    for(NSString*categoryId in sortedArray) {

        id value = [dict objectForKey:categoryId];

        if([value isKindOfClass:[NSDictionary class]]) {

            value = [self stringWithDict:value];

        }

        if([str length] !=0) {

            str = [str stringByAppendingString:@","];

        }

        str = [str stringByAppendingFormat:@"\"%@\":\"%@\"",categoryId,value];

    }

    return str;

}



+ (NSString *)getTimestamp
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
      [formatter setDateStyle:NSDateFormatterMediumStyle];
      [formatter setTimeStyle:NSDateFormatterShortStyle];
      [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
      NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
      [formatter setTimeZone:timeZone];
      NSDate *datenow = [NSDate date];
      NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
      return timeSp;
}

+ (NSString*)getDateTime
{

    NSDate *date = [NSDate date];
       //下面是单独获取每项的值
       NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
       NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitWeekday | NSCalendarUnitHour |NSCalendarUnitMinute |NSCalendarUnitSecond;
       comps = [calendar components:unitFlags fromDate:date];
    NSInteger year=[comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger hour = [comps hour];
    NSInteger minute = [comps minute];
    NSInteger second = [comps second];
    NSString *s  = [NSString stringWithFormat:@"%ld-%02ld-%02ld %02ld:%02ld:%02ld",year,month,day,hour,minute,second];
    
    return  s;
    
}



+ (NSString *)getNowTimestamp
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
      [formatter setDateStyle:NSDateFormatterMediumStyle];
      [formatter setTimeStyle:NSDateFormatterShortStyle];
      [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
      NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
      [formatter setTimeZone:timeZone];
      NSDate *datenow = [NSDate date];
      NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
      return timeSp;
}

+ (int )getdirection
{
    NSInteger i =  [[NSUserDefaults standardUserDefaults] integerForKey:@"direction"];
    if (i == 0) {
        //横屏
        return 0;
    }else if (i==1)
    {
        //竖屏
        return 1;
    }else
    {
        return 100;
    }

}


+ (float)safeBottomHeight
{
    if(@available(iOS 11.0, *)) {
        return [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom;
    }
    return 0.0f;
}


+ (NSDictionary *)GetPlInfo
{
    //partner_id
    NSString *partner_id = AES(@"uRZrbdf63w2h0RwKs8OVMQ==");

     NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 AD_ID,@"ad",
                                 Partner_ID,partner_id, nil];
    
    NSString *platform = @"platform";
    return dic;
}
+ (NSDictionary *)GetGameInfo
{
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //game
        NSString *game = @"game";
         NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    //game_version
    NSString *game_version = AES(@"gxcRimHdqDAbSJYKBybgOQ==");
    //game_id
    NSString *game_id = AES(@"jUt3cYLf/QhuTKCw9LtkZg==");
    //game_name
    NSString *game_name = AES(@"rJla40Pe/jIs4tukL/bkxQ==");
         NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     gameID,game_id,
                                     app_Version,game_version,
                                    game_pkg,game_name,
                                    Game_Key,@"game_key",nil];
          
//         return @{game:dic};
    return dic;

}


+(NSString *)curIDFA
{
    

    
    
    return @"00000000-0000-0000-0000-000000000000";
}




+ (NSString *)QFModelName
{
    struct utsname systemInfo;
        uname(&systemInfo);
        NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
        return deviceModel;
}

+ (NSDictionary *)GetOtherInfo
{
    
    NSString *getTimeSt = [self getNowTimestamp];
       NSString *timeZ = [self getTimezone];
    //client_time_zone
    NSString *client_time_zone = AES(@"Tl0QTf9tbm9ISB+sb8YbYYEke2274IzRWCMbGnPdUmo=");
    //client_ts
    NSString *client_ts = AES(@"znHA/EOsVtIpLw0wu39r7A==");
       NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   timeZ,client_time_zone,
                                   getTimeSt,client_ts,@"1",@"work_order_show", nil];
       
//       return @{@"other":dic};
    return dic;

}
#define kDeviceIdentifier @"00000000-0000-0000-0000-000000000000"
#define deviceIDCacheKey @"deviceIdentifier"
#pragma  mark -当用用户运行 idfa deviceIdentifier是 idfa,用户不允许自动生成一个
+(NSString*)deviceIdentifier{
    NSString * deviceIdentifier = [[NSUserDefaults standardUserDefaults] valueForKey:deviceIDCacheKey];
    if (!deviceIdentifier) {
        //从钥匙串中获取唯一设备标识
        deviceIdentifier =  [self keychainGetDataWithAccountIdentifier:@"trigger" andServiceIdentifier:@"deviceIdentifier"];
        if(!deviceIdentifier){
            //IDFV。用IDFV就不用判断是否有无意义的0串了
            deviceIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            //IDFA
//            deviceIdentifier = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
            if ([deviceIdentifier isEqual:kDeviceIdentifier]) {
                //IDFV拿不了就使用 UUIDString;
                deviceIdentifier = NSUUID.UUID.UUIDString;
            }
            [self keychainSaveData:deviceIdentifier withAccountIdentifier:@"trigger" andServiceIdentifier:@"deviceIdentifier"];
//            [self saveDeviceIdentifier:deviceIdentifier];
        }
        [[NSUserDefaults standardUserDefaults] setValue:deviceIdentifier forKey:deviceIDCacheKey];
        [[NSUserDefaults standardUserDefaults] synchronize];

    }
    return deviceIdentifier;
}

+ (NSMutableDictionary *)keychainDicWithAccountId:(NSString *)accountId andServiceId:(NSString *)serviceId{
//构建一个存取条件,实质是一个字典
    NSString *classKey = (__bridge NSString *)kSecClass;
    //指定服务类型是普通密码
    NSString *classValue = (__bridge NSString *)kSecClassGenericPassword;
    NSString *accessibleKey = (__bridge NSString *)kSecAttrAccessible;
    //指定安全类型是任何时候都可以访问
    NSString *accessibleValue = (__bridge NSString *)kSecAttrAccessibleAlways;
    NSString *accountKey = (__bridge NSString *)kSecAttrAccount;
    //指定服务的账户名 可以与服务名相同 账户名可以对应多个服务名
    NSString *accountValue = accountId;
    NSString *serviceKey = (__bridge NSString *)kSecAttrService;
    //指定服务的名字 可以与服务账户名相同
    NSString *serviceValue = serviceId;
    NSDictionary *keychainItems = @{classKey      : classValue,
                                    accessibleKey : accessibleValue,
                                    accountKey    : accountValue,
                                    serviceKey    : serviceValue};
    return keychainItems.mutableCopy;
}

+ (BOOL)keychainSaveData:(id)aData withAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId{
    // 获取存储的数据的条件
    NSMutableDictionary * saveQueryDic = [self keychainDicWithAccountId:accountId andServiceId:serviceId];
    // 删除旧的数据
    SecItemDelete((CFDictionaryRef)saveQueryDic);
    // 设置新的数据
    [saveQueryDic setObject:[NSKeyedArchiver archivedDataWithRootObject:aData] forKey:(id)kSecValueData];
    // 添加数据
    OSStatus saveState = SecItemAdd((CFDictionaryRef)saveQueryDic, nil);
    // 释放对象
    saveQueryDic = nil ;
    // 判断是否存储成功
    if (saveState == errSecSuccess) {
        return YES;
    }
    return NO;
}

+ (id)keychainGetDataWithAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId{
    id idObject = nil ;
    // 通过标记获取数据查询条件
    NSMutableDictionary * readQueryDic = [self keychainDicWithAccountId:accountId andServiceId:serviceId];
    // 查询结果返回到 kSecValueData (此项必选)
    [readQueryDic setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    // 只返回搜索到的第一条数据 (此项必选)
    [readQueryDic setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    // 创建一个对象接受结果
    CFDataRef keyChainData = nil ;
    // 通过条件查询数据
    if (SecItemCopyMatching((CFDictionaryRef)readQueryDic , (CFTypeRef *)&keyChainData) == noErr){
        @try {
            //转换类型
            idObject = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)(keyChainData)];
        } @catch (NSException * exception){
            NSLog(@"Unarchive of search data where %@ failed of %@ ",serviceId,exception);
        }
    }
    if (keyChainData) {
        CFRelease(keyChainData);
    }
    readQueryDic = nil;
    // 返回数据
    return idObject ;
}

+ (BOOL)keychainUpdataData:(id)data withAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId{
    // 通过标记获取数据更新的条件
    NSMutableDictionary * updataQueryDic = [self keychainDicWithAccountId:accountId andServiceId:serviceId];
    // 创建更新数据字典
    NSMutableDictionary * newDic = @{}.mutableCopy;
    // 存储数据
    [newDic setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    // 获取存储的状态
    OSStatus  updataStatus = SecItemUpdate((CFDictionaryRef)updataQueryDic, (CFDictionaryRef)newDic);
    updataQueryDic = nil;
    newDic = nil;
    // 判断是否更新成功
    if (updataStatus == errSecSuccess) {
        return  YES ;
    }
    return NO;
}


+ (void)keychainDeleteWithAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId{
    // 获取删除数据的查询条件
    NSMutableDictionary * deleteQueryDic = [self keychainDicWithAccountId:accountId andServiceId:serviceId];
    // 删除指定条件的数据
    SecItemDelete((CFDictionaryRef)deleteQueryDic);
    deleteQueryDic = nil ;
}



+ (NSDictionary *)GetDeviceInfo
{
    
    NSString *version= [UIDevice currentDevice].systemVersion;
    //device_id
    NSString *device_id = @"device_id";
    //ios_idfa
    NSString *ios_idfa = @"ios_idfa";
    //os_version
    NSString *os_version = AES(@"Xxb2tA8a3G/YieesElUGSg==");
    //sdk_version
    NSString *sdk_version = AES(@"QiovKr5ufVrERthqEwY6IA==");
    //os_type
    NSString *os_type =AES(@"6hSzZv5j8y0xJIeZnwDiFg==");
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    [self deviceIdentifier],device_id,
                                    [self curIDFA],ios_idfa,
                                    @"iOS",os_type,
                                    version,os_version,
                                    [self QFModelName] ,@"model",
                                    [NSString stringWithFormat:@"%d",(int)[UIScreen mainScreen].bounds.size.width],@"screen_width",
                                    [NSString stringWithFormat:@"%d",(int)[UIScreen mainScreen].bounds.size.height],@"screen_height",
                                    @"1.0.0",sdk_version, nil];
//    NSString *device = @"device";
//    return @{device:dic};
    return dic;

}

+ (NSString *)getTimezone
{
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    NSString *strZoneAbbreviation = [localZone abbreviation];
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z]" options:0 error:nil];
    strZoneAbbreviation = [regularExpression stringByReplacingMatchesInString:strZoneAbbreviation options:0 range:NSMakeRange(0, strZoneAbbreviation.length) withTemplate:@""];
    return strZoneAbbreviation;
}


@end

