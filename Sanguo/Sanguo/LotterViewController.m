//
//  LotterViewController.m
//  Sanguo
//
//  Created by Kratos on 2022/11/22.
//

#import "LotterViewController.h"
#import "PM.h"

@interface LotterViewController () <CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *zhuanpan;
@property (weak, nonatomic) IBOutlet UIImageView *zhizhen;

@end

@implementation LotterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *bagk= [UIButton buttonWithType:UIButtonTypeCustom];

    [bagk addTarget:self action:@selector(disss) forControlEvents:64];

    bagk.frame= self.view.bounds;
    [self.view addSubview:bagk];
    
    
    [self.zhuanpan mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(1354));
        make.height.equalTo(nW(1347));
        make.centerY.equalTo(self.view.mas_centerY).offset(-H(50));
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [self.zhizhen mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(322));
        make.height.equalTo(nW(458));
        make.centerY.equalTo(self.zhuanpan.mas_centerY);
        make.centerX.equalTo(self.zhuanpan.mas_centerX);
    }];
    
    
    
    
    
    UIButton *btn1= [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *bb1 =   @"6转盘_slices_6转盘_slices_按钮拷贝2";
    [btn1 setBackgroundImage:[UIImage imageNamed:bb1] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1click) forControlEvents:64];

    CGFloat x1 =  X(600);
    CGFloat y1 = Y(2200);
    btn1.frame=CGRectMake(x1, y1, W(850),  H(260));
    [self.view addSubview:btn1];
    
    
    

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"    停止了");
    
    UIStoryboard *sb =  [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"LotterTanChuangViewController"];
    vc.modalPresentationStyle = UIModalPresentationCurrentContext;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:false completion:nil];
    
}

- (void)disss
{
    [self dismissViewControllerAnimated:false completion:nil];
}


-(void) startAnimation
{
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * 2.0 * 2.0 *  2.0 * 2.0];
    rotationAnimation.duration = 2;
//    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = YES;
    rotationAnimation.delegate = self;
    [self.zhuanpan.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

-(void)endAnimation
{
//    [self startAnimation];
}


- (void)btn1click
{
    
    
    
    
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"抽奖一次花费400元宝" message:@"是否继续" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        
        P *p =  [PM getP];
        if (p.jinbi < 400)
        {
            UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:@"金币不足" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [vc addAction:ac1];
            [self presentViewController:vc animated:false completion:nil];
            
            return;;
        }
        
        p.jinbi = p.jinbi - 400;
        save;
        [[NSNotificationCenter defaultCenter]postNotificationName:@"jinbiupdate" object:nil];
        [self startAnimation];
        
//        UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"元宝不足" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//        }];
//        [vc addAction:ac1];
//        [self presentViewController:vc animated:false completion:nil];
        
    }];
    UIAlertAction *ac2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
      
    }];
    [vc addAction:ac1];
    [vc addAction:ac2];
    
    [self presentViewController:vc animated:false completion:nil];
}


@end
