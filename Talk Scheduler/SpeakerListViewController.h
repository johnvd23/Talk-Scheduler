//
//  SpeakerListViewController.h
//  Talk Scheduler
//
//  Created by John Drews on 3/1/13.
//  Copyright (c) 2013 John Drews. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;

@interface SpeakerListViewController : UITableViewController {
    NSManagedObject *org;
    MasterViewController *masterViewController;
}
@property (nonatomic, retain) NSManagedObject *org;
@property (nonatomic, retain) MasterViewController *masterViewController;


- (id)initWithMasterViewController:(MasterViewController *)aMasterViewController org:(NSManagedObject *)aOrg;

- (void)showSpeakerView;
- (NSArray *)sortSpeakers;

@end
