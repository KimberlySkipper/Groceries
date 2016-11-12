//
//  GroceryItem.h
//  Groceries
//
//  Created by Kimberly Skipper on 11/9/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroceryItem : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *category;
@property (assign) NSInteger aisle;

+ (GroceryItem *)groceryItemWithDictionary:(NSDictionary *)groceryItemDictionary;

@end
