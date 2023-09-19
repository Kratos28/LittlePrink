//
//  ChongZhiVC.m
//  Sanguo
//
//  Created by Kratos on 2022/11/30.
//

#import "ChongZhiVC.h"
#import "PM.h"
#import "Masonry/Masonry.h"
#import "QF_HZActivityIndicatorView.h"
#import "YQInAppPurchaseTool.h"
NSString * JavascriptBridge_js() {
#define __wvjb_js_func__(x) #x
    
    
    static NSString * preprocessorJSCode = @__wvjb_js_func__(({
        "product": [
            {
               "pic" :"充值_18_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l1",
               "coin": 6,
               "goods":60,
                "id":"com.sgjj.6"
            },
            {
               "pic" :"充值_17_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l2",
               "coin": 30,
               "goods":300,
                "id":"com.sgjj.30"
            },
            {
               "pic" :"充值_12_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l3",
               "coin": 68,
               "goods":680,
                "id":"com.sgjj.68"
            },
            {
               "pic" :"充值_15_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l4",
               "coin": 128,
               "goods":1280,
                "id":"com.sgjj.128"
            },
            {
               "pic" :"充值_13_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l5",
               "coin": 198,
               "goods":1980,
                "id":"com.sgjj.198"
            },
            {
               "pic" :"充值_14_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l6",
               "coin": 328,
               "goods":3280,
                "id":"com.sgjj.328"
            },
            {
               "pic" :"充值_16_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l6",
               "coin": 648,
               "goods":6480,
                "id":"com.sgjj.648"
            }
        ]

    }));
    
    #undef __wvjb_js_func__
    
    preprocessorJSCode =  [preprocessorJSCode stringByReplacingOccurrencesOfString:@"(" withString:@""];
    preprocessorJSCode =  [preprocessorJSCode stringByReplacingOccurrencesOfString:@")" withString:@""];
    return preprocessorJSCode;
};



@interface ChongZhiVC ()<YQInAppPurchaseToolDelegate>
@property (nonatomic,strong)NSMutableArray * data;
@property (nonatomic,strong) NSMutableArray *productArray;

@end

@implementation ChongZhiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int corlmax = 3;
    int itemW = W(410);
    int itemH = H(400);
    int startX = W(380);
    int startY = H(650);
    NSDictionary *dict =  nil;
    NSArray *pro = dict[@"product"];
    
    NSArray<Shop *> *array = [PM getData:@"Shop"];
    self.productArray = [NSMutableArray array];
    CGFloat margin = W(40);
    self.data = [NSMutableArray array];
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"充值_11_"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gobackClick) forControlEvents:64];
    [self.view addSubview:btn];
    [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW((160)));
        make.height.equalTo(nH((170)));
        make.trailing.equalTo(nW(-200));
        make.top.equalTo(nW(300));

    }];
    
    NSDictionary *d = [self dictionaryWithJsonString:JavascriptBridge_js()];
    
    
    NSArray * te  = d[@"product"];
    
    for (int i = 0; i < te.count; i++) {
        int row=i/corlmax;//所在行
        int col=i%corlmax;//所在列
        //创建按钮
        UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *bb = te[i][@"pic"];
        NSString *fff = te[i][@"id"];

        [self.data addObject:te[i]];
        [self.productArray addObject:fff];
        btn.tag = i;
        [btn setBackgroundImage:[UIImage imageNamed:bb] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cccc:) forControlEvents:64];
        CGFloat x= startX + ((itemW+margin)*col);
        CGFloat y = startY + ((itemH+margin)*row);
        btn.frame=CGRectMake(x, y, itemW,  itemH);
        [self.view addSubview:btn];
    }
    
    YQInAppPurchaseTool *IAPTool = [YQInAppPurchaseTool defaultTool];
    
    //设置代理
    IAPTool.delegate = self;
    
    [QF_HZActivityIndicatorView showLoading:@"请在查询商品，请稍后"];
    [IAPTool requestProductsWithProductArray:self.productArray];
    
}

//支付成功了，并开始向苹果服务器进行验证（若CheckAfterPay为NO，则不会经过此步骤）
-(void)IAPToolBeginCheckingdWithProductID:(NSString *)productID {
    
    for (int i =0; i<self.data.count; i++) {
         NSDictionary *Dd =  self.data[i];
        if ([productID isEqualToString:Dd[@"id"]]) {
                
            
            UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:@"购买成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
                
                P *p =  [PM getP];
                
                p.jinbi  = [Dd[@"goods"] intValue] + p.jinbi;
                save;
                [[NSNotificationCenter defaultCenter]postNotificationName:@"jinbiupdate" object:nil];
            }];
            [vc addAction:ac1];
            [self presentViewController:vc animated:false completion:nil];
            
            break;;
            
        }
    }
    [QF_HZActivityIndicatorView hide];

}

//IAP工具已获得可购买的商品
-(void)IAPToolGotProducts:(NSMutableArray *)products {
    NSLog(@"GotProducts:%@",products);
    [QF_HZActivityIndicatorView hide];
//    self.productArray = products;
    
    
}

//支付失败/取消
-(void)IAPToolCanceldWithProductID:(NSString *)productID {
    NSLog(@"canceld:%@",productID);
    [QF_HZActivityIndicatorView hide];

}
//支付成


- (void)cccc:(UIButton *)sender
{
    [QF_HZActivityIndicatorView showLoading:@"正在拉起，请稍后"];
    NSDictionary * dd =  self.data[sender.tag];
    [[YQInAppPurchaseTool defaultTool]buyProduct:dd[@"id"]];
}

//商品被重复验证了
-(void)IAPToolCheckRedundantWithProductID:(NSString *)productID {
    NSLog(@"CheckRedundant:%@",productID);
    [QF_HZActivityIndicatorView hide];

}
//商品完全购买成功且验证成功了。（若CheckAfterPay为NO，则会在购买成功后直接触发此方法）
-(void)IAPToolBoughtProductSuccessedWithProductID:(NSString *)productID
                                            andInfo:(NSDictionary *)infoDic {
    NSLog(@"BoughtSuccessed:%@",productID);
    NSLog(@"successedInfo:%@",infoDic);
    [QF_HZActivityIndicatorView hide];

}
//商品购买成功了，但向苹果服务器验证失败了
//2种可能：
//1，设备越狱了，使用了插件，在虚假购买。
//2，验证的时候网络突然中断了。（一般极少出现，因为购买的时候是需要网络的）
-(void)IAPToolCheckFailedWithProductID:(NSString *)productID
                                 andInfo:(NSData *)infoData {
    NSLog(@"CheckFailed:%@",productID);
    [QF_HZActivityIndicatorView hide];

}
//恢复了已购买的商品（仅限永久有效商品）
-(void)IAPToolRestoredProductID:(NSString *)productID {
    NSLog(@"Restored:%@",productID);
    [QF_HZActivityIndicatorView hide];

}
//内购系统错误了
-(void)IAPToolSysWrong {
    NSLog(@"SysWrong");
    [QF_HZActivityIndicatorView hide];

}


- (void)gobackClick{
    [self dismissViewControllerAnimated:false completion:nil];
}
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}







@end

