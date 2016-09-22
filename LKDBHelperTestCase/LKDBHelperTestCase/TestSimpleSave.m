//
//  TestSimpleSave.m
//  LKDBHelperTestCase
//
//  Created by alekye on 16/9/22.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "TestSimpleSave.h"
#import <LKDBHelper.h>
#import "HYClass.h"

@implementation TestSimpleSave

/**
 简单保存一个班级对象
 */
+ (void)saveHYClass {
    HYClass* cls = [HYClass cls:10 name:@"2000-9" date:[NSDate date]];
    [cls saveToDB];
}

@end
