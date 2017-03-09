//
//  TableViewCell.m
//  TestModelOC
//
//  Created by Zzcz on 2017/2/10.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "TableViewCell.h"
#import "Model.h"

@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *job;

@end

@implementation TableViewCell
/*
 数据模型给cell赋值：
 常用方法两种：
 一
   使用set方法赋值，在.h文件中声明一个类型为Model的变量，在.m文件夹重写set方法，在set方法内部赋值
 二
   声明传参变量为Model的函数，调用赋值，直接传入Model的参数，在函数实现内部赋值
 */
- (void)setModel:(Model *)model {
    _model = model;
    _icon.image = [UIImage imageNamed:model.image];
    _name.text = model.name;
    _job.text = model.job ;
    
}
- (void)cellForModel:(Model *)model {
    _icon.image = [UIImage imageNamed:model.image];
    _name.text = model.name;
    _job.text = model.job ;
  
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
