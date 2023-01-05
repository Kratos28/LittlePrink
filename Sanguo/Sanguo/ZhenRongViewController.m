//
//  ZhenRongViewController.m
//  Sanguo
//
//  Created by Kratos on 2022/11/23.
//

#import "ZhenRongViewController.h"
#import "PM.h"
#import "ZhanDouVC.h"
@interface ZhenRongViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collviewView;
@property (weak, nonatomic) IBOutlet UIButton *qingkong;
@property (weak, nonatomic) IBOutlet UIButton *yijinabuzhen;
@property (weak, nonatomic) IBOutlet UIButton *kaishizhandou;
@property (strong, nonatomic)  NSMutableArray *buttons;;

@end

@implementation ZhenRongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    UIButton *bagk= [UIButton buttonWithType:UIButtonTypeCustom];
    [bagk setBackgroundImage:[UIImage imageNamed:@"7任务_slices_7任务_slices_取消拷贝"] forState:0];
    [bagk addTarget:self action:@selector(disss) forControlEvents:64];

    [self.view addSubview:bagk];


    [bagk mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW((160)));
        make.height.equalTo(nH((170)));
        make.trailing.equalTo(nW(-150));
        make.top.equalTo(nW(200));
    }];
    
    self.buttons = [NSMutableArray array];
   
    [self.collviewView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading).offset(W(50));
        make.trailing.equalTo(self.view.mas_trailing).offset(X(-50));
        make.bottom.equalTo(nW(-750
                               ));
        make.height.equalTo(nW(400));
    }];
    
    [self.qingkong mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(539));
        make.height.equalTo(nH(164));
        make.bottom.equalTo(nW(-550));
        make.leading.equalTo(nW(300));
    }];
    
    
    [self.yijinabuzhen mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(539));
        make.height.equalTo(nH(164));
        make.bottom.equalTo(nW(-550));
        make.trailing.equalTo(nW(-300));
    }];

    
    [self.kaishizhandou mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(nW(857));
        make.height.equalTo(nW(258));
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.bottom.equalTo(nH(-100));

    }];
    
    [self.kaishizhandou addTarget:self action:@selector(kaishiclick) forControlEvents:64];
    [self.yijinabuzhen addTarget:self action:@selector(yijinabuzhenclick) forControlEvents:64];
    [self.qingkong addTarget:self action:@selector(qingkongclick) forControlEvents:64];

    UICollectionViewFlowLayout *layout =  self.collviewView .collectionViewLayout;
    layout.itemSize = CGSizeMake(W(410), H(290));
    self.collviewView.collectionViewLayout = layout;

}
-  (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionView" forIndexPath:indexPath];
    ZR *zr =  self.buttons[indexPath.item];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:zr.norimagname]];
    return  cell;;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.buttons.count > 0)
    {
        return  1;
    }else
    {
        return self.buttons.count;
    }
}
- (void)disss
{
    [self dismissViewControllerAnimated:false completion:nil];
}


- (void)kaishiclick
{
    if (self.buttons.count == 0)
    {
        UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"请选择一个阵容上阵" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [vc addAction:ac1];
        [self presentViewController:vc animated:false completion:nil];
    }
    
    
    
    UIStoryboard *sb =  [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc =  [sb instantiateViewControllerWithIdentifier:@"ZhanDouVC"];
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.modalTransitionStyle  = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:false completion:nil];
    
    
}

- (void)yijinabuzhenclick
{
    NSArray *temp =  [PM getData:@"ZR"];
    self.buttons = [temp mutableCopy];
    [self.collviewView reloadData];
    
}



- (void)qingkongclick
{
    [self.buttons removeAllObjects];
    [self.collviewView reloadData];
}


@end
