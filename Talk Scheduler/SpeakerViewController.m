//
//  SpeakerViewController.m
//  Talk Scheduler
//
//  Created by John Drews on 3/1/13.
//  Copyright (c) 2013 John Drews. All rights reserved.
//

#import "SpeakerViewController.h"
#import "MasterViewController.h"
@interface SpeakerViewController ()

@end

@implementation SpeakerViewController
@synthesize firstName, lastName, email, org, speaker, masterController;

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
    if (speaker != nil) {
        firstName.text = [speaker valueForKey:@"firstName"];
        lastName.text = [speaker valueForKey:@"lastName"];
        email.text = [speaker valueForKey:@"email"];
    }
}
- (IBAction)confirmDelete:(id)sender
{
    if (speaker != nil) {
        UIActionSheet *confirm = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete Player" otherButtonTitles:nil];
        confirm.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        [confirm showInView:self.view];
        
    }
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0 && masterController != nil) {
        [masterController deleteSpeaker:speaker];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id)initWithMasterController:(MasterViewController *)aMasterController org:(NSManagedObject *)aOrg speaker:(NSManagedObject *)aSpeaker
{
    if ((self = [super init])) {
        self.masterController = aMasterController;
        self.org = aOrg;
        self.speaker = aSpeaker;
        
    }
}

- (IBAction)save:(id)sender
{
    if (masterController != nil) {
        if (speaker != nil) {
            [speaker setValue:firstName.text forKey:@"firstName"];
            [speaker setValue:lastName.text forKey:@"lastName"];
            [speaker setValue:email.text forKey:@"email"];
            [masterController saveContext];
        }
        else {
            [masterController insertSpeakerWithOrg:org firstName:firstName.text lastName:lastName.text email:email.text];
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
