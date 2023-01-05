//
//  SIgn+CoreDataProperties.m
//  
//
//  Created by Kratos on 2022/11/22.
//
//

#import "SIgn+CoreDataProperties.h"

@implementation SIgn (CoreDataProperties)

+ (NSFetchRequest<SIgn *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"SIgn"];
}

@dynamic pic;
@dynamic selectedpic;
@dynamic yuanbao;
@dynamic qiandao;
@dynamic day;
@dynamic mingzi;

@end
