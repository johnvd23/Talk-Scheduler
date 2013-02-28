//
//  MasterViewController.h
//  Talk Scheduler
//
//  Created by John Drews on 2/28/13.
//  Copyright (c) 2013 John Drews. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)insertOrgWithName:(NSString *)name address:(NSString *)address city:(NSString *)city state:(NSString *)state;
- (void)saveContext;
- (void)showTeamView;

@end
