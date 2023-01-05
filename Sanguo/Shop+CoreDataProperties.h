//
//  Shop+CoreDataProperties.h
//  
//
//  Created by Kratos on 2022/11/22.
//
//

#import "Shop+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Shop (CoreDataProperties)

+ (NSFetchRequest<Shop *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *bg_imageview;
@property (nonatomic) int16_t jinbi;

@end

NS_ASSUME_NONNULL_END
