//
//  Shop+CoreDataProperties.m
//  
//
//  Created by Kratos on 2022/11/22.
//
//

#import "Shop+CoreDataProperties.h"

@implementation Shop (CoreDataProperties)

+ (NSFetchRequest<Shop *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Shop"];
}

@dynamic bg_imageview;
@dynamic jinbi;

@end
