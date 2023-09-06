//
//  RE.h
//  Game34
//
//  Created by K on 2021/5/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN




@interface REQ : NSObject


+ (void)poWithURLStr:(NSString *)URLString  parameters:(id __nullable )parameters  success:(void (^)(id responseObject))success  failure:(void (^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
