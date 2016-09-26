//
//  TestOneToOne.m
//  LKDBHelperTestCase
//
//  Created by SMC-MAC on 16/9/26.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "TestOneToOne.h"
#import "HYStudent.h"
#import "LKDBHelper.h"
#import "MJExtension.h"
#import "JSONModel.h"

/**
 测试一对一用例
 一个学生对应一个班级
 */
@implementation TestOneToOne
+ (void)start {
//    NSDateFormatter* fmt = [NSDateFormatter new];
//    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
//    NSDate* dt = [fmt dateFromString:@"2016-09-26 15:01:24"];
//    NSLog(@"dt = %@", dt);
//    NSDate* dd = [LKDBUtils dateWithString:@"2016-09-26 15:01:24"];
//    NSLog(@"dd = %@", dd);
    
    [[self class] update];
    
    [[self class] save];
    [[self class] save];
    
    [[self class] save2];
    
    [[self class] update];
    [[self class] update];
    
    [[self class] search];
    [[self class] search];
    
    [[self class] remove];
    [[self class] remove];
}

/**
 经测试验证
 新增/更新 HYStudent对象，会新增/更新对应的 HYClass对象
 */
+ (void)save {
    HYClass* cls = [HYClass cls:9 name:@"2009" date:[NSDate date]];
    HYStudent* st = [HYStudent student:13 name:@"alekye" cls:cls];
    BOOL status = [st saveToDB];
    NSLog(@"%s", __FUNCTION__);
}

+ (void)save2 {
    HYClass* cls = [HYClass cls:9 name:@"2009" date:[NSDate date]];
    HYStudent* st = [HYStudent student:14 name:@"alekye2" cls:cls];
    BOOL status = [st saveToDB];
    NSLog(@"%s", __FUNCTION__);
}

/**
 LKDBHelper框架进行了封装，
 如果数据存在就更新，没有则保存。
 so，可直接调用update进行数据更新
 */
+ (void)update {
    HYClass* cls = [HYClass cls:9 name:@"2009" date:[NSDate date]];
    NSString* txt = [cls toJSONString];
    
    HYStudent* st = [HYStudent student:13 name:@"alekyexx" cls:cls];
//    id sdt = [st valueForKey:@"sDate"];
//    NSMutableDictionary* tDic = st.mj_keyValues;
//    NSString* jsonString = st.mj_JSONString;
    BOOL status = [st updateToDB];
    NSLog(@"%s", __FUNCTION__);
}

+ (void)search {
    NSMutableArray* mary = [HYStudent searchWithWhere:@{@"sId":@13}];
    if (mary.count > 0) {
        HYStudent* st = mary.firstObject;
        
//        id sdt = [st valueForKey:@"sDate"];
        NSMutableDictionary* tDic = st.mj_keyValues;
        NSLog(@"sDate = %@", st.sDate);
//        NSString* jsonString = st.mj_JSONString;
        NSLog(@"%s - %@", __FUNCTION__, tDic);
    }
    NSLog(@"%s", __FUNCTION__);
}


+ (void)remove {
    // 删除一条不存在的数据，不会报错
    HYStudent* sn = [HYStudent student:141 name:@"alekye243214321" cls:nil];
    BOOL status = [sn deleteToDB]; // YES
    
    // 删除一条正常存在的数据，包含对应的数据模型,
    // 删除班级，实际删除学生数据的时候，只删除了学生，不会删除对应的班级
    HYClass* cls = [HYClass cls:9 name:@"2009" date:[NSDate date]];
    HYStudent* st = [HYStudent student:13 name:@"alekye" cls:cls];
    [st deleteToDB];
    
    // 删除一条只有主键的数据
    HYStudent* st2 = [HYStudent student:14 name:nil cls:nil];
    [st2 deleteToDB];
    NSLog(@"%s", __FUNCTION__);
}

@end
