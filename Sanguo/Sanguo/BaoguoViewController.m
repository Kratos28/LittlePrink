//
//  BaoguoViewController.m
//  Sanguo
//
//  Created by Kratos on 2022/11/22.
//

#import "BaoguoViewController.h"
#import "PM.h"
@interface BaoguoViewController ()
- (IBAction)guanbi:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *zhuangbeic;
@property (weak, nonatomic) IBOutlet UIButton *daojuC;
@property (weak, nonatomic) IBOutlet UIButton *guanbi;
@property (weak, nonatomic) IBOutlet UIButton *jinbi;
@property (strong, nonatomic)  NSMutableArray  *zhuangbs;

@end

@implementation BaoguoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.zhuangbeic mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(428));
        make.height.equalTo(nW(129));
        make.leading.equalTo(nW(300));
        make.top.equalTo(nH(650));
    }];
    
    
    [self.daojuC mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(428));
        make.height.equalTo(nW(129));
        make.leading.equalTo(nW(750));
        make.top.equalTo(nH(650));
    }];
    
    
    
    [self.jinbi mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(490));
        make.height.equalTo(nW(143));
        make.trailing.equalTo(nW(-300));
        make.top.equalTo(nH(600));
    }];
    
    [self.guanbi mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW((160)));
        make.height.equalTo(nH((170)));
        make.trailing.equalTo(nW(-200));
        make.top.equalTo(nW(300));
    }];

    self.zhuangbs = [NSMutableArray array];
    P *p = [PM getP];
    [self.jinbi setTitle:[NSString stringWithFormat:@"%d",p.jinbi] forState:0];
    
    
    
    int corlmax = 3;
    int itemW = W(265);
    int itemH = H(265);
    int startX = W(360);
    int startY = H(800);
    int mariginX = W(0);
    int mariginH = H(0);
    NSDictionary *dict =  nil;
    NSArray *pro = dict[@"product"];
    
    NSArray<SIgn *> *array = [PM getData:@"SIgn"];
    
    for (int i = 0; i < 1; i++) {
        int row=i/corlmax;//所在行
        int col=i%corlmax;//所在列
        SIgn *p = array[i];
        //创建按钮
        UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *bb = p.pic;
        btn.tag = i;
        [btn setBackgroundImage:[UIImage imageNamed:@"8包裹_slices_8包裹_slices_组22"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:p.selectedpic] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(sssslcick:) forControlEvents:64];
        CGFloat x =  startX + col * (mariginX + itemW);
        btn.tag = i;
        CGFloat y  = startY  + row * (mariginH + itemH);
        btn.frame=CGRectMake(x, y, itemW,  itemH);
        [self.view addSubview:btn];
        [self.zhuangbs addObject:btn];
    }
    
}
- (IBAction)daojuclick:(id)sender {
    
    [self.zhuangbs enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
        
    }];
}
- (IBAction)zhuangclick:(id)sender {
    
    
    int corlmax = 3;
    int itemW = W(265);
    int itemH = H(265);
    int startX = W(360);
    int startY = H(800);
    int mariginX = W(0);
    int mariginH = H(0);
    NSDictionary *dict =  nil;
    NSArray *pro = dict[@"product"];
    
    NSArray<SIgn *> *array = [PM getData:@"SIgn"];
    
    for (int i = 0; i < 1; i++) {
        int row=i/corlmax;//所在行
        int col=i%corlmax;//所在列
        SIgn *p = array[i];
        //创建按钮
        UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *bb = p.pic;
        btn.tag = i;
        [btn setBackgroundImage:[UIImage imageNamed:@"8包裹_slices_8包裹_slices_组22"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:p.selectedpic] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(sssslcick:) forControlEvents:64];
        CGFloat x =  startX + col * (mariginX + itemW);
        btn.tag = i;
        CGFloat y  = startY  + row * (mariginH + itemH);
        btn.frame=CGRectMake(x, y, itemW,  itemH);
        [self.view addSubview:btn];
        [self.zhuangbs addObject:btn];
    }
}

- (IBAction)guanbi:(id)sender {
    [self dismissViewControllerAnimated:false completion:nil];
}

- (void)sssslcick:(UIButton *)sender
{
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = sender.bounds;
    [btn setBackgroundImage:[UIImage imageNamed:@"8包裹_slices_8包裹_slices_框"] forState:UIControlStateNormal];
    [sender addSubview:btn];
}

@end
