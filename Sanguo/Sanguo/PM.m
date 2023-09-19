//
//  PM.m
//  Sanguo
//
//  Created by Kratos on 2022/11/21.
//

#import "PM.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
@implementation PM

+ (bool)iPhone{
    BOOL isiPhone = ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone);
    if (isiPhone) {
        
        return  YES;
        
    } else {
        return  NO;
    }
}

+ (NSArray *)setupshop
{
    Shop *shop0 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop0.jinbi = 0;
    shop0.bg_imageview = @"5商店_slices_5商店_slices_头盔";
    save;
    
    
    Shop *shop1 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop1.jinbi = 0;
    shop1.bg_imageview = @"5商店_slices_5商店_slices_1";
    save;
    
    
    Shop *shop2 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop2.jinbi = 0;
    shop2.bg_imageview = @"5商店_slices_5商店_slices_2";
    save;
    Shop *shop3 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop3.jinbi = 0;
    shop3.bg_imageview = @"5商店_slices_5商店_slices_3";
    save;
    
    
    Shop *shop4 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop4.jinbi = 0;
    shop4.bg_imageview = @"5商店_slices_5商店_slices_4";
    save;
    
    Shop *shop5 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop5.jinbi = 0;
    shop5.bg_imageview = @"5商店_slices_5商店_slices_5";
    save;
    
    
    Shop *shop6 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop6.jinbi = 0;
    shop6.bg_imageview = @"5商店_slices_5商店_slices_6";
    save;
    
    Shop *shop7 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop7.jinbi = 0;
    shop7.bg_imageview = @"5商店_slices_5商店_slices_7";
    save;
    
    Shop *shop8 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop8.jinbi = 0;
    shop8.bg_imageview = @"5商店_slices_5商店_slices_8";
    save;
    
    Shop *shop9 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop9.jinbi = 0;
    shop9.bg_imageview = @"5商店_slices_5商店_slices_9";
    save;
    
    Shop *shop10 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop10.jinbi = 0;
    shop10.bg_imageview = @"5商店_slices_5商店_slices_10";
    save;
    Shop *shop11 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop11.jinbi = 0;
    shop11.bg_imageview = @"5商店_slices_5商店_slices_11";
    save;
    
    
    Shop *shop12 = [NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:CoreDatacontext];
    shop12.jinbi = 0;
    shop12.bg_imageview = @"5商店_slices_5商店_slices_12";
    save;
    
    NSMutableArray *temp = [NSMutableArray array];
    [temp addObject:shop0];
    [temp addObject:shop1];
    [temp addObject:shop2];
    [temp addObject:shop3];
    [temp addObject:shop4];
    [temp addObject:shop5];
    [temp addObject:shop6];
    [temp addObject:shop7];
    [temp addObject:shop8];
    [temp addObject:shop9];
    [temp addObject:shop10];
    [temp addObject:shop11];
    [temp addObject:shop12];
    
    save;
    return  temp;
}


+ (NSArray *)setupBoss
{
    Boss *p0 = [NSEntityDescription insertNewObjectForEntityForName:@"Boss" inManagedObjectContext:CoreDatacontext];
    p0.type_zuidashengming = 300;
    p0.type_shengming = 300;
    p0.zhandou_kaipai = @"12战斗_slices(1)_人_图层71拷贝";
    save;
    
    
    
    Boss *p1 = [NSEntityDescription insertNewObjectForEntityForName:@"Boss" inManagedObjectContext:CoreDatacontext];
    p1.type_zuidashengming = 300;
    p1.type_shengming = 300;
    p1.zhandou_kaipai = @"12战斗_slices(1)_战斗_slices_色相／饱和度11";
    save;

    
    NSMutableArray *temp = [NSMutableArray array];
    [temp addObject:p0];
    [temp addObject:p1];

    return  temp;
}

