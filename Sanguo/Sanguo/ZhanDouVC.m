//
//  ZhanDouVC.m
//  Sanguo
//
//  Created by Kratos on 2022/11/24.
//

#import "ZhanDouVC.h"
#import "PM.h"
#import "BGBGVIew.h"
@interface ZhanDouVC ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageV;
@property (strong, nonatomic)  BGBGVIew *wofang;
@property (strong, nonatomic)  BGBGVIew *difang;
@property (weak, nonatomic) IBOutlet UIButton *taopao;

@end

@implementation ZhanDouVC
- (IBAction)taopaoclick:(id)sender {
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:@"确定逃跑?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [vc addAction:ac1];
    
    UIAlertAction *ac2 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.presentingViewController dismissViewControllerAnimated:false completion:nil];
    }];
    [vc addAction:ac2];

    [self presentViewController:vc animated:false completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    P *p =  [PM getP];
    self.bgImageV.image = [UIImage imageNamed:p.zhandou_bgimage];
    

    NSMutableArray<ZR *> *array =  [PM getData:@"ZR"];
    BGBGVIew *wofang = [[BGBGVIew alloc]initWithZR:array withwofang:true];
    [self.view addSubview:wofang];
    self.wofang = wofang;
    
    
    
    ZR *p0 =  [NSEntityDescription insertNewObjectForEntityForName:@"ZR" inManagedObjectContext:CoreDatacontext];
    p0.norimagname = @"2选角色1_slices_2选角色1_slices_1(2)";
    p0.type_zuidashengming = 300;
    p0.type_shengming = 300;
    p0.zhandou_kaipai = @"12战斗_slices(1)_人_图层71";
    
    
    
    ZR *p1 = [NSEntityDescription insertNewObjectForEntityForName:@"ZR" inManagedObjectContext:CoreDatacontext];
    p1.norimagname = @"2选角色1_slices_2选角色1_slices_1(2)";
    p1.type_zuidashengming = 300;
    p1.type_shengming = 300;
    p1.zhandou_kaipai = @"12战斗_slices(1)_战斗_slices_周瑜";
    NSMutableArray *diren = [NSMutableArray array];
    [diren addObject:p0];
    [diren addObject:p1];
    

    BGBGVIew *difang = [[BGBGVIew alloc]initWithZR:diren withwofang:false];
    [self.view addSubview:difang];
    self.difang = difang;
    
    [self.taopao mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(329));
        make.height.equalTo(nW(251));
        make.trailing.equalTo(nW(0));
        make.top.equalTo(self.view.mas_top).offset(20);
    }];
    
    __weak typeof(self) weakself = self;
//
    [[NSNotificationCenter defaultCenter]addObserverForName:@"qianjinWillwangcheng" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {

        BGBGVIew * cBGBGView  =note.userInfo[@"CBGBGView"];
        BGView * cBGView = note.userInfo[@"CBGView"];
        BGView * CView = note.userInfo[@"CView"];
        [weakself.difang randkouxue:^{
            [weakself.wofang qianjinDown:CView withqianjing:^{




            } withwangcheng:^{

                if (weakself.difang.bgview.subviews.count == 0){
                    return;;
                }

                int f =  rand_num(0, weakself.difang.bgview.subviews.count - 1);
                UIView *vv =  weakself.difang.bgview.subviews[f];
                [weakself.difang qianjinDown:vv withqianjing:^{

                                } withwangcheng:^{
                                    [weakself.wofang randkouxue:^{
                                        [weakself.difang qianjintop:vv withqianjing:^{

                                                                                } withwangcheng:^{
                                                                                    weakself.wofang.flag = YES;

                                                                                }];
                                    }];
                                }];


            }];


        }];



    }];
//
//

    [[NSNotificationCenter defaultCenter]addObserverForName:@"kUpdateRemoveSubview" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        if (weakself.difang.bgview.subviews.count==0) {
            NSLog(@"敌方全部死亡");


            UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"胜利" message:@"获得300元包" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {


                [weakself.presentingViewController.presentingViewController dismissViewControllerAnimated:false completion:nil];

            }];
            [vc addAction:ac1];
            [weakself presentViewController:vc animated:false completion:^{
                P *p =  [PM getP];
                p.jinbi = p.jinbi + 300;
                save;

                [[NSNotificationCenter  defaultCenter]postNotificationName:@"jinbiupdate" object:nil userInfo:nil];
            }];



        } else if (weakself.wofang.bgview.subviews.count==0)
        {

            UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"失败" message:@"请重新再挑战" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {


                [weakself.presentingViewController.presentingViewController dismissViewControllerAnimated:false completion:nil];

            }];
            [vc addAction:ac1];
            [weakself presentViewController:vc animated:false completion:^{


                [[NSNotificationCenter  defaultCenter]postNotificationName:@"jinbiupdate" object:nil userInfo:nil];
            }];
        }



    }];
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.wofang mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(800));
        make.height.equalTo(nH(1800));
        make.left.equalTo(nW(200));
        make.top.equalTo(nH(300));
    }];
    
    [self.difang mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(800));
        make.height.equalTo(nH(1800));
        make.trailing.equalTo(nW(-200));
        make.top.equalTo(nH(300));
    }];

}





@end
