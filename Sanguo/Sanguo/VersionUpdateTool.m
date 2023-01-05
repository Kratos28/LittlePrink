//
//  VersionUpdateTool.m
//  Sanguo
//
//  Created by Kratos on 2022/11/29.
//

#import "VersionUpdateTool.h"
#define ISREVIEW @"isReview"
#import <UIKit/UIKit.h>

@interface VersionUpdateTool () {
    NSString *appStreaUrl;
    NSString *appStreaUrl_cn;
}

@property(nonatomic,strong)NSDictionary *info;
@end
@implementation VersionUpdateTool


-(instancetype)init {
    if (self = [super init]) {
        appStreaUrl = @"https://itunes.apple.com/lookup";//[NSString stringWithFormat:@"https://itunes.apple.com/lookup?id=%@",APPSTOREID];
        appStreaUrl_cn = @"https://itunes.apple.com/cn/lookup";//[NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?id=%@",APPSTOREID];
    }
    return self;
}
+(VersionUpdateTool *)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id Tool = nil;
    dispatch_once(&pred, ^{
        Tool = [[self alloc] init];
    });
    return Tool;
}

-(BOOL)isNeedUpdate:(NSString *)appstoreVersion curVersion:(NSString *)curVersion {
    NSArray *curVerArr = [curVersion componentsSeparatedByString:@"."];
    NSArray *appstoreVerArr = [appstoreVersion componentsSeparatedByString:@"."];
    BOOL needUpdate = NO;
    //比较版本号大小
    int maxv = (int)MAX(curVerArr.count, appstoreVerArr.count);
    int cver = 0;
    int aver = 0;
    for (int i = 0; i < maxv; i++) {
        if (appstoreVerArr.count > i) {
            aver = [NSString stringWithFormat:@"%@",appstoreVerArr[i]].intValue;
        }
        else{
            aver = 0;
        }
        if (curVerArr.count > i) {
            cver = [NSString stringWithFormat:@"%@",curVerArr[i]].intValue;
        }
        else{
            cver = 0;
        }
        if(aver != cver) {
            if (aver > cver) {
                needUpdate = YES;
            }else {
                needUpdate = NO;
            }
            return needUpdate;
        }
    }
    return needUpdate;
}

//版本检查更新
-(void)VersionUpdate {
    __block NSDictionary *appStre_cn_dic;//加cn链接的返回数据
    [self Internet_url:appStreaUrl_cn :^(NSError *error, NSDictionary *dic) {
        if (!error) {
            appStre_cn_dic = dic;
            [self Internet_url:appStreaUrl :^(NSError *error, NSDictionary *dic) {
                if (!error) {
                    NSDictionary *newDic = [self getNewDic_appStreCnDic:appStre_cn_dic appStreDic:dic];
                    NSArray *arr = newDic[@"results"];
                    if (arr.count > 0) {
                        self.info = arr[0];
                        NSString *appstoreVersion = self.info[@"version"];
                        NSString *curVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
                        if ([self isNeedUpdate:appstoreVersion curVersion:curVersion]){
                            dispatch_async(dispatch_get_main_queue(), ^{
                                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"发现新版本" message:[NSString stringWithFormat:@"version %@ \n\n%@",appstoreVersion,self.info[@"releaseNotes"]] delegate:self cancelButtonTitle:@"以后再说" otherButtonTitles:@"立即更新", nil];
                                [alert show];
                            });
                        }
                    }
                }
            }];
        }
    }];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:self.info[@"trackViewUrl"]]];
    }
}

-(void)Internet_url:(NSString *)url :(CacheBlockData)block {
    //一定要是POST请求，要不返回的信息不准确
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [[NSString stringWithFormat:@"id=%@",APPSTOREID] dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                NSDictionary *dic =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                block(nil,dic);
            }else {
                block(error,nil);
            }
        });
    }];
    [task resume];
}

//获取当前版本发布日期
-(NSString *)get_currentVersionReleaseDate:(NSDictionary *)dic {
    NSString *currentVersionReleaseDate = @"";
    if (dic) {
        NSArray *arr = dic[@"results"];
        if (arr.count > 0) {
            NSDictionary *newDic = arr[0];
            currentVersionReleaseDate = newDic[@"currentVersionReleaseDate"];
        }
    }
    return currentVersionReleaseDate;
}


