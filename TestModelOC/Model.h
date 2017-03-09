//
//  Model.h
//  TestModelOC
//
//  Created by Zzcz on 2017/2/10.
//  Copyright © 2017年 fly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property ( nonatomic , copy ) NSString * name;
@property ( nonatomic , copy ) NSString * job;
@property ( nonatomic , copy ) NSString * image;


- (instancetype)initWithDict : (NSDictionary *) dict ;
+ (instancetype)model : (NSDictionary *) dict ;
@end
