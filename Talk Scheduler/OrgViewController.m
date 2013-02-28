//
//  OrgViewController.m
//  Talk Scheduler
//
//  Created by John Drews on 2/28/13.
//  Copyright (c) 2013 John Drews. All rights reserved.
//

#import "OrgViewController.h"
#import "MasterViewController.h"


@implementation OrgViewController
@synthesize name, city, state, address, masterViewController, org;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (org != nil) {
        name.text = [org valueForKey:@"name"];
        address.text = [org valueForKey:@"address"];
        city.text = [org valueForKey:@"city"];
        state.text = [org valueForKey:@"state"];
    }
}
- (IBAction)save:(id)sender
{
    if (masterViewController != nil) {
        if (org != nil) {
            [org setValue:name.text forKey:@"name"];
            [org setValue:address.text forKey:@"address"];
            [org setValue:city.text forKey:@"city"];
            [org setValue:state.text forKey:@"state"];
            [masterViewController saveContext];
        }
        else {
            [masterViewController insertOrgWithName:name.text address:address.text city:city.text state:state.text];
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id)initWithMasterViewController:(MasterViewController *)aMasterViewController org:(NSManagedObject *)aOrg
{
    if ((self = [super init])) {
        self.masterViewController = aMasterViewController;
        self.org = aOrg;
    }
    return self;
}
@end
