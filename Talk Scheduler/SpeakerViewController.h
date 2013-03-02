//
//  SpeakerViewController.h
//  Talk Scheduler
//
//  Created by John Drews on 3/1/13.
//  Copyright (c) 2013 John Drews. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;

@interface SpeakerViewController : UIViewController <UIActionSheetDelegate>
{
    IBOutlet UITextField *firstName;
    IBOutlet UITextField *lastName;
    IBOutlet UITextField *email;
    NSManagedObject *org;
    NSManagedObject *speaker;
    MasterViewController *masterController;
}
@property (nonatomic, retain) UITextField *firstName;
@property (nonatomic, retain) UITextField *lastName;
@property (nonatomic, retain) UITextField *email;
@property (nonatomic, retain) NSManagedObject *org;
@property (nonatomic, retain) NSManagedObject *speaker;
@property (nonatomic, retain) MasterViewController *masterController;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)confirmDelete:(id)sender;
- (id)initWithMasterController:(MasterViewController *)aMasterController org:(NSManagedObject *)aOrg speaker:(NSManagedObject *)aSpeaker;

@end
