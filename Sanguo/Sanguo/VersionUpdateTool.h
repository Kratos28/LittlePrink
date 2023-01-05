//
//  VersionUpdateTool.h
//  Sanguo
//
//  Created by Kratos on 2022/11/29.
//

#import <Foundation/Foundation.h>
typedef void(^CacheBlock)(NSError *error, BOOL isReview);
typedef void(^CacheBlockData)(NSError *error, NSDictionary *dic);

NS_ASSUME_NONNULL_BEGIN
//如果为开发状态,设置为 NO; 如果为生产状态,应改为 YES.
#ifdef DEBUG
static BOOL isProduction = YES;
#else
static BOOL isProduction = YES;
#endif

#define APPSTOREID @"6444837323"
@interface VersionUpdateTool : NSObject
+(VersionUpdateTool *)sharedInstance;
-(void)VersionUpdate;
-(void)isReview:(CacheBlock)block;
-(BOOL)getIsReview;
@end
NS_ASSUME_NONNULL_END
