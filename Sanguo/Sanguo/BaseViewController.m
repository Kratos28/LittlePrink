//
//  BaseViewController.m
//  Sanguo
//
//  Created by K on 2022/11/10.
//

#import "BaseViewController.h"
#import "PM.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *bf =  [[UIButton alloc]init];
    
    [self.view addSubview:bf];
    self.jinbtn = bf;
    [bf mas_remakeConstraints:^(MASConstraintMaker *make)
     {
        make.top.equalTo(@(H(80)));
        make.trailing.equalTo(@(W(-110)));
        make.height.equalTo(@(H(100)));
        make.width.equalTo(nW(400));

    }];
    // Do any additional setup after loading the view.
}

- (void)injected
{
    [self viewDidLoad];
}


@end

