//
//  QViewController.m
//  Sanguo
//
//  Created by Kratos on 2022/11/21.
//

#import "QViewController.h"
#import "PM.h"

NSString * WebViewJavascriptBridge_js();

@interface QViewController ()
@property (weak, nonatomic) IBOutlet UIButton *guanbi;

@end

@implementation QViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.guanbi mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW((160)));
        make.height.equalTo(nH((170)));
        make.trailing.equalTo(nW(-200));
        make.top.equalTo(nW(300));
    }];
    
    
    
    int corlmax = 3;
    int itemW = W(410);
    int itemH = H(460);
    int startX = W(380);
    int startY = H(650);
    NSDictionary *dict =  nil;
    NSArray *pro = dict[@"product"];
    
    NSArray<SIgn *> *array = [PM getData:@"SIgn"];
    
    static CGFloat const margin = 20;
    for (int i = 0; i < array.count; i++) {
        int row=i/corlmax;//所在行
        int col=i%corlmax;//所在列
        SIgn *p = array[i];
        //创建按钮
        UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *bb = p.pic;
        btn.tag = i;
        
        if (p.qiandao == false)
        {
            [btn setBackgroundImage:[UIImage imageNamed:bb] forState:UIControlStateNormal];

        }else
        {
            [btn setBackgroundImage:[UIImage imageNamed:p.selectedpic] forState:UIControlStateNormal];

        }
        
        [btn addTarget:self action:@selector(sssslcick:) forControlEvents:64];
        CGFloat x= startX + ((itemW+margin)*col);
        CGFloat y = startY + ((itemH+margin)*row);
        btn.frame=CGRectMake(x, y, itemW,  itemH);
        [self.view addSubview:btn];
    }
    
    
    
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *bb =   @"4七天签到_slices_4七天签到_slices_7";
    [btn setBackgroundImage:[UIImage imageNamed:bb] forState:UIControlStateNormal];
    CGFloat x=  X(380);
    CGFloat y = Y(1650);
    btn.frame=CGRectMake(x, y, W(1300),  H(460));
    [self.view addSubview:btn];
    
    


}

- (void)sssslcick:(UIButton *)sender
{
    if (sender.tag == 0) {
        sender.selected = true;
        NSArray<SIgn *> *pro = [PM getData:@"SIgn"];
        SIgn *s = pro[sender.tag];
        s.qiandao = true;
        save;
        UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"签到成功" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            P *p =  [PM getP];
            p.jinbi = p.jinbi + 300;
            save;
            
            [[NSNotificationCenter  defaultCenter]postNotificationName:@"jinbiupdate" object:nil userInfo:nil];

        }];
        [vc addAction:ac1];
        [self presentViewController:vc animated:false completion:nil];
        
        
        UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *bb =   @"4七天签到_slices_4七天签到_slices_已领取";
        [btn setBackgroundImage:[UIImage imageNamed:bb] forState:UIControlStateNormal];
      
        btn.frame= sender.bounds;
        [sender addSubview:btn];

    }else
    {
        UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"请在第二天签到" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [vc addAction:ac1];
        [self presentViewController:vc animated:false completion:nil];
        
    }
}
- (IBAction)guanbi:(UIButton *)sender {
    [self dismissViewControllerAnimated:false completion:nil];
}




@end


