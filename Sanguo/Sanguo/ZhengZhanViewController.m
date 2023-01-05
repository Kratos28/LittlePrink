//
//  ZhengZhanViewController.m
//  Sanguo
//
//  Created by Kratos on 2022/11/23.
//

#import "ZhengZhanViewController.h"
#import "PM.h"
@interface ZhengZhanViewController ()
@property (weak, nonatomic) IBOutlet UIButton *jiantou;
@property (weak, nonatomic) IBOutlet UIImageView *guanghuan;

@end

@implementation ZhengZhanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *bagk= [UIButton buttonWithType:UIButtonTypeCustom];
    [bagk setBackgroundImage:[UIImage imageNamed:@"7任务_slices_7任务_slices_取消拷贝"] forState:0];
    [bagk addTarget:self action:@selector(disss) forControlEvents:64];

    [self.view addSubview:bagk];


    [bagk mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW((160)));
        make.height.equalTo(nH((170)));
        make.trailing.equalTo(nW(-150));
        make.top.equalTo(nW(200));
    }];
    [self.jiantou mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(183));
        make.height.equalTo(nH(152));
        make.bottom.equalTo(nW(-1000));
        make.trailing.equalTo(nW(-550));
    }];
    
    [self.guanghuan mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(828));
        make.height.equalTo(nH(437));
        make.bottom.equalTo(nW(-300));
        make.trailing.equalTo(nW(-200));
    }];
    
    
    UIButton *b = [[UIButton alloc]init];
    [self.view addSubview:b];
    
    [b addTarget:self action:@selector(ff) forControlEvents:64];
    [b mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(500));
        make.height.equalTo(nW(500));
        make.bottom.equalTo(nH(-400));
        make.trailing.equalTo(nW(-350));
    }];
    // Do any additional setup after loading the view.
}

- (void)disss
{
    [self dismissViewControllerAnimated:false completion:nil];
}

- (void)ff
{
    UIStoryboard *sb =  [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   UIViewController *vc  =   [sb instantiateViewControllerWithIdentifier:@"ZhenRongViewController"];
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.modalTransitionStyle =  UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:false completion:nil];
}
@end
