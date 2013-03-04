//
//  SpeakerListViewController.m
//  Talk Scheduler
//
//  Created by John Drews on 3/1/13.
//  Copyright (c) 2013 John Drews. All rights reserved.
//

#import "SpeakerListViewController.h"
#import "MasterViewController.h"
#import "SpeakerViewController.h"
@interface SpeakerListViewController ()

@end

@implementation SpeakerListViewController

@synthesize org, masterViewController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Speakers";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showSpeakerView)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
}

- (id)initWithMasterViewController:(MasterViewController *)aMasterViewController org:(NSManagedObject *)aOrg
{
    if (( self = [super init])) {
        self.masterViewController = aMasterViewController;
        self.org = aOrg;
    }
    return self;
}

- (void)showSpeakerView
{
    SpeakerViewController *speakerViewController = [[SpeakerViewController alloc] initWithMasterController:masterViewController org:org speaker:nil];
    
    [self presentViewController:speakerViewController animated:YES completion:nil];
}
- (NSArray *)sortSpeakers
{
    NSSortDescriptor *sortLastNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortLastNameDescriptor, nil];
    return [[(NSSet *)[org valueForKey:@"speakers"] allObjects] sortedArrayUsingDescriptors:sortDescriptors];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSSet *speakersSet = [org valueForKey:@"speakers"];
    
    return [speakersSet count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SpeakerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSManagedObject *speaker = [[self sortSpeakers] objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [[speaker valueForKey:@"firstName"] description], [[speaker valueForKey:@"lastName"] description]];
    
    cell.detailTextLabel.text = [[speaker valueForKey:@"email"] description];
    
    return cell;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *speaker = [[self sortSpeakers] objectAtIndex:indexPath.row];
    SpeakerViewController *speakerViewController = [[SpeakerViewController alloc] initWithMasterController:masterViewController org:org speaker:speaker];
    [self presentViewController:speakerViewController animated:YES completion:nil];
}

@end
