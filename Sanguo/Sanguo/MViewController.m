//
//  MViewController.m
//  Sanguo
//
//  Created by K on 2022/11/10.
//

#import "MViewController.h"
#import "Headr.h"
@interface MViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *MViewController;
@property (weak, nonatomic) IBOutlet UIStackView *tops;
@property (weak, nonatomic) IBOutlet UIStackView *zuoS;
@property (weak, nonatomic) IBOutlet UIStackView *bottomS;

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
    
    
}



@end
