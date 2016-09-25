//
//  TestSimpleSave.h
//  LKDBHelperTestCase
//
//  Created by alekye on 16/9/22.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
    1，以下测试函数都是同步函数
    2，带block回调的函数是异步函数，需要注意数据间的同步
 */
@interface TestSimpleSave : NSObject

+ (void)startTest;

/**
 保存一个班级对象
 */
+ (void)saveHYClass;
/**
 判断数据是否存在
 */
+ (void)isExist;
+ (void)updateHClass;
/**
 读取一个班级对象
 */
+ (void)readHYClass;
/**
 删除一个班级对象
 */
+ (void)deleteHYClass;

@end
