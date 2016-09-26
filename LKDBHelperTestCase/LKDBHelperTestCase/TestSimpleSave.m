//
//  TestSimpleSave.m
//  LKDBHelperTestCase
//
//  Created by alekye on 16/9/22.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "TestSimpleSave.h"
#import "LKDBHelper.h"
#import "HYClass.h"

@implementation TestSimpleSave

+ (void)startTest {
    [[self class] saveHYClass];
    [[self class] saveHYClass];
    
    [[self class] isExist];
    [[self class] readHYClass];
    
    [[self class] updateHClass];
    [[self class] updateHClass];
    
    [[self class] deleteHYClass];
    [[self class] deleteHYClass];
}

/**
 简单保存一个班级对象
 
 saveToDB函数保存数据最终会在LKDBHelper.m文件中转换为"replace into"的SQL语句
 
 // 拼接insertSQL 语句  采用 replace 插入
 NSString* insertSQL = [NSString stringWithFormat:@"replace into %@(%@) values(%@)", db_tableName, insertKey, insertValuesString];
 
 所以，同相同主键的类对象可多次保存，不会出错。
 */
+ (void)saveHYClass {
    HYClass* cls = [HYClass cls:10 name:@"2000-9" date:[NSDate date]];
    [cls saveToDB];
    HYClass* cls1 = [HYClass cls:11 name:@"2000-9" date:[NSDate date]];
    [cls1 saveToDB];
}

/**
 判断数据是否存在
 
 NSMutableString* rowCountSql = [NSMutableString stringWithFormat:@"select count(rowid) from %@", tableName];
 通过查询的数量是否大于0判断数据是否存在
 */
+ (void)isExist {
    HYClass* cls = [HYClass cls:10 name:@"2000-9" date:[NSDate date]];
    [cls isExistsFromDB];
}


/**
 NSMutableString* updateSQL = [NSMutableString stringWithFormat:@"update %@ set %@ where ", db_tableName, updateKey];
 */
+ (void)updateHClass {
    HYClass* cls = [HYClass cls:10 name:@"2000-91" date:[NSDate date]];
    [cls updateToDB];
}

/**
 读取一个班级对象
 */
+ (void)readHYClass {
//    HYClass* cls = [HYClass cls:10 name:@"2000-9" date:[NSDate date]];
//    [cls search] // 没有此功能
    NSArray* result = [HYClass searchWithWhere:@{@"cId":@10}];
    NSLog(@"result = %@", result);
}
/**
 删除一个班级对象
 NSMutableString* deleteSQL = [NSMutableString stringWithFormat:@"delete from %@ where ", db_tableName];
 不是删除表中的所有数据
 NSString* pwhere = [self primaryKeyWhereSQLWithModel:model addPValues:parsArray];
 根据主键判断删除哪个数据
 在数据不存在的情况下调用不会出错
 */
+ (void)deleteHYClass {
    HYClass* cls = [HYClass cls:10 name:@"2000-9" date:[NSDate date]];
    [cls deleteToDB];
}

@end
