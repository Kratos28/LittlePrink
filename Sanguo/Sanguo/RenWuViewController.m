//
//  RenWuViewController.m
//  Sanguo
//
//  Created by Kratos on 2022/11/22.
//

#import "RenWuViewController.h"
#import "PM.h"
@interface RenWuViewController ()

@end

@implementation RenWuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIButton *bagk= [UIButton buttonWithType:UIButtonTypeCustom];

    [bagk addTarget:self action:@selector(disss) forControlEvents:64];

    bagk.frame= self.view.bounds;
    [self.view addSubview:bagk];

    
    UIButton *bf =  [[UIButton alloc]init];
    P *p  =  [PM getP];
    [bf setTitle:[NSString stringWithFormat:@"%d",p.jinbi] forState:0];
    [self.view addSubview:bf];

    
    [bf mas_remakeConstraints:^(MASConstraintMaker *make)
     {
        make.top.equalTo(@(H(70)));
        make.trailing.equalTo(@(W(-300)));
        make.height.equalTo(@(H(100)));
        make.width.equalTo(nW(400));

    }];
    

    
    {
        int corlmax = 1;
        int itemW = W(443);
        int itemH = H(138);
        int startX = W(1400);
        int startY = H(650);
        int mariginX = W(0);
        int mariginH = H(260);
        CGFloat  margin = W(40);

        for (int i = 0; i < 5; i++) {
            int row=i/corlmax;//所在行
            int col=i%corlmax;//所在列
            //创建按钮
            UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *bb =   @"7任务_slices_7任务_slices_按钮拷贝3";
            NSString *selectedpic =   @"7任务_slices_7任务_slices_按钮hui";
            [btn setBackgroundImage:[UIImage imageNamed:bb] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:selectedpic] forState:UIControlStateSelected];

            CGFloat x= startX + ((itemW+margin)*col + (col * mariginX));
            btn.tag = i;
            CGFloat y = startY + ((itemH+margin)*row + (row * mariginH));
            [btn addTarget:self action:@selector(sssslcick:) forControlEvents:64];
            btn.frame=CGRectMake(x, y, itemW,  itemH);
            [self.view addSubview:btn];
        }
        
    }

    
    
    {
        int corlmax = 1;
        int itemW = W(800);
        int itemH = H(100);
        int startX = W(600);
        int startY = H(610);
        int mariginX = W(0);
        int mariginH = [PM iPhone]? W(380): W(260);
        NSArray *ass = @[@"通过第五关:     0/5",@"通过第十关:     0/5",@"通过第十五关:     0/5",@"通过第二十关:     0/5",@"通过第二十五关:     0/5"];
        CGFloat  margin = W(40);

        for (int i = 0; i < ass.count; i++) {
            int row=i/corlmax;//所在行
            int col=i%corlmax;//所在列
            //创建按钮
            UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
            btn.titleLabel.textAlignment = NSTextAlignmentRight;
            [btn setTitle:ass[i] forState:0];
            [btn setTintColor:[UIColor grayColor]];
            CGFloat x= startX + ((itemW+margin)*col + (col * mariginX));
            btn.tag = i;
            CGFloat y = startY + ((itemH+margin)*row + (row * mariginH));
            [btn addTarget:self action:@selector(sssslcick:) forControlEvents:64];
            btn.frame=CGRectMake(x, y, itemW,  itemH);
            [self.view addSubview:btn];
        }
        
    }

    
    
    {
        int corlmax = 1;
        int itemW = W(300);
        int itemH = H(100);
        int startX = W(1580);
        int startY = H(500);
        int mariginX = W(0);
        int mariginH = H(290);

        CGFloat  margin = W(40);

        for (int i = 0; i < 5; i++) {
            int row=i/corlmax;//所在行
            int col=i%corlmax;//所在列
            //创建按钮 r
            UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
 
            [btn setTitle:@"300" forState:0];
            [btn setTintColor:[UIColor whiteColor]];
            CGFloat x= startX + ((itemW+margin)*col + (col * mariginX));
            btn.tag = i;
            CGFloat y = startY + ((itemH+margin)*row + (row * mariginH));
            [btn addTarget:self action:@selector(sssslcick:) forControlEvents:64];
            btn.frame=CGRectMake(x, y, itemW,  itemH);
            [self.view addSubview:btn];
        }
        
    }
}

- (void)disss
{
    [self dismissViewControllerAnimated:false completion:nil];
}

- (void)sssslcick:(UIButton *)sender
{
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"无法领取，请完成挑战" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [vc addAction:ac1];
    [self presentViewController:vc animated:false completion:nil];
}
@end
