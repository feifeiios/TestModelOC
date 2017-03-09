//
//  TableViewController.m
//  TestModelOC
//
//  Created by Zzcz on 2017/2/10.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "Model.h"

@interface TableViewController ()
@property ( nonatomic , strong ) NSMutableArray * modelArray ;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _modelArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
    /*
     构造函数赋值
     一
     Model * model = [Model model:@{@"name":[NSString stringWithFormat:@"name%zd",i],@"job":(i%4 == 0 ? @"Teacher" : @"Student"),@"image":[NSString stringWithFormat:@"%d",i%4]}];
     [_modelArray addObject:model];
     二
     Model * model = [[Model alloc]initWithDict:@{@"name":[NSString stringWithFormat:@"name%zd",i],@"job":(i%4 == 0 ? @"Teacher" : @"Student"),@"image":[NSString stringWithFormat:@"%d",i%4]}];
     [_modelArray addObject:model];

     调用setValuesForKeysWithDictionary
     Model * model = [[Model alloc]init];
     [model setValuesForKeysWithDictionary:@{@"name":[NSString stringWithFormat:@"name%zd",i],@"job":(i%4 == 0 ? @"Teacher" : @"Student"),@"image":[NSString stringWithFormat:@"%d",i%4]}];
     [_modelArray addObject:model];
     */
        
        Model * model = [[Model alloc]init];
        [model setValuesForKeysWithDictionary:@{@"name":[NSString stringWithFormat:@"name%zd",i],@"job":(i%4 == 0 ? @"Teacher" : @"Student"),@"image":[NSString stringWithFormat:@"%d",i%4]}];
        [_modelArray addObject:model];

    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _modelArray == NULL ? 0 : _modelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    /*
     set方法赋值
     */
    cell.model = _modelArray[indexPath.row] ;
    /*
     调用函数赋值
     */
//    [cell cellForModel:_modelArray[indexPath.row]];
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
