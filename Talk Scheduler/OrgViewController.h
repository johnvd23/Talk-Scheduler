//
//  OrgViewController.h
//  Talk Scheduler
//
//  Created by John Drews on 2/28/13.
//  Copyright (c) 2013 John Drews. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;

@interface OrgViewController : UIViewController {
    IBOutlet UITextField *name;
    IBOutlet UITextField *address;
    IBOutlet UITextField *city;
    IBOutlet UITextField *state;
    NSManagedObject *org;
    MasterViewController *masterViewController;
}

@property (nonatomic, retain) UITextField *name;
@property (nonatomic, retain) UITextField *address;
@property (nonatomic, retain) UITextField *city;
@property (nonatomic, retain) UITextField *state;
@property (nonatomic, retain) NSManagedObject *org;
@property (nonatomic, retain) MasterViewController *masterViewController;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
- (id)initWithMasterViewController:(MasterViewController *)aMasterViewController org:(NSManagedObject *)aOrg;

@end
