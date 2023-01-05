//
//  BGBGVIew.h
//  Sanguo
//
//  Created by Kratos on 2022/11/24.
//

#import <UIKit/UIKit.h>
#import "BGView.h"
#import "BVIew.h"
NS_ASSUME_NONNULL_BEGIN

@interface BGBGVIew : UIView
- (instancetype)initWithZR:(NSMutableArray *)a withwofang:(BOOL)wofang;
@property (nonatomic,strong)UIView *beigongjiView;
@property (nonatomic,weak)BVIew *lastgongjiview;
@property (nonatomic,strong)BGView *bgview;;
@property (nonatomic,assign)CGRect orignRect;
@property (nonatomic,assign)BOOL flag;
@property (nonatomic,assign)BOOL shifoufanhui;

- (void)randkouxue:(void(^)(void))wancheng;
-(void)direnqianjin;
- (void)wofanggongji;
- (void)direngongji;
- (void)huanyuanweizhi;
- (void)qianjinDown:(BVIew *)cardVie withqianjing:(void(^)(void))qiangjin withwangcheng:(void(^)(void))wancheng;
- (void)qianjintop:(BVIew *)cardVie withqianjing:(void(^)(void))qiangjin withwangcheng:(void(^)(void))wancheng;
@end

NS_ASSUME_NONNULL_END
