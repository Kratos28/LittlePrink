//
//  Boss+CoreDataProperties.h
//  
//
//  Created by Kratos on 2022/11/24.
//
//

#import "Boss+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Boss (CoreDataProperties)

+ (NSFetchRequest<Boss *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nonatomic) int16_t type_shengming;
@property (nonatomic) int16_t type_zuidashengming;
@property (nullable, nonatomic, copy) NSString *zhandou_kaipai;

@end

NS_ASSUME_NONNULL_END
