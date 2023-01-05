//
//  BGView.m
//  Sanguo
//
//  Created by Kratos on 2022/11/24.
//

#import "BGView.h"

@implementation BGView

- (void)layoutSubviews
{
    
    if (self.subview!=nil) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"kUpdateRemoveSubview" object:nil];
    }
}

- (void)willRemoveSubview:(UIView *)subview
{
    [super willRemoveSubview:subview];
    self.subview = subview;
}
@end
