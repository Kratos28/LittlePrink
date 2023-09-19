//
//  ShangDViewController.m
//  Sanguo
//
//  Created by Kratos on 2022/11/22.
//

#import "ShangDViewController.h"
#import "PM.h"

@interface ShangDViewControllerDeat:BaseViewController
@property (nonatomic,strong)Shop *shop;
@end


@implementation ShangDViewControllerDeat


- (instancetype)initWithFF:(Shop *)shop
{
    self = [super init];
    if (self) {
        self.shop = shop;
    }
    return  self;;
}

 - (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *bgima = [[UIImageView alloc]init];
    bgima.userInteractionEnabled = YES;
    bgima.frame = self.view.bounds;
    bgima.image = [UIImage imageNamed:@"5商店_slices_商店提示_slices_组19"];
    [self.view addSubview:bgima];
    
    
    
    
    UIButton *ditubtn= [UIButton buttonWithType:UIButtonTypeCustom];
  
    [ditubtn addTarget:self action:@selector(btn1click) forControlEvents:64];
    ditubtn.frame = self.view.bounds;
    [bgima addSubview:ditubtn];
    

    
    
    
    UIImageView *itemima = [[UIImageView alloc]init];
    itemima.image = [UIImage imageNamed:self.shop.bg_imageview];
    
    [bgima addSubview:itemima];
    [itemima mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(410));
        make.height.equalTo(nW(400));
        make.leading.equalTo(nW(400));
        make.centerY.equalTo(bgima.mas_centerY);
    }];
    
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *bb =   @"5商店_slices_商店提示_slices_按钮拷贝3";
    [btn setBackgroundImage:[UIImage imageNamed:bb] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goumaichenggong) forControlEvents:64];
    CGFloat x=  X(1000);
    CGFloat y = Y(1200);
    btn.frame=CGRectMake(x, y, W(457),  H(140));
    [bgima addSubview:btn];
    
    
//
    UIButton *btn1= [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *bb1 =   @"5商店_slices_商店提示_slices_按钮拷贝2";
    [btn1 setBackgroundImage:[UIImage imageNamed:bb1] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1click) forControlEvents:64];

    CGFloat x1 =  X(1000);
    CGFloat y1 = Y(1400);
    btn1.frame=CGRectMake(x1, y1, W(457),  H(140));
    [bgima addSubview:btn1];
}

- (void)goumaichenggong{
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"元宝不足" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [vc addAction:ac1];
    [self presentViewController:vc animated:false completion:nil];
}

- (void)btn1click
{
    [self dismissViewControllerAnimated:false completion:nil];
}
@end




@interface ShangDViewController ()
@property (weak, nonatomic) IBOutlet UIButton *guanbi;

@end

@implementation ShangDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.guanbi mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW((160)));
        make.height.equalTo(nH((170)));
        make.trailing.equalTo(nW(-200));
        make.top.equalTo(nW(300));
    }];
    
    [self.guanbi addTarget:self action:@selector(fff) forControlEvents:UIControlEventTouchUpInside];
    int corlmax = 3;
    int itemW = W(410);
    int itemH = H(400);
    int startX = W(380);
    int startY = H(650);
    NSDictionary *dict =  nil;
    NSArray *pro = dict[@"product"];
    
    NSArray<Shop *> *array = [PM getData:@"Shop"];
    
     CGFloat  margin = W(40);
    for (int i = 0; i < array.count; i++) {
        int row=i/corlmax;//所在行
        int col=i%corlmax;//所在列
        Shop *p = array[i];
        //创建按钮
        UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *bb = p.bg_imageview;
        btn.tag = i;
        [btn setBackgroundImage:[UIImage imageNamed:bb] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cccc:) forControlEvents:64];
        CGFloat x= startX + ((itemW+margin)*col);
        CGFloat y = startY + ((itemH+margin)*row);
        btn.frame=CGRectMake(x, y, itemW,  itemH);
        [self.view addSubview:btn];
    }
    
}

- (void)cccc:(UIButton *)sender
{
    NSArray<Shop *> *array = [PM getData:@"Shop"];
    Shop *shop =   array[sender.tag];
    ShangDViewControllerDeat *vc = [[ShangDViewControllerDeat alloc]initWithFF:shop];
    vc.modalPresentationStyle =UIModalPresentationCustom;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:false completion:nil];
    
}
- (void)fff
{
    [self dismissViewControllerAnimated:false completion:nil];
}


@end
