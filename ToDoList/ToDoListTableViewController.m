//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by choushayne on 14/11/10.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;

@end

@implementation ToDoListTableViewController

//创建几个列表项目，并将它们添加到数组
- (void)loadInitialData {
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName = @"Buy milk";
    [self.toDoItems addObject:item1];
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.itemName = @"Buy eggs";
    [self.toDoItems addObject:item2];
    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.itemName = @"Read a book";
    [self.toDoItems addObject:item3];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
    //返回list
    AddToDoItemViewController *source = [segue sourceViewController];       //取回源视图控制器AddToDoItemViewController
    ToDoItem *item = source.toDoItem;       //取回控制器的待办事项
    if (item != nil) {
        [self.toDoItems addObject:item];    //如果项目存在，添加到 toDoItems 数组
        [self.tableView reloadData];        //重新载入表格中的数据
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];     //分配并初始化 toDoItems 数组
    [self loadInitialData];     //调用 loadInitialData
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    //数据源方法返回单个部分
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //数据源方法，使其返回正确的行数
    // Return the number of rows in the section.
    return [self.toDoItems count];
}
 



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ListPrototypeCell";     //@"ListPrototypeCell"保持与storyboard中标识符“Identifier”一致
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    self.tableView.tableFooterView = [[UIView alloc] init];     //隐藏没有内容的cell
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];       //单元格在选定后立即取消选定
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];    //在 toDoItems 数组中搜索相应的 ToDoItem
    tappedItem.completed = !tappedItem.completed;       //切换被轻按项目的完成状态
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];   //表格视图重新载入刚更新过数据的行
}

@end
