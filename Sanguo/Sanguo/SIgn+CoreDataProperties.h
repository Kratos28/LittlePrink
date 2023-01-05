//
//  SIgn+CoreDataProperties.h
//  
//
//  Created by Kratos on 2022/11/22.
//
//

#import "SIgn+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SIgn (CoreDataProperties)

+ (NSFetchRequest<SIgn *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *pic;
@property (nullable, nonatomic, copy) NSString *selectedpic;
@property (nonatomic) int16_t yuanbao;
@property (nonatomic) BOOL qiandao;
@property (nonatomic) int16_t day;
@property (nullable, nonatomic, copy) NSString *mingzi;

@end

NS_ASSUME_NONNULL_END
