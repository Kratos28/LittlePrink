//
//  BaseViewController.m
//  Sanguo
//
//  Created by K on 2022/11/10.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *bf =  [[UIButton alloc]init];
    [self.view addSubview:bf];
    [bf mas_remakeConstraints:^(MASConstraintMaker *make)
     {
        
    }];
    // Do any additional setup after loading the view.
}


@end

