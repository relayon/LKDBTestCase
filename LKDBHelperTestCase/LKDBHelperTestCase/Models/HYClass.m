//
//  HYClass.m
//  LKDBHelperTestCase
//
//  Created by alekye on 16/9/22.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "HYClass.h"

/**
    班级
 */
@implementation HYClass
// 重写此函数，可指定存储的数据库
// 默认数据库文件在： 沙盒/Documents/LKDB.db
#if 0
+ (LKDBHelper*)getUsingLKDBHelper
{
    ///ios8 能获取系统类的属性了  所以没有办法判断属性数量来区分自定义类和系统类
    ///可能系统类的存取会不正确
    static LKDBHelper* helper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[LKDBHelper alloc] init];
    });
    return helper;
}
#endif

// 重写此函数可指定保存的数据表名称
// 默认类名即为数据表名 － 不建议使用默认值
+ (NSString*)getTableName {
//    return NSStringFromClass(self);
    return @"tbl_class";
}

// 指定主键
// 默认使用rowid作为主键
// rowid是sqlite3的默认主键，详情参考sqlite3文档
+ (NSString*)getPrimaryKey {
    return @"rowid";
}

// 指定联合主键
//+ (NSArray*)getPrimaryKeyUnionArray
//{
//    return nil;
//}



@end
