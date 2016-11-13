//
//  GroceriesTableViewController.m
//  Groceries
//
//  Created by Kimberly Skipper on 11/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "GroceriesTableViewController.h"
#import "GroceryItem.h"
#import "GroceryItemDetailViewController.h"

@interface GroceriesTableViewController ()

@property (nonatomic, strong) NSMutableArray *groceries;

@end


@implementation GroceriesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  /*
    GroceryItem *anItem = [GroceryItem groceryItemWithDictionary:@{@"name": @"Carrots", @"category": @"Produce", @"aisle": [NSNumber numberWithInt:6]}];
    self.groceries = @[anItem]; //an array
   */
    [self loadGroceries];
}
- (void)loadGroceries
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"groceries" ofType:@"json"];
        NSArray *groceriesJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]options:NSJSONReadingAllowFragments error:nil];
        self.groceries = [[NSMutableArray alloc] init];
        for (NSDictionary *aDictionary in groceriesJSON)
        {
            GroceryItem *anItem = [GroceryItem groceryItemWithDictionary:aDictionary];
            [self.groceries addObject:anItem];
            
        }
    }


    - (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; //returns one section of cells (changed from 0 to 1)
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groceries.count;
    // will run once for each section (counting begins with zero).  needs to mirror the number of groceries
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroceryCell" forIndexPath:indexPath];
    
    GroceryItem *anItem = self.groceries[indexPath.row];
    
    cell.textLabel.text = anItem.name;
    cell.detailTextLabel.text = anItem.category;
    
    return cell;
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"GroceryItemDetailSeque"])
    {
        GroceryItemDetailViewController *detailVC = [segue destinationViewController];
        
        UITableViewCell *selectedCell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
        GroceryItem *selectedGroceryItem = self.groceries [indexPath.row];
        detailVC.groceryItem = selectedGroceryItem;
    }
    
}


@end
