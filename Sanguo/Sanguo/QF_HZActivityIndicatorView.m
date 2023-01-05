//
//  HZActivityIndicatorView.m
//  QYSDK
//
//  Created by K on 2019/4/8.
//  Copyright © 2019 QYSDK. All rights reserved.
//

#import "QF_HZActivityIndicatorView.h"
#define ChaosWindowH 20
#define ChaosScreenW [UIScreen mainScreen].bounds.size.width

#define windowW  40
#define windowH  windowW
@implementation QF_HZActivityIndicatorView
static NSTimer *timer_;
static UIWindow *window_;
static  UIButton *button_;
static UIActivityIndicatorView *loadingView_;

+ (void)QF_showLoading:(NSString *)str inView:(UIView *)view
{
    [timer_ invalidate];
    timer_ = nil;
    
    if (button_ != nil) {
        return;
    }
    
    UIButton *button = [[UIButton alloc] init];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    button.frame = view.bounds;
    button.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    [button setTitle:str forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [view addSubview:button];
    
    
    button_ = button;
    CGFloat titleWidth = [str sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}].width;
    CGFloat x = (ChaosScreenW - 2 * titleWidth) * 0.5;
    CGFloat y = view.frame.size.height * 0.5;
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    [button addSubview:loadingView];
    loadingView_ = loadingView;
    loadingView.center = CGPointMake(x, y);
    
}
+ (void)test
{
    
}



+ (void)showWindow
{
    
        [timer_ invalidate];
        
        UIWindow *window = [[UIWindow alloc] init];
        window.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        window.windowLevel = UIWindowLevelStatusBar;
        window.hidden = NO;
        window_ = window;
        
        
        window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        
        window_.rootViewController =[UIViewController new];
        if (@available(iOS 13.0,*)) {
            for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
             {
                 if (windowScene.activationState == UISceneActivationStateForegroundActive)
                 {
                     window_.windowScene = windowScene;
                     break;
                 }
             }
        }

  
    

}
+ (void)QF_showMessage:(NSString *)str withImage:(UIImage *)image
{
    
    [self showWindow];
    UIButton *button = [[UIButton alloc] init];
    button.frame = window_.bounds;
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:str forState:UIControlStateNormal];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [window_ addSubview:button];
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+ (void)showMessage:(NSString *)str
{
    [self QF_showMessage:str withImage:nil];
}

+ (void)QF_showSuccess:(NSString *)str
{
    [self QF_showMessage:str withImage:[UIImage imageNamed:@"success"]];
}

+ (void)QF_showError:(NSString *)str
{
    [self QF_showMessage:str withImage:[UIImage imageNamed:@"error"]];
}

+ (void)showLoading:(NSString *)str
{
    dispatch_async(dispatch_get_main_queue(), ^{

    [timer_ invalidate];
    timer_ = nil;
    [self showWindow];
    UIButton *button = [[UIButton alloc] init];
    button.frame = window_.bounds;
    [button setTitle:str forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [window_ addSubview:button];
    CGFloat titleWidth = [str sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}].width;
    CGFloat x = (ChaosScreenW - 2 * titleWidth) * 0.5;
    CGFloat y = window_.frame.size.height * 0.5;
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    [window_ addSubview:loadingView];
    loadingView.center = CGPointMake(x, y);
    });

}

+ (void)hide
{
    [UIView animateWithDuration:0.0 animations:^{
        
    } completion:^(BOOL finished) {
        
        timer_ = nil;
        window_ = nil;
        [button_ removeFromSuperview];
        button_ = nil;
        [loadingView_ removeFromSuperview];
        loadingView_ = nil;
    }];
}

@end