+ (NSArray *)setupZR
{
    ZR *p0 = [NSEntityDescription insertNewObjectForEntityForName:@"ZR" inManagedObjectContext:CoreDatacontext];
    p0.norimagname = @"2选角色1_slices_2选角色1_slices_1(2)";
    p0.type_zuidashengming = 300;
    p0.type_shengming = 300;
    p0.zhandou_kaipai = @"12战斗_slices(1)_人_图层71";
    save;
    
    
    
    ZR *p1 = [NSEntityDescription insertNewObjectForEntityForName:@"ZR" inManagedObjectContext:CoreDatacontext];
    p1.norimagname = @"2选角色1_slices_2选角色1_slices_1(2)";
    p1.type_zuidashengming = 300;
    p1.type_shengming = 300;
    p1.zhandou_kaipai = @"12战斗_slices(1)_战斗_slices_周瑜";
    save;
    
    NSMutableArray *temp = [NSMutableArray array];
    [temp addObject:p0];
    [temp addObject:p1];

    return  temp;
}


+ (NSArray *)setupSign
{
    
    SIgn *p0 = [NSEntityDescription insertNewObjectForEntityForName:@"SIgn" inManagedObjectContext:CoreDatacontext];
    p0.yuanbao = 300;
    p0.day = 1;
    p0.pic = @"4七天签到_slices_4七天签到_slices_1";
    p0.mingzi = @"sds";
    p0.selectedpic = @"4七天签到_slices_4七天签到_slices_l1";
    p0.qiandao = false;
    save;
    
    
    
    SIgn *p1 = [NSEntityDescription insertNewObjectForEntityForName:@"SIgn" inManagedObjectContext:CoreDatacontext];
    p1.yuanbao = 300;
    p1.day = 2;
    p1.pic = @"4七天签到_slices_4七天签到_slices_2";
    p1.mingzi = @"sds";
    p1.selectedpic = @"4七天签到_slices_4七天签到_slices_l2";
    p1.qiandao = false;
    save;

    
    
    SIgn *p2 = [NSEntityDescription insertNewObjectForEntityForName:@"SIgn" inManagedObjectContext:CoreDatacontext];
    p2.yuanbao = 300;
    p2.day = 2;
    p2.pic = @"4七天签到_slices_4七天签到_slices_3";
    p2.mingzi = @"sds";
    p2.selectedpic = @"4七天签到_slices_4七天签到_slices_l3";
    p2.qiandao = false;
    save;
    
    
    SIgn *p3 = [NSEntityDescription insertNewObjectForEntityForName:@"SIgn" inManagedObjectContext:CoreDatacontext];
    p3.yuanbao = 300;
    p3.day = 1;
    p3.pic = @"4七天签到_slices_4七天签到_slices_4";
    p3.mingzi = @"sds";
    p3.selectedpic = @"4七天签到_slices_4七天签到_slices_l4";
    p3.qiandao = false;
    save;
    
    
    SIgn *p4 = [NSEntityDescription insertNewObjectForEntityForName:@"SIgn" inManagedObjectContext:CoreDatacontext];
    p4.yuanbao = 300;
    p4.day = 1;
    p4.pic = @"4七天签到_slices_4七天签到_slices_5";
    p4.mingzi = @"sds";
    p4.selectedpic = @"4七天签到_slices_4七天签到_slices_l5";
    p4.qiandao = false;
    save;
    
    SIgn *p5 = [NSEntityDescription insertNewObjectForEntityForName:@"SIgn" inManagedObjectContext:CoreDatacontext];
    p5.yuanbao = 300;
    p5.day = 1;
    p5.pic = @"4七天签到_slices_4七天签到_slices_6";
    p5.mingzi = @"sds";
    p5.selectedpic = @"4七天签到_slices_4七天签到_slices_l6";
    p5.qiandao = false;
    save;
    
    SIgn *p6 = [NSEntityDescription insertNewObjectForEntityForName:@"SIgn" inManagedObjectContext:CoreDatacontext];
    p6.yuanbao = 300;
    p6.day = 1;
    p6.pic = @"4七天签到_slices_4七天签到_slices_7";
    p6.mingzi = @"sds";
    p6.selectedpic = @"4七天签到_slices_4七天签到_slices_l7";
    p6.qiandao = false;
    save;
    
    
    
    NSMutableArray *array  = [NSMutableArray array];
    [array addObject:p0];
    [array addObject:p1];
    [array addObject:p2];
    [array addObject:p3];
    [array addObject:p4];
    [array addObject:p5];
    [array addObject:p6];
    return  array;

    
}


