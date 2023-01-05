//
//  Boss+CoreDataProperties.m
//  
//
//  Created by Kratos on 2022/11/24.
//
//

#import "Boss+CoreDataProperties.h"

@implementation Boss (CoreDataProperties)

+ (NSFetchRequest<Boss *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Boss"];
}

@dynamic type_shengming;
@dynamic type_zuidashengming;
@dynamic zhandou_kaipai;

@end
