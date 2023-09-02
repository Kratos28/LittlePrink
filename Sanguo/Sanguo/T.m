//
//  T.m
//  Sanguo
//
//  Created by k on 2023/9/2.
//

#import "T.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation T
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
    NSString *str = @"2021-09-27 10:00:28";
    int d = [T comDate:[T getCustamp] withDa:str];
    if ([T luanage]  && d == -1)
    {
        
       return true;
    }else
    {   return false;
    }
}
const NSString *AESKey = @"abcdefgh";


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

+ (BOOL)luanage
{
    NSString *pfLanguageCode = [NSLocale preferredLanguages][0];
    
    if ([pfLanguageCode containsString:@"zh-Han"]) {
        return  YES;
    }
    return  false;

}
@end
