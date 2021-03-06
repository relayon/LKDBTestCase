//
//  HYClass.h
//  LKDBHelperTestCase
//
//  Created by alekye on 16/9/22.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface HYClass : JSONModel

@property (assign, nonatomic) NSInteger cId;
@property (copy, nonatomic) NSString* cName;
@property (strong, nonatomic) NSDate* cDate;

+ (HYClass*)cls:(NSInteger)cid name:(NSString*)name date:(NSDate*)dt;

@end
