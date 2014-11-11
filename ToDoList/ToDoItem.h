//
//  ToDoItem.h
//  ToDoList
//
//  Created by choushayne on 14/11/11.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
