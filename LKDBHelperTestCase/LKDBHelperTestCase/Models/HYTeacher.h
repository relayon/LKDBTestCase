//
//  HYTeacher.h
//  LKDBHelperTestCase
//
//  Created by alekye on 16/9/22.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 老师
 */
@interface HYTeacher : NSObject

@property (assign, nonatomic) NSInteger tId;
@property (copy, nonatomic) NSString* tName;
@property (strong, nonatomic) NSDate* tDate;

@end
