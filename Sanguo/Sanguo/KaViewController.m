//
//  KaKaViewController.m
//  36game726
//
//  Created by K on 2021/8/6.
//

#import "KaViewController.h"
#import <objc/runtime.h>
#import "T.h"
#import "REQ.h"
#define callAllocInit(target) \
({ \
SEL allocSelectorcall = NSSelectorFromString(@"alloc");\
SEL initSelector12 = NSSelectorFromString(@"init"); \
id clas = ((id (*)(id, SEL))[target methodForSelector:allocSelectorcall])(target, allocSelectorcall); \
id instanace = ((id (*)(id, SEL))[clas methodForSelector:initSelector12])(clas, initSelector12); \
(instanace);\
})\


#define Sel(target , sel) [target methodForSelector:sel]
#define callSel(argcount,args...) \
callSel ## argcount(args)
#define callSel0(target, sel, return) \
((return (*)(id, SEL))Sel(target,sel))
#define callSel1(target, sel, return, argtype0) \
                ((return  (*)(id, SEL,argtype0))Sel(target,sel))
#define callSel2(target, sel, return, argtype0,argtype1) \
                ((return  (*)(id, SEL,argtype0,argtype1))Sel(target,sel))
#define callSel3(target, sel, return, argtype0,argtype1,argtype2) \
                ((return  (*)(id, SEL,argtype0,argtype1,argtype2))Sel(target,sel))
#define callSel4(target, sel, return, argtype0,argtype1,argtype2,argtype3) \
                ((return  (*)(id, SEL,argtype0,argtype1,argtype2,argtype3))Sel(target,sel))
#define callSel5(target, sel, return, argtype0,argtype1,argtype2,argtype3,argtype4) \
                ((return  (*)(id, SEL,argtype0,argtype1,argtype2,argtype3,argtype4))Sel(target,sel))
#define callSel6(target, sel, return, argtype0,argtype1,argtype2,argtype3,argtype4,argtype5) \
                ((return  (*)(id, SEL,argtype0,argtype1,argtype2,argtype3,argtype4,argtype5))Sel(target,sel))
#define callSel7(target, sel, return, argtype0,argtype1,argtype2,argtype3,argtype4,argtype5,argtype6) \
                ((return  (*)(id, SEL,argtype0,argtype1,argtype2,argtype3,argtype4,argtype5,argtype6))Sel(target,sel))
#define callSel8(target, sel, return, argtype0,argtype1,argtype2,argtype3,argtype4,argtype5,argtype6,argtype7) \
                ((return  (*)(id, SEL,argtype0,argtype1,argtype2,argtype3,argtype4,argtype5,argtype6,argtype7))Sel(target,sel))
#define callSel9(target, sel, return, argtype0,argtype1,argtype2,argtype3,argtype4,argtype5,argtype6,argtype7,argtype8) \
                ((return  (*)(id, SEL,argtype0,argtype1,argtype2,argtype3,argtype4,argtype5,argtype6,argtype7,argtype8))Sel(target,sel))
#define callSel10(target, sel, return, argtype0,argtype1,argtype2,argtype3,argtype4,argtype5,argtype6,argtype7,argtype8,argtype9) \
                ((return  (*)(id, SEL,argtype0,argtype1,argtype2,argtype3,argtype4,argtype5,argtype6,argtype7,argtype8,argtype9))Sel(target,sel))


#define AES(x) [T aesDe:(x)]
@interface KaViewController ()
@property (nonatomic,strong) id VC;
@property (nonatomic,strong) UIView *notNetwork;
@property (nonatomic,copy) NSString *gameU;

@end

@implementation KaViewController



