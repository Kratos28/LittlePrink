//
//  BGBGVIew.m
//  Sanguo
//
//  Created by Kratos on 2022/11/24.
//

#import "BGBGVIew.h"
#import "PM.h"
@interface BGBGVIew()
@property (nonatomic,assign)BOOL wofang;

@end

@implementation BGBGVIew


- (instancetype)initWithZR:(NSMutableArray *)a withwofang:(BOOL)wofang;
{
    self = [super init];
    if (self) {
        self.flag = true;
        self.wofang =wofang;
        BGView *bgview = [[BGView alloc] init];
     
        bgview.frame = self.superview.bounds;
        [self addSubview:bgview];
        self.bgview = bgview;

        for (int i =0; i<a.count; i++) {
            BVIew *v = [[BVIew alloc] init];
            
       
            v.zrmol = a[i];
            
            [v setBackgroundImage:[UIImage imageNamed:v.zrmol.zhandou_kaipai] forState:0];
            if (wofang ==false) {
                if (i == 0) {
                    [v setBackgroundImage:[UIImage imageNamed:@"12战斗_slices(1)_人_图层71"] forState:0];
                }else if (i == 1)
                {
                    [v setBackgroundImage:[UIImage imageNamed:@"12战斗_slices(1)_战斗_slices_色相／饱和度11"] forState:0];

                }
            }else
            {
                [v addTarget:self action:@selector(cclick:) forControlEvents:64];

            }
            [bgview addSubview:v];
        }
    
        
        
        
        
        
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    int maxcols = 1;
    int W = W(768);
    int H = H(970);
    int xmari = X(90);
    int ymari = H(50);
    int buttonStartX = X(0);
    int buttonStartY = Y(0);
    
    self.bgview.frame = self.bounds;
    
    for (int i =0; i<self.bgview.subviews.count; i++) {
        int row = i / maxcols;
        int col = i % maxcols;
        int titlex =  buttonStartX +col * (xmari + W);
        int titley =  buttonStartY + row * (ymari +H);
        
        UIButton *btn = self.bgview.subviews[i];
        btn.frame = CGRectMake(titlex, titley, W, H);
        if (i == 0) {
            btn.frame = CGRectMake(X(200), Y(200), W(420), H(516));
        }else if (i == 1)
        {
            btn.frame = CGRectMake(X(0), Y(800), W(768), H(970));
        }
    }
 
    
    
}
-(void)cclick:(BVIew *)view
{
    if (self.flag == false) {
        return;;
    }


    self.flag = false;
    
//
    self.lastgongjiview = view;

    [self qianjintop:view withqianjing:^{
//        self.lastgongjiview = view;


    } withwangcheng:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"qianjinWillwangcheng" object:nil userInfo:@{@"CBGBGView":self,@"CView":view,@"CBGView":self.bgview}];

    }];
}


- (void)qianjintop:(BVIew *)cardVie withqianjing:(void(^)(void))qiangjin withwangcheng:(void(^)(void))wancheng
{

        
        CGRect origin = CGRectMake(cardVie.frame.origin.x, cardVie.frame.origin.y, cardVie.frame.size.width, cardVie.frame.size.height);
        self.orignRect = origin;
            [UIView animateWithDuration:0.5 animations:^{
              
                
    
               
            cardVie.frame = CGRectMake(cardVie.frame.origin.x + X(50) , cardVie.frame.origin.y,  (cardVie.frame.size.width),  cardVie.frame.size.height);
                
     
            } completion:^(BOOL finished) {
                wancheng();
            }];

}

- (void)qianjinDown:(UIView *)cardVie withqianjing:(void(^)(void))qiangjin withwangcheng:(void(^)(void))wancheng
{

        
        CGRect origin = CGRectMake(cardVie.frame.origin.x, cardVie.frame.origin.y, cardVie.frame.size.width, cardVie.frame.size.height);
    self.orignRect = origin;
            [UIView animateWithDuration:0.5 animations:^{
              
                
                
             cardVie.frame = CGRectMake(cardVie.frame.origin.x - X(50) , cardVie.frame.origin.y,  (cardVie.frame.size.width),  cardVie.frame.size.height);
                 
     
            } completion:^(BOOL finished) {
                wancheng();
            }];

}
- (void)haiyuanweizhi:(UIView *)cardVie withqianjing:(void(^)(void))qiangjin withwangcheng:(void(^)(void))wancheng
{
    CGRect origin = self.orignRect;

        [UIView animateWithDuration:0.8 animations:^{
          
            
            
            CGRect visualRect = [cardVie convertRect:CGRectMake(X(2220), Y(700), W(470), H(640)) fromView:cardVie.superview.superview.superview];

            CGRect JIPW = visualRect;
            JIPW.origin.x =  (visualRect.origin.x -(visualRect.origin.x - cardVie.frame.size.width))+X(1360);
           
            cardVie.frame = origin;
            
 
        } completion:^(BOOL finished) {
            wancheng();
        }];
}

- (void)randkouxue:(void(^)(void))wancheng
{
    BGView *bgview  = (BGView*) self.bgview;
    NSInteger ide=  rand_num(0, bgview.subviews.count-1);
    BVIew * renwuvie =  self.bgview.subviews[ide];
    
    
    int b =  25+ arc4random()%(30 - 0 + 1);
    P *p =  [PM getP];

    if (self.wofang) {
        //我放被减少的血量
        //随机减少血量


        b =          rand_num(30, 40);


        
    }else{
        ////敌方被减少的血量
        //随机减少血量

        b =  rand_num(30, 80);

    }
    
    
    renwuvie.LastValue = renwuvie.zrmol.type_shengming;
    renwuvie.zrmol.type_shengming  = renwuvie.zrmol.type_shengming - b;
    NSLog(@" %@ %d   %d %d ",renwuvie,renwuvie.zrmol.type_zuidashengming, renwuvie.zrmol.type_shengming ,b);

    self.beigongjiView =renwuvie;
    [renwuvie kouxue:renwuvie.zrmol];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        wancheng();
    });
}


@end