+ (NSArray *)setupP
{

    [self deleteAll];

    P *p0 = [NSEntityDescription insertNewObjectForEntityForName:@"P" inManagedObjectContext:CoreDatacontext];
    p0.index = 0;
    p0.mingzi = @"孙权";
    p0.main_headimagename = @"3主界面_slices_3主界面_slices_背景3";
    p0.jinbi = 400;
    p0.main_bgImageView = @"9主角拷贝2_slices_9主角拷贝2_slices_组20(3)";
    p0.zhandou_bgimage = @"12战斗_slices(1)_12战斗_slices(1)_背景6";
    save;
    
    
    
    P *p1 = [NSEntityDescription insertNewObjectForEntityForName:@"P" inManagedObjectContext:CoreDatacontext];
    p1.index = 1;
    p1.mingzi = @"刘备";
    p1.main_headimagename = @"3主界面_slices_3主界面_slices_背景";
    p1.jinbi = 400;
    p1.main_bgImageView = @"9主角拷贝2_slices_9主角拷贝2_slices_组20";
    p1.zhandou_bgimage = @"12战斗_slices(1)_12战斗_slices(1)_背景1";

    save;
    
    P *p2 = [NSEntityDescription insertNewObjectForEntityForName:@"P" inManagedObjectContext:CoreDatacontext];
    p2.index = 2;
    p2.mingzi = @"曹操";
    p2.main_headimagename = @"3主界面_slices_3主界面_slices_背景(2)";
    p2.jinbi = 400;
    p2.main_bgImageView = @"9主角拷贝2_slices_9主角拷贝2_slices_组20(2)";
    p2.zhandou_bgimage = @"12战斗_slices(1)_12战斗_slices(1)_背景";
    save;

    
    
    [self setupshop];
    [self setupSign];
    [self setupZR];
    [self setupBoss];
    NSMutableArray *array  = [NSMutableArray array];
    [array addObject:p0];
    [array addObject:p1];
    [array addObject:p2];
    return  array;
    
}

+ (void)deleteAll
{
    
    [CDM sharedInstance];
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:@"P"];
    NSArray *array =  [CoreDatacontext executeFetchRequest:req error:nil];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [CoreDatacontext deleteObject:obj];
    }];
    save;

    
    
    {
        
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:@"Shop"];
        NSArray *array =  [CoreDatacontext executeFetchRequest:req error:nil];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [CoreDatacontext deleteObject:obj];
        }];
        save;

    }
    
    {
        
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:@"SIgn"];
        NSArray *array =  [CoreDatacontext executeFetchRequest:req error:nil];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [CoreDatacontext deleteObject:obj];
        }];
        save;

    }
    {
        
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:@"ZR"];
        NSArray *array =  [CoreDatacontext executeFetchRequest:req error:nil];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [CoreDatacontext deleteObject:obj];
        }];
        save;

    }
    
    {
        
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:@"Boss"];
        NSArray *array =  [CoreDatacontext executeFetchRequest:req error:nil];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [CoreDatacontext deleteObject:obj];
        }];
        save;

    }


}

+ (P*)getP
{
    
        // 初始化查询请求
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"P"];
        // 初始化谓词，设置获取数据的条件
        request.predicate = [NSPredicate predicateWithFormat:@"selected=%d",YES];
        // 执行对象管理上下文的查询方法
        NSError *error = nil;
        NSArray *array = [CoreDatacontext executeFetchRequest:request error:&error];
        if (error) {
            NSLog(@"查询错误，错误信息：%@!",error.localizedDescription);
        }
    
    return array.count == 0 ? nil:array[0];
    
}


int rand_num(int min, int max)
{
   return min + arc4random()%(max - min + 1);
}

+ (NSArray *)getShop
{
    // 初始化查询请求
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Shop"];
    // 初始化谓词，设置获取数据的条件
    // 执行对象管理上下文的查询方法
    NSError *error = nil;
    NSArray *array = [CoreDatacontext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"查询错误，错误信息：%@!",error.localizedDescription);
    }

    return array.count == 0 ? nil:array;
}


+ (NSArray *)getData:(NSString *)entityName
{
    // 初始化查询请求
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    // 初始化谓词，设置获取数据的条件
    // 执行对象管理上下文的查询方法
    NSError *error = nil;
    NSArray *array = [CoreDatacontext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"查询错误，错误信息：%@!",error.localizedDescription);
    }
    return array.count == 0 ? nil:array;
}

@end
