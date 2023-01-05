//
//  LotterTanChuangViewController.m
//  Sanguo
//
//  Created by Kratos on 2022/12/5.
//

#import "LotterTanChuangViewController.h"
#import "Masonry/Masonry.h"
#import "PM.h"
@interface LotterTanChuangViewController ()
@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation LotterTanChuangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *bagk= [UIButton buttonWithType:UIButtonTypeCustom];
    [bagk setBackgroundImage:[UIImage imageNamed:@"7任务_slices_7任务_slices_取消拷贝"] forState:0];
    [bagk addTarget:self action:@selector(disss) forControlEvents:64];
    [self.view addSubview:bagk];
    [bagk mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW((160)));
        make.height.equalTo(nH((170)));
        make.trailing.equalTo(nW(-200));
        make.top.equalTo(nW(300));
    }];
    
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"6转盘_slices_6转盘_slices_弹窗_1(1)"]];
    [self.view addSubview:self.imageView];
    [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(@(W(410)));
        make.height.equalTo(@(H(400)));

    }];
    
    P *p =  [PM getP];
    p.jinbi = p.jinbi + 150;
    save;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"jinbiupdate" object:nil];


}

- (void)disss
{
    [self dismissViewControllerAnimated:false completion:nil];
}



@end
