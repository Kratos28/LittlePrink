//
//  BVIew.m
//  Sanguo
//
//  Created by Kratos on 2022/11/24.
//

#import "BVIew.h"
#import "PM.h"
@implementation BVIew


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.progressView = [[ProgressView alloc] init];
        [self addSubview:self.progressView];
        self.progressView.barColor = [UIColor blackColor];
        self.progressView.trackColor = [UIColor redColor];
        self.progressView.progress = 100;
        
        
        
        self.anminate = [[UIImageView alloc] init];
        self.anminate.image = [UIImage imageNamed:@"12_gongjixuehen"];
        self.anminate.hidden = true;
        [self addSubview:self.anminate];
      
        
        
    }
    return self;
}

- (void)setZrmol:(ZR *)zrmol
{
    _zrmol= zrmol;
//    [self setBackgroundImage:[UIImage imageNamed:zrmol.zhandou_kaipai] forState:0];
    
}
- (void)kouxue:(ZR * )hero
{
    float value = (float)(hero.type_shengming) / hero.type_zuidashengming;
    value =  value * 100;
    self.progressView.progress = value;
//    self.LastValue = hero.type_shengming;
    float flo =  (float) (float)((float)value /(float)100);
    
    
    self.zrmol = hero;

     CGRect rect = self.frame;

    [UIView animateWithDuration:0.1 animations:^{
        self.frame =   CGRectMake(rect.origin.x+5, rect.origin.y+5, rect.size.width, rect.size.height);

        self.anminate.hidden = false;

    } completion:^(BOOL finished) {
        self.frame = rect;

    }];
 



    [self performSelector:@selector(animatehide) withObject:nil afterDelay:0.5];
//
    if (hero.type_shengming <=
        0) {
        [self performSelector:@selector(Dead) withObject:nil afterDelay:0.5];
    }
    

    
}


- (void)Dead
{
    [self removeFromSuperview];
}
- (void)animatehide
{
    self.anminate .hidden = true;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.progressView.frame =  CGRectMake(X(20), Y(0),self.frame.size.width-W(40), H(40));;
    self.anminate.frame =   CGRectMake((self.frame.size.width/2) - (W(556) /2), (self.frame.size.height/2) - (H(351) /2)+H(100), W(556), H(351));
}


- (void)dealloc
{
    NSLog(@"cView");
}

@end
