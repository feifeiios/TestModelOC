# TestModelOC
浅谈ios数据模型使用（OC语言）
Ios中使用OC时，
模型赋值
 oc数据模型
 赋值方法常用的两种，
 一 
   在.h文件的接口中声明属性（.m中接口声明的属性类外部不可以访问），使用时对属性逐一赋值
 二
   在.h文件的接口中声明属性（.m中接口声明的属性类外部不可以访问），使用构造函数赋值，需要注意，构造函数声明需写在.h的接口中，这样类外部可以调用该函数
   构造函数有两种，类函数和类函数，它们区别在于调用时，类函数使用类名直接调用，函数需要构造类对象，才能调用
 在构造函数中，使用setValuesForKeysWithDictionary赋值
实例代码：
在Model.h中
#import <Foundation/Foundation.h>

@interface Model : NSObject
@property ( nonatomic , copy ) NSString * name;
@property ( nonatomic , copy ) NSString * job;
@property ( nonatomic , copy ) NSString * image;


- (instancetype)initWithDict : (NSDictionary *) dict ;
+ (instancetype)model : (NSDictionary *) dict ;
@end

在Model.m中
#import "Model.h"

@implementation Model

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)model:(NSDictionary *)dict {
   /*
    Model *m = [[super alloc]init];
    if (m) {
    [m setValuesForKeysWithDictionary:dict];
    }
    return m;
    */
    return [[super alloc]initWithDict:dict];
}


@end

调用代码实例：
    /*
     构造函数赋值
    一
     */
    Model * model0 = [Model model:@{@"name":@"lily",@"job":@"Teacher",@"image":@"icon"}];
    /*
     构造函数赋值
     二
     */
    Model * model = [[Model alloc]initWithDict:@{@"name":@"lily",@"job":@"Teacher",@"image":@"icon"}];
    
    /*
     调用setValuesForKeysWithDictionary
     */
    Model * model = [[Model alloc]init];
    [model setValuesForKeysWithDictionary:@{@"name":@"lily",@"job":@"Teacher",@"image":@"icon"}];
    


使用模型对象给View赋值
以TableViewCell为例
数据模型给cell赋值：
 常用方法两种：
 一
   使用set方法赋值，在.h文件中声明一个类型为Model的变量，在.m文件夹重写set方法，在set方法内部赋值
 二
   声明传参变量为Model的函数，调用赋值，直接传入Model的参数，在函数实现内部赋值
示例代码：
在TableViewCell.h中
#import <UIKit/UIKit.h>
@class Model ;
@interface TableViewCell : UITableViewCell

@property ( nonatomic , strong ) Model * model ;
- (void) cellForModel : (Model *) model ;
@end

在TableViewCell.m中
#import "TableViewCell.h"
#import "Model.h"

@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *job;

@end

@implementation TableViewCell

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
@end

调用代码示例：
    /*
     set方法赋值
     */
    cell.model = _modelArray[indexPath.row] ;
    /*
     调用函数赋值
     */
    [cell cellForModel:_modelArray[indexPath.row]];

