//
//  SViewController.m
//  Sanguo
//
//  Created by K on 2022/11/10.
//

#import "SViewController.h"
#import "Masonry/Masonry.h"
#import "Headr.h"
#import "PM.h"
#import "AppDelegate.h"
@interface SViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *sview;
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic)  UIButton *b;
@property (weak, nonatomic) IBOutlet UIImageView *imageVIEW;
@property (weak, nonatomic) IBOutlet UIButton *kaishibbbb;

@end

@implementation SViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.sview mas_remakeConstraints:^(MASConstraintMaker *make) {
        int w =  X(1600);
        make.width.equalTo(@(w));
        make.height.equalTo(@(100));
        make.bottom.equalTo(@(X(-100)));
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    self.imageVIEW.image = [UIImage imageNamed:@"2选角色1_slices_2选角色1_slices_组9"];
    UIButton *ss = self.sview.subviews.firstObject;
    [self click:ss];
    
    
    self.sview.spacing = [PM iPhone] ? W(40): W(300);
    
    [self.kaishibbbb mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(W(850)));
        make.height.equalTo(@(W(260)));
        make.bottom.equalTo(@(X(-700)));
        make.trailing.equalTo(@(X(-100)));
    }];
    
    
    
}
- (IBAction)chuanjianClick:(UIButton *)sender {
    
    UIStoryboard *sb =  [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:self.class]];
    UIViewController *v =   [sb instantiateViewControllerWithIdentifier:@"MViewController"];
    v.modalPresentationStyle =  UIModalPresentationCustom;
    v.modalTransitionStyle =  UIModalTransitionStyleCrossDissolve;
    [self presentViewController:v animated:false completion:nil];
}

- (IBAction)click:(UIButton *)sender {
    self.b.selected = false;
    sender.selected = true;
    P *p =   [PM setupP][sender.tag];
    p.selected = YES;
    
    self.b = sender;
    [appDelegate saveContext];
     P *pp = [PM getP];
    //[app1 saveContext];
    switch (sender.tag)
    {
        case 0:
            self.imageVIEW.image = [UIImage imageNamed:@"2选角色1_slices_2选角色1_slices_组9"];
            break;
        case 1:
            self.imageVIEW.image = [UIImage imageNamed:@"2选角色1_slices_2选角色1_slices_组8"];
            break;;
        case 2:
            self.imageVIEW.image = [UIImage imageNamed:@"2选角色1_slices_2选角色1_slices_组7"];
            break;;
        default:
            break;
    }
}


@end
