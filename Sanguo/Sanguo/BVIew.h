//
//  BVIew.h
//  Sanguo
//
//  Created by Kratos on 2022/11/24.
//

#import <UIKit/UIKit.h>
#import "ProgressView.h"
#import "ZR+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN
@interface BVIew : UIButton
@property (nonatomic,strong)ZR *zrmol;
@property (nonatomic,strong)ProgressView *progressView;;
@property (nonatomic,assign) float LastValue;
@property (nonatomic,strong)UIImageView *anminate;

- (void)kouxue:(NSMutableDictionary * )hero;
@end

NS_ASSUME_NONNULL_END
