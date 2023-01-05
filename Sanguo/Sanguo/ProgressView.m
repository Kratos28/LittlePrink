//
//  ProgressView.m
//  42game
//
//  Created by K on 2021/9/28.
//

#import "ProgressView.h"

@implementation ProgressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.trackView = [[UIView alloc] init];
        self.trackViewWidthConstraint = [NSLayoutConstraint constraintWithItem:self.trackView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0];
        self.barColor = [UIColor grayColor];
        self.animationDuration = 0.25;
        self.maximumValue = 100;
        self.minimumValue =0;
        self.isCornersRounded = true;
        self.progress = 0;        
        [self prepare];
    }
    return self;
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self prepare];
    }
    return self;;
}


- (void)prepare
{
    [self addSubview:self.trackView];
    self.trackView.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.trackView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeftMargin multiplier:1.0 constant:0],
        [NSLayoutConstraint constraintWithItem:self.trackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0],
        [NSLayoutConstraint constraintWithItem:self.trackView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0],
        self.trackViewWidthConstraint
    ]];

    self.layoutMargins = UIEdgeInsetsZero;
}

- (void)setBarColor:(UIColor *)barColor
{
    _barColor = barColor;
    self.layer.backgroundColor = barColor.CGColor;
}

- (void)setTrackColor:(UIColor *)trackColor
{
    _trackColor = trackColor;
    self.trackView.layer.backgroundColor =  trackColor.CGColor;

}
 - (void)setIsCornersRounded:(bool)isCornersRounded
{
    _isCornersRounded = isCornersRounded;
    if (!_isCornersRounded) {
        self.layer.cornerRadius = 0;
        self.trackView.layer.cornerRadius = 0;
        
    }
    [self layoutSubviews];
}

 - (void)setMaximumValue:(CGFloat)maximumValue
{
    _maximumValue = maximumValue;
    self.progress = self.progress;
}

- (void)setMinimumValue:(CGFloat)minimumValue
{
    _minimumValue = minimumValue;
    self.progress = self.progress;
    
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    self.progress =progress;
    if (animated) {
        [UIView animateWithDuration:self.animationDuration animations:^{
            [self layoutIfNeeded];
        }];
    }
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    if (_progress > _maximumValue) {
        _progress = _maximumValue;
    }else if (_progress<_minimumValue)
    {
        _progress = _minimumValue;
    }
    [self layoutSubviews];
}

- (void)setBarInset:(CGFloat)barInset
{
    _barInset = barInset;
    [self layoutSubviews];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat maxWidth = MAX(self.frame.size.width-self.barInset*2, 0);
    CGFloat calculatedWidth =( _maximumValue - _minimumValue) !=0 ? ((CGFloat)(_progress - _minimumValue) / (_maximumValue - _minimumValue))  * maxWidth : 0;
    _trackViewWidthConstraint.constant = calculatedWidth;

    if (_isCornersRounded) {
        self.layer.cornerRadius = self.frame.size.height / 2;
        _trackView.layer.cornerRadius = _trackView.frame.size.height / 2;
    }
    self.layoutMargins = UIEdgeInsetsMake(_barInset, _barInset, _barInset, _barInset);
}


@end
