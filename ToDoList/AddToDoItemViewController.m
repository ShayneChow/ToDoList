//
//  AddToDoItemViewController.m
//  ToDoList
//
//  Created by choushayne on 14/11/10.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddToDoItemViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (sender != self.doneButton) return;      //如果未按下就不存储项目，而是让方法返回但不执行任何其他操作
    
    if (self.textField.text.length > 0) {       //查看文本栏中是否有文本
        self.toDoItem = [[ToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;       //确保完成状态被设定为“NOfalse”
    }       //如果没有文本，您就不需要存储项目，也不需要执行任何其他操作
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
