//
//  RE.m
//  Game34
//
//  Created by K on 2021/5/10.
//

#import "REQ.h"
#import "T.h"
#import <libkern/OSAtomic.h>

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
@implementation REQ
#define AES(x) [T aesDe:(x)]

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


+ (NSString *)StringSortedWithDic:(NSDictionary *)dict
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

+ (void)poWithURLStr:(NSString *)URLString  parameters:(id __nullable )parameters  success:(void (^)(id responseObject))success  failure:(void (^)(NSError *error))failure
{
    
    
    @synchronized(self) {
        
        NSMutableDictionary *mustableDic = [NSMutableDictionary dictionary];
        [mustableDic addEntriesFromDictionary:[T GetPlInfo]];
        [mustableDic addEntriesFromDictionary:[T GetGameInfo]];
        [mustableDic addEntriesFromDictionary:[T GetDeviceInfo]];
        [mustableDic addEntriesFromDictionary:[T GetOtherInfo]];
        
        
        
        NSMutableArray *parameterPairs = [NSMutableArray array];
        [mustableDic enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
            NSString *encodedKey = [key stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            NSString *encodedValue = [value stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            NSString *parameterPair = [NSString stringWithFormat:@"%@=%@", encodedKey, encodedValue];
            [parameterPairs addObject:parameterPair];
        }];
        NSString *queryString = [parameterPairs componentsJoinedByString:@"&"];
        
        
        NSString *url = [NSString stringWithFormat:@"%@&%@",URLString,queryString];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session  dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            
            
            
            if (!error){
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                    success(resDict);
                });
            }else
            {
                failure(error);
            }
            
        }];
        
        
        [task resume];
        
        
    }
}



NSString * QueryStringFromParameters(NSDictionary *dic) {

    
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *key in dic) {
        id value = [dic objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            [array addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
        }else if ([value isKindOfClass:[NSDictionary class]]){
            
            for (NSString *innerkey in value) {
                NSString *innerValue = [value objectForKey:innerkey];
                [array addObject:[NSString stringWithFormat:@"%@[%@]=%@",key, innerkey, innerValue]];
            }
        }
    }
    [array sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    return [array componentsJoinedByString:@"&"];
}
NSString * md5( NSString *str)
{
    const char *cStr = [str UTF8String];
      unsigned char digest[CC_MD5_DIGEST_LENGTH];
      CC_MD5( cStr, strlen(cStr), digest );
      NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
      for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
          [output appendFormat:@"%02x", digest[i]];
      return  output;
}










@end
