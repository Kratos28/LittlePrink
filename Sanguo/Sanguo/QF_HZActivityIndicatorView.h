//
//  HZActivityIndicatorView.h
//  QYSDK
//
//  Created by K on 2019/4/8.
//  Copyright © 2019 QYSDK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QF_HZActivityIndicatorView : NSObject


+ (void)QF_showSuccess:(NSString *)str;

+ (void)QF_showError:(NSString *)str;

+ (void)showLoading:(NSString *)str;

+ (void)hide;

+ (void)showMessage:(NSString *)str;

+ (void)QF_showMessage:(NSString * __nullable )str withImage:(UIImage * __nullable)image;



+ (void)QF_showLoading:(NSString *)str inView:(UIView *)view;


@end

NS_ASSUME_NONNULL_END
