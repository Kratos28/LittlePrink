//
//  ZR+CoreDataProperties.h
//  
//
//  Created by Kratos on 2022/11/24.
//
//

#import "ZR+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZR (CoreDataProperties)

+ (NSFetchRequest<ZR *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *mingzi;
@property (nullable, nonatomic, copy) NSString *norimagname;
@property (nonatomic) BOOL selected;
@property (nullable, nonatomic, copy) NSString *selectedImagename;
@property (nonatomic) int16_t type_zuidashengming;
@property (nonatomic) int16_t type_shengming;
@property (nullable, nonatomic, copy) NSString *zhandou_kaipai;

@end

NS_ASSUME_NONNULL_END
