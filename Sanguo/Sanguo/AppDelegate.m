//
//  AppDelegate.m
//  Sanguo
//
//  Created by K on 2022/11/10.
//

#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "VersionUpdateTool.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
//    [[VersionUpdateTool sharedInstance]isReview:^(NSError *error, BOOL isReview) {
//        NSLog(@"isss %d",isReview);
//    }];
    
    
    
#if DEBUG

   #endif
    return YES;
}






@end