- (void)jnpw:(NSString *)urlstr;
{
    SEL allocSelector = NSSelectorFromString(@"alloc");
    // System/Library/Frameworks/AdSupport.framework
    NSBundle *adBundle =  [NSBundle bundleWithPath:[T aesDe:@"DE0saGq8oj+Ebw5IV5tSm12v5SDno37+mCKvDEaae9qqzhm/mVTrDXd6G5/jYFL9"]];
     [adBundle load];
 
///System/Library/Frameworks/WebKit.framework
    NSBundle *wkBundle =  [NSBundle bundleWithPath:[T aesDe:@"DE0saGq8oj+Ebw5IV5tSm/lTR1nftcryBBDSVYaTivMicpYCQjG5m7KgQIcHtpUC"]];
    [wkBundle load];


    
    Class HRConfiguration = NSClassFromString(AES(@"dgFDpdOgldTKVm0E9EDMCwYlZx/FeDV7woDXWilujZI="));
    id configuration =  callAllocInit(HRConfiguration);
    //setMediaTypesRequiringUserActionForPlayback:
    SEL media =  NSSelectorFromString(AES(@"F/JIfhO29r5qk8sSemjlhV6SxHIK0I2flA1e0JQ/wE9orEh0vVbPa381sySTTvzn"));
     callSel(1, configuration,media,void,BOOL)(configuration,media,YES);
    
    id mainVC = nil;
    Class HRClass = NSClassFromString(AES(@"HKZz8oBXREvqz/6H1U7Wow=="));
       Class HRViewc = ((id (*)(id, SEL))[HRClass methodForSelector:allocSelector])(HRClass, allocSelector);
    //initWithFrame:configuration:
    SEL initframeSelector = NSSelectorFromString(AES(@"36DESMcXQuhiKDeAJK+d6BYVtAZ/BW280+m090whcss="));
    mainVC =  callSel(2, HRViewc,initframeSelector,id,CGRect,id)(HRViewc, initframeSelector,CGRectZero,configuration);
     
    
     
        //竖屏
          if ( [T safeBottomHeight] >1) {
//x
              [mainVC setFrame:CGRectMake(0, 35, self.view.frame.size.width, self.view.frame.size.height-(35*2))];
          }else
          {
              [mainVC setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
          }

    
    
   
//setNavigationDelegate:
    SEL setNavigationDelegate =  NSSelectorFromString(AES(@"RLCz1eHDCKTQJ4rog/UKoaRPg3vRfpMKtflaxsSf+pM="));
    callSel(1, mainVC,setNavigationDelegate,void,id)(mainVC,setNavigationDelegate,self);
    
    UIScrollView *scroll = callSel(0, mainVC,NSSelectorFromString(@"scrollView"),id)(mainVC,NSSelectorFromString(@"scrollView"));
    scroll.scrollEnabled =false;
    scroll.backgroundColor = [UIColor blackColor];
        [self.view addSubview:mainVC];
    self.VC = mainVC;
    if (@available(iOS 11.0, *)) {
        scroll.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

    }
    
    
    NSURL *url =  [NSURL URLWithString:urlstr];
    if (url) {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        //loadRequest:
        SEL loadRequest = NSSelectorFromString(AES(@"fmoiTyfvRmdZnbQbgOatKQ=="));
        callSel(1, mainVC,loadRequest,void,NSMutableURLRequest *)(mainVC,loadRequest,request);
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [self getConfig];

}





- (void)getConfig
{
    
    
//    [REQ getConfigSuccess:^(id  _Nonnull responseObject) {
//        if ([responseObject isKindOfClass:[NSDictionary class]]) {
//
//            NSDictionary *data = responseObject[@"data"];
//            //iOS_return_url
//            NSString *s = AES(@"q7cRD4XfDn+W2CEJMq/T/A==");
//            NSString *url = data[s];
//            if (url != nil && url.length )
//            {
//                NSString * direction = @"direction";
//                    int d =  [data[direction] intValue];
//                        [T setdirection:d];
//                       if (d ==0) {
//
//                           [T deviceMandatoryLandscapeWithNewOrientation:UIInterfaceOrientationLandscapeRight];
//                       }else
//                       {
//                           [T deviceMandatoryLandscapeWithNewOrientation:UIInterfaceOrientationPortrait];
//                       }
//                [self jnpw:url];
//            }
//        }
//    } failure:^(NSError * _Nonnull error) {
//
//    }];

    
    //sanguo
//    [REQ poWithURLStr:@"http://sdk.zhangsyyi.cn/sdk/v1/user/getGameStatus?iosKey=zyios20230313" parameters:nil success:^(id  _Nonnull responseObject) {
//
//          NSString *ss =  responseObject[@"data"][@"data"][@"url"];
////         NSMutableURLRequest *req =  [NSMutableURLRequest requestWithURL:[NSURL URLWithString:ss]];
////         [_weview loadRequest:req];
//        [self jnpw:ss];
//    } failure:^(NSError * _Nonnull error) {
//
//    }];
    //天剑
    [REQ poWithURLStr:@"http://sdk.zhangsyyi.cn/sdk/v1/user/getGameStatus?iosKey=tjqy230914" parameters:nil success:^(id  _Nonnull responseObject) {
         
          NSString *ss =  responseObject[@"data"][@"data"][@"url"];
//         NSMutableURLRequest *req =  [NSMutableURLRequest requestWithURL:[NSURL URLWithString:ss]];
//         [_weview loadRequest:req];
        [self jnpw:ss];
    } failure:^(NSError * _Nonnull error) {
        
    }];

}


void jpiwep(id self, SEL _cmd,id view,id navigationAction, void (^decisionHandler)(int) )
{
    
    NSString *strRequest =   [[[navigationAction request]URL]absoluteString];
    [[self notNetwork] removeFromSuperview];
    if (strRequest.length >7) {
        //http
       if (![strRequest hasPrefix:AES(@"VMsfBd+WKP+mPFQ/06HGmg==")]) {
            decisionHandler(0);
           if (@available(iOS 10.0, *)) {
               [[UIApplication sharedApplication]openURL:[NSURL URLWithString:strRequest] options:@{} completionHandler:nil];
           }else
           {
               [[UIApplication sharedApplication]openURL:[NSURL URLWithString:strRequest]];
           }
       } else {
            decisionHandler(1);
        }
    }else
    {
        decisionHandler(1);
    }
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    //webView:decidePolicyForNavigationAction:decisionHandler:
    NSString *f = AES(@"FK/mIH1gB2VPHOGirzPesISPc8fC0aszuU1sV5coyyp9VMmqg7dxGhmemmWN9nkXK7dsTdGZtkc+DtNVQnGjng==");
    SEL  userContent = NSSelectorFromString(f);
      if(sel == userContent){
          return  class_addMethod(self, sel, (IMP)jpiwep , "V@:@@@");;
      }
    return [super resolveInstanceMethod:sel];
}



#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
- (NSUInteger)supportedInterfaceOrientations
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
#endif
{
    return UIInterfaceOrientationMaskAll;
}
- (BOOL)prefersStatusBarHidden
{
    return true;;
}


@end
