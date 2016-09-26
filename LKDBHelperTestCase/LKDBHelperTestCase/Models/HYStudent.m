//
//  HYStudent.m
//  LKDBHelperTestCase
//
//  Created by alekye on 16/9/22.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "HYStudent.h"
#import "MJExtension.h"

@implementation HYStudent

+ (HYStudent*)student:(NSInteger)sid name:(NSString*)name cls:(HYClass*)cls {
    HYStudent* stu = [HYStudent new];
    
    stu.sId = sid;
    stu.sName = name;
    stu.sDate = [NSDate date];
    stu.sClass = cls;
    
    return stu;
}

// 重写此函数可指定保存的数据表名称
// 默认类名即为数据表名 － 不建议使用默认值
+ (NSString*)getTableName {
    //    return NSStringFromClass(self);
    return @"tbl_students";
}

// 指定主键
// 默认使用rowid作为主键
// rowid是sqlite3的默认主键，详情参考sqlite3文档
+ (NSString*)getPrimaryKey {
    return @"sId";
}

/* 转化过程中对字典的值进行过滤和进一步转化 */
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property {
    if ([property.name isEqualToString:@"sDate"]) {
        if (oldValue == nil) {
            return @"";
        }
    } else if (property.type.typeClass == [NSDate class]) {
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"yyyy-MM-dd hh-mm-ss";
        return [fmt dateFromString:oldValue];
    }
    return oldValue;
}

@end
