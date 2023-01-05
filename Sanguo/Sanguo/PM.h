//
//  PM.h
//  Sanguo
//
//  Created by Kratos on 2022/11/21.
//

#import <Foundation/Foundation.h>
#import "P+CoreDataClass.h"
#import "CDM.h"
#import "Headr.h"
#import "Shop+CoreDataClass.h"
#import "SIgn+CoreDataClass.h"
#import "ZR+CoreDataClass.h"
#import "Boss+CoreDataClass.h"

#define nH(x) @(H(x))
#define nW(x) @(W(x))
#define save \
({\
CDM *app =  [CDM sharedInstance];\
[app saveContext];\
})\


#define appDelegate \
({\
CDM *app =  [CDM sharedInstance];\
(app);\
})\


#define CoreDatacontext \
({\
CDM *app =  [CDM sharedInstance];\
([app managedObjectContext]);\
})\


NS_ASSUME_NONNULL_BEGIN

@interface PM : NSObject
+ (NSArray *)setupP;
+ (P*)getP;
+ (NSArray *)getData:(NSString *)entityName;


@end


NS_ASSUME_NONNULL_END
int rand_num(int min, int max);

