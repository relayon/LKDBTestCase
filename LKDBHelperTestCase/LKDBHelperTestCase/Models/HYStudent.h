//
//  HYStudent.h
//  LKDBHelperTestCase
//
//  Created by alekye on 16/9/22.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HYClass.h"

/**
 学生
 */
@interface HYStudent : NSObject

@property (assign, nonatomic) NSInteger sId;
@property (copy, nonatomic) NSString* sName;
@property (strong, nonatomic) NSDate* sDate;

@property (strong, nonatomic) HYClass* sClass;

+ (HYStudent*)student:(NSInteger)sid name:(NSString*)name cls:(HYClass*)cls;

@end
