//
//  ZR+CoreDataProperties.m
//  
//
//  Created by Kratos on 2022/11/24.
//
//

#import "ZR+CoreDataProperties.h"

@implementation ZR (CoreDataProperties)

+ (NSFetchRequest<ZR *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"ZR"];
}

@dynamic mingzi;
@dynamic norimagname;
@dynamic selected;
@dynamic selectedImagename;
@dynamic type_zuidashengming;
@dynamic type_shengming;
@dynamic zhandou_kaipai;

@end
