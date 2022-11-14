//
//  Headr.h
//  Sanguo
//
//  Created by K on 2022/11/10.
//

#ifndef Headr_h
#define Headr_h
#define X(x) RpxX(x)
#define Y(y) RpxY(y)
#define W(w) RpxW(w)
#define H(h) RpxH(h)
#import <UIKit/UIKit.h>






#endif /* Headr_h */
static inline CGFloat RpxX(int defaultLength)
{
        double standardSize = 2048; //按照ipad12.9寸做标准 竖屏
//        CGFloat standardSize = 2732; //按照ipad12.9寸做标准 横屏
    double sss = (double)([UIScreen mainScreen].bounds.size.width) / standardSize;
    double  rpx =  (1.0 *  sss);
    
    return rpx * defaultLength;
}

static inline CGFloat RpxY(CGFloat defaultLength)
{
    
//    CGFloat standardSize = 2048; //按照ipad12.9寸做标准 竖屏
    CGFloat standardSize = 2732; //按照ipad12.9寸做标准 横屏
    double sss = (double)([UIScreen mainScreen].bounds.size.height) / standardSize;
    double  rpx =  (1.0 *  sss);
    
    return rpx * defaultLength;
}


static inline CGFloat RpxW(CGFloat defaultLength)
{
    return RpxX(defaultLength);
}

static inline CGFloat RpxH(CGFloat defaultLength)
{
    return RpxY(defaultLength);
}


