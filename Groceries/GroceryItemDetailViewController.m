//
//  GroceryItemViewController.m
//  Groceries
//
//  Created by Kimberly Skipper on 11/12/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "GroceryItemDetailViewController.h"

@interface GroceryItemDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *aisleLabel;

@end

@implementation GroceryItemDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.groceryItem.name;
    self.categoryLabel.text = self.groceryItem.category;
    self.aisleLabel.text = [NSString stringWithFormat:@"Aisle %ld", (long)self.groceryItem.aisle];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

*/
@end
