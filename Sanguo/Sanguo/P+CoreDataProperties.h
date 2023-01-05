//
//  P+CoreDataProperties.h
//  
//
//  Created by Kratos on 2022/11/24.
//
//

#import "P+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface P (CoreDataProperties)

+ (NSFetchRequest<P *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nonatomic) int16_t index;
@property (nonatomic) int16_t jinbi;
@property (nullable, nonatomic, copy) NSString *main_bgImageView;
@property (nullable, nonatomic, copy) NSString *main_headimagename;
@property (nullable, nonatomic, copy) NSString *mingzi;
@property (nonatomic) BOOL selected;
@property (nullable, nonatomic, copy) NSString *zhandou_bgimage;
@property (nullable, nonatomic, copy) NSString *zhandou_kaipai;

@end

NS_ASSUME_NONNULL_END
