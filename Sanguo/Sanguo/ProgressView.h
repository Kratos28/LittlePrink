//
//  ProgressView.h
//  42game
//
//  Created by K on 2021/9/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProgressView : UIView
@property (nonatomic,strong)UIView *trackView;
@property (nonatomic,strong)NSLayoutConstraint *trackViewWidthConstraint;
@property (nonatomic,strong)UIColor *barColor;
@property (nonatomic,strong)UIColor *trackColor;
@property (nonatomic,assign)bool isCornersRounded;
@property (nonatomic,assign)CGFloat maximumValue;
@property (nonatomic,assign)CGFloat minimumValue;
@property (nonatomic,assign)CGFloat progress;
@property (nonatomic,assign)CGFloat barInset;
@property (nonatomic,assign)NSTimeInterval animationDuration;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
