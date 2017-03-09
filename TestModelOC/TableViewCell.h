//
//  TableViewCell.h
//  TestModelOC
//
//  Created by Zzcz on 2017/2/10.
//  Copyright © 2017年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model ;
@interface TableViewCell : UITableViewCell

@property ( nonatomic , strong ) Model * model ;
- (void) cellForModel : (Model *) model ;
@end
