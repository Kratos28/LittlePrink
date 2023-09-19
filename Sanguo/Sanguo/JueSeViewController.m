//
//  JueSeViewController.m
//  Sanguo
//
//  Created by Kratos on 2022/11/23.
//

#import "JueSeViewController.h"
#import "PM.h"

@interface JueSeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *xiaohao;
@property (weak, nonatomic) IBOutlet UIButton *yijianzhuangbei;
@property (weak, nonatomic) IBOutlet UIButton *xiezhuang;

@property (weak, nonatomic) IBOutlet UIButton *tisheng;
@property (weak, nonatomic) IBOutlet UIImageView *tiao;
@property (weak, nonatomic) IBOutlet UILabel *jingyan;


@property (strong, nonatomic)  UILabel *shengmong0;
@property (strong, nonatomic)  UILabel *shengmong1;

@property (strong, nonatomic)  UILabel *fangyu0;
@property (strong, nonatomic)  UILabel *fangyu1;


@property (strong, nonatomic)  UILabel *gongji0;
@property (strong, nonatomic)  UILabel *gongji1;



@property (weak, nonatomic) IBOutlet UIButton *guanbib;
@property (strong, nonatomic)  NSMutableArray  *zhuangbs;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

@implementation JueSeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.zhuangbs = [NSMutableArray array];
    self.shengmong0 = [[UILabel alloc]init];
    self.shengmong1 = [[UILabel alloc]init];
    
    self.fangyu0 = [[UILabel alloc]init];
    self.fangyu1 = [[UILabel alloc]init];
    
    self.gongji0 = [[UILabel alloc]init];
    self.gongji1 = [[UILabel alloc]init];
    [self.view addSubview:self.shengmong0];
    [self.view addSubview:self.shengmong1];
    
    [self.view addSubview:self.fangyu0];
    [self.view addSubview:self.fangyu1];

    
    [self.view addSubview:self.gongji0];
    [self.view addSubview:self.gongji1];
    
    self.shengmong0.text = @"300";
    self.shengmong1.text = @"320";
    
    
    
    self.fangyu0.text = @"100";
    self.fangyu1.text = @"120";
    
    self.gongji0.text = @"270";
    self.gongji1.text = @"300";
    
    
    
    
    [self.guanbib mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(nW(-220));
        make.width.equalTo(nW(161));
        make.height.equalTo(nW(173));
        make.top.equalTo(nW(300));
    }];
    [self.guanbib addTarget:self action:@selector(guanbi) forControlEvents:64];
    
    
    [self.jingyan mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(nW(-220));
        make.width.equalTo(nW(300));
        make.height.equalTo(nW(100));
        make.centerY.equalTo(self.view).multipliedBy(1.57);

    }];
    
    self.jingyan.text = @"1/1000";
    [self.tiao mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(200));
        make.height.equalTo(nH(100));
        make.bottom.equalTo(nH(-300));
        make.trailing.equalTo(nW(400));
    }];
    
    self.xiaohao.text = @"消耗600/次";
    self.xiaohao.font = [PM iPhone]? [UIFont systemFontOfSize:13]: self.xiaohao.font;
    [self.xiaohao mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(nW(-130));
        make.width.equalTo(nW(300));
        make.height.equalTo(nW(100));
        make.centerY.equalTo(self.view).multipliedBy(1.75);

    }];
    
    [self.tisheng mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(nW(-180));
        make.width.equalTo(nW(372));
        make.height.equalTo(nW(149));
        make.bottom.equalTo(nW(-100));
    }];
    
    
    
    
    [self.xiezhuang mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view).multipliedBy(1.2);
        make.leading.equalTo(nW(250));
        make.width.equalTo(nW(369));
        make.height.equalTo(nW(146));
