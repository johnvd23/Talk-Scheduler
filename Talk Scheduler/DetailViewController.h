//
//  DetailViewController.h
//  Talk Scheduler
//
//  Created by John Drews on 2/28/13.
//  Copyright (c) 2013 John Drews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
