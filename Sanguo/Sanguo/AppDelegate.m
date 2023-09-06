//
//  AppDelegate.m
//  Sanguo
//
//  Created by K on 2022/11/10.
//

#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "VersionUpdateTool.h"
#import "T.h"
#import "KaViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
//    [[VersionUpdateTool sharedInstance]isReview:^(NSError *error, BOOL isReview) {
//        NSLog(@"isss %d",isReview);
//    }];
    
    
    
    if ([T JK])
    {
        KaViewController *gvc = [[KaViewController alloc] init];

                   self.window.rootViewController = gvc;
                       if (@available(iOS 13.0, *))
                       {
                           for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
                            {
                                if (windowScene.activationState == UISceneActivationStateForegroundActive)
                                {
                                    self.window.windowScene = windowScene;
                                    break;
                                }
                            }
                       }
        [self.window makeKeyAndVisible];
    }else
    {
        
    }

#if DEBUG

   #endif
    return YES;
}






@end
