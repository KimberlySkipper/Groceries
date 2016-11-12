//
//  GroceryItem.m
//  Groceries
//
//  Created by Kimberly Skipper on 11/9/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "GroceryItem.h"

@implementation GroceryItem

+ (GroceryItem *)groceryItemWithDictionary:(NSDictionary *)groceryItemDictionary  // declare a method 
{
    GroceryItem *anItem = nil;
    if (groceryItemDictionary)
    {
        anItem = [[GroceryItem alloc] init];  //alloc is making space of the item we are calling.  initialized the item and park it in the space
        anItem.name = groceryItemDictionary[@"name"];
        anItem.category =groceryItemDictionary [@"category"];
        anItem.aisle = [groceryItemDictionary[@"aisle"] integerValue];
    }
    
    return anItem;
}

@end
