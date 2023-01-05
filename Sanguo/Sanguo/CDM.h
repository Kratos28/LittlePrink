//
//  CDM.h
//  Sanguo
//
//  Created by Kratos on 2022/11/21.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDM : NSObject


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
+ (instancetype)sharedInstance;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END