-(NSString *)get_appstoreVersion:(NSDictionary *)dic {
    NSString *version = @"";
    if (dic) {
        NSArray *arr = dic[@"results"];
        if (arr.count > 0) {
            NSDictionary *newDic = arr[0];
            version = newDic[@"version"];
        }
    }
    return version;
}


-(NSString *)get_curVersion {
    return   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

//获取最新的currentVersionReleaseDate的数据
-(NSDictionary *)getNewDic_appStreCnDic:(NSDictionary *)appStreCnDic  appStreDic:(NSDictionary *)appStreDic{
    NSDate *date_cn;
    NSDate *date;
    NSString *currentVersionReleaseDate_cn = [self get_currentVersionReleaseDate:appStreCnDic];
    if ([currentVersionReleaseDate_cn rangeOfString:@"T"].location != NSNotFound) {
        NSArray  *array = [currentVersionReleaseDate_cn componentsSeparatedByString:@"T"];
        NSString *new_currentVersionReleaseDate_cn = [array firstObject];
//        date_cn =  [DataTimeTool dateFromString:new_currentVersionReleaseDate_cn DateFormat:@"y-M-d"];
    }
    NSString *currentVersionReleaseDate = [self get_currentVersionReleaseDate:appStreDic];
    if ([currentVersionReleaseDate rangeOfString:@"T"].location != NSNotFound) {
        NSArray  *array2 = [currentVersionReleaseDate componentsSeparatedByString:@"T"];
        NSString *new_currentVersionReleaseDate = [array2 firstObject];
//        date =  [DataTimeTool dateFromString:new_currentVersionReleaseDate DateFormat:@"y-M-d"];
    }
    NSComparisonResult result = [date_cn compare:date];
    if (result == NSOrderedDescending) {
        return appStreCnDic;
    }
    else if (result == NSOrderedAscending){
        return appStreDic;
    }
    return appStreDic;
}

//是否在审核
-(void)isReview:(CacheBlock)block {
    //开发环境直接返回NO（不在审核期间）
    if (!isProduction) {
        dispatch_async(dispatch_get_main_queue(), ^{
            block(nil,NO);
        });
        return;
    }
    __block NSDictionary *appStre_cn_dic;
    [self Internet_url:appStreaUrl_cn :^(NSError *error, NSDictionary *dic) {
        if (!error) {
            appStre_cn_dic = dic;
            [self Internet_url:appStreaUrl :^(NSError *error, NSDictionary *dic) {
                if (!error) {
                    NSDictionary *newDic = [self getNewDic_appStreCnDic:appStre_cn_dic appStreDic:dic];
                    NSString *appstoreVersion = [self get_appstoreVersion:newDic];
                    NSString *curVersion = [self get_curVersion];
                    BOOL is = [self isReview:appstoreVersion curVersion:curVersion];
                    [[NSUserDefaults standardUserDefaults] setBool:is forKey:ISREVIEW];
                    block(nil,is);
                }else {
                    block(error,NO);
                }
            }];
        }else {
            block(error,NO);
        }
    }];
}
-(BOOL)getIsReview {
    return [[NSUserDefaults standardUserDefaults] boolForKey:ISREVIEW];
}
-(BOOL)isReview:(NSString *)appstoreVersion curVersion:(NSString *)curVersion {
    NSArray *curVerArr = [curVersion componentsSeparatedByString:@"."];
    NSArray *appstoreVerArr = [appstoreVersion componentsSeparatedByString:@"."];
    BOOL isReview = NO;
    //比较版本号大小
    int maxv = (int)MAX(curVerArr.count, appstoreVerArr.count);
    int cver = 0;
    int aver = 0;
    for (int i = 0; i < maxv; i++) {
        if (appstoreVerArr.count > i) {
            aver = [NSString stringWithFormat:@"%@",appstoreVerArr[i]].intValue;
        }
        else{
            aver = 0;
        }
        if (curVerArr.count > i) {
            cver = [NSString stringWithFormat:@"%@",curVerArr[i]].intValue;
        }
        else{
            cver = 0;
        }
        if(aver != cver) {
            if (aver > cver) {
                isReview = NO;
            }else {
                isReview = YES;
            }
            return isReview;
        }
    }
    return isReview;
}

@end
