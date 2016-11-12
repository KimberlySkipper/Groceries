//
//  GroceriesTableViewController.m
//  Groceries
//
//  Created by Kimberly Skipper on 11/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "GroceriesTableViewController.h"
#import "GroceryItem.h"

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
//[NSData dataWithContentsOfFile:filePath] finds and loads contents of file
//

    - (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; //returns one section of cells (changed from 0 to 1)
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.groceries.count; // will run once for each section (counting begins with zero).  needs to mirror the number of groceries
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroceryCell" forIndexPath:indexPath];
    
    // Configure the cell...
    GroceryItem *anItem = self.groceries[indexPath.row];
    cell.textLabel.text = anItem.name;
    cell.detailTextLabel.text = anItem.category;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
