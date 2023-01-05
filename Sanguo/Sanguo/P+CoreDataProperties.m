//
//  P+CoreDataProperties.m
//  
//
//  Created by Kratos on 2022/11/24.
//
//

#import "P+CoreDataProperties.h"

@implementation P (CoreDataProperties)

+ (NSFetchRequest<P *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"P"];
}

@dynamic index;
@dynamic jinbi;
@dynamic main_bgImageView;
@dynamic main_headimagename;
@dynamic mingzi;
@dynamic selected;
@dynamic zhandou_bgimage;
@dynamic zhandou_kaipai;

@end
