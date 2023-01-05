//
//  MViewController.m
//  Sanguo
//
//  Created by K on 2022/11/10.
//

#import "MViewController.h"
#import "PM.h"
@interface MViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *MViewController;
@property (weak, nonatomic) IBOutlet UIStackView *tops;
@property (weak, nonatomic) IBOutlet UIStackView *zuoS;
@property (weak, nonatomic) IBOutlet UIStackView *bottomS;
@property (weak, nonatomic) IBOutlet UIButton *jinbi;

@end

@implementation MViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tops mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(X(1000)));
        make.height.equalTo(@(X(350)));
        make.top.equalTo(@(Y(400)));
        make.trailing.equalTo(@(0));

    }];
    
    [self.zuoS mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(X(310)));
        make.height.equalTo(@(X(1200)));
        make.centerY.equalTo(self.view.mas_centerY);
        make.trailing.equalTo(@(0));
    }];
    
    [self.bottomS mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(H(300)));
        make.trailing.equalTo(self.view.mas_trailing).offset(0);
        make.leading.equalTo(self.view.mas_leading).offset(0);
        make.bottom.equalTo(self.view).offset(-Y(140));
        
    }];
    P *p =  [PM getP];
    self.MViewController.image = [UIImage imageNamed:p.main_headimagename];
    
    [self.jinbi mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(H(80)));
            make.trailing.equalTo(@(W(-110)));
            make.height.equalTo(@(H(100)));
        make.width.equalTo(nW(400));
        
    }];
//    self.jinbi.text = [NSString stringWithFormat:@"%d",p.jinbi];
    [self.jinbi setTitle:[NSString stringWithFormat:@"%d",p.jinbi] forState:UIControlStateNormal];
    [[NSNotificationCenter defaultCenter]addObserverForName:@"jinbiupdate" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        [self.jinbi setTitle:[NSString stringWithFormat:@"%d",p.jinbi] forState:UIControlStateNormal];

    }];
}



- (IBAction)clickccc:(id)sender {
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"暂未开启" message:@"请挑战3关完成后再开启" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [vc addAction:ac1];
    [self presentViewController:vc animated:false completion:nil];
}


@end