//        make.bottom.equalTo(nW(-950));
    }];
    
    [self.yijianzhuangbei mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(nW(-250));
        make.width.equalTo(nW(369));
        make.height.equalTo(nW(146));
        make.centerY.equalTo(self.view).multipliedBy(1.2);

    }];
    
    
    [self.shengmong0 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(nW(450));
        make.width.equalTo(nW(369));
        make.height.equalTo(nW(146));
        
        
        make.centerY.equalTo(self.view).multipliedBy(1.57);

 
    }];
    
    
    [self.shengmong1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(nW(1100));
        make.width.equalTo(nW(369));
        make.height.equalTo(nW(146));
        make.centerY.equalTo(self.view).multipliedBy(1.57);

    }];
    
    [self.fangyu0 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(nW(450));
        make.width.equalTo(nW(369));
        make.height.equalTo(nW(146));
        make.centerY.equalTo(self.view).multipliedBy(1.7);
    }];
    
    [self.gongji0 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(nW(450));
        make.width.equalTo(nW(369));
        make.height.equalTo(nW(146));
        make.centerY.equalTo(self.view).multipliedBy(1.83);

    }];

    
    
    [self.fangyu1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(nW(1100));
        make.width.equalTo(nW(369));
        make.height.equalTo(nW(146));
        make.centerY.equalTo(self.view).multipliedBy(1.7);

    }];
    
    
    [self.gongji1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(nW(1100));
        make.width.equalTo(nW(369));
        make.height.equalTo(nW(146));
        make.centerY.equalTo(self.view).multipliedBy(1.83);

    }];
    
    
    
    
    [self.yijianzhuangbei addTarget:self action:@selector(yijianchuan) forControlEvents:64];
    [self.xiezhuang addTarget:self action:@selector(xiezhuangclick) forControlEvents:64];
    [self.tisheng addTarget:self action:@selector(tishenclick) forControlEvents:64];

    P *p = [PM getP];
    
    self.bgImageView.image = [UIImage imageNamed:p.main_bgImageView];
    
    if ( [[NSUserDefaults standardUserDefaults]boolForKey:@"yijianchuan"] == YES)
    {
        [self yijianchuan];
    }
    
}

- (void)guanbi
{
    [self dismissViewControllerAnimated:false completion:nil];
}

- (void)tishenclick
{
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"元宝不足" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [vc addAction:ac1];
    [self presentViewController:vc animated:false completion:nil];
}

- (void)xiezhuangclick
{
    [self.zhuangbs enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    self.shengmong0.text = @"300";
    self.fangyu0.text = @"100";
    self.gongji0.text = @"270";
    
    [[NSUserDefaults standardUserDefaults]setBool:false forKey:@"yijianchuan"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
- (void)yijianchuan
{
    
//    NSArray<SIgn *> *array = [PM getData:@"SIgn"];
    int corlmax = 2;
    int itemW = W(325);
    int itemH = H(325);
    int startX = W(290);
    int startY = H(490);
    int mariginX = W(0);
    int mariginH = H(0);
    for (int i = 0; i < 1; i++) {
        int row=i/corlmax;//所在行
        int col=i%corlmax;//所在列
//        SIgn *p = array[i];
        //创建按钮
        UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
//        NSString *bb = p.pic;
        btn.tag = i;
        [btn setBackgroundImage:[UIImage imageNamed:@"8包裹_slices_8包裹_slices_组22"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:p.selectedpic] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(sssslcick:) forControlEvents:64];
        CGFloat x =  startX + col * (mariginX + itemW);
        btn.tag = i;
        CGFloat y  = startY  + row * (mariginH + itemH);
        btn.frame=CGRectMake(x, y, itemW,  itemH);
        [self.view addSubview:btn];
        [self.zhuangbs addObject:btn];
    }
    
    self.shengmong0.text = @"310";
    self.fangyu0.text = @"110";
    self.gongji0.text = @"300";
    
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"yijianchuan"];
    [[NSUserDefaults standardUserDefaults]synchronize];

}


@end
