//
//  NSObject+Requestion.m
//  MKDemo
//
//  Created by ares on 15/9/24.
//  Copyright © 2015年 AresPeng. All rights reserved.
//

#import "NSObject+Requestion.h"

@implementation NSObject (Requestion)

+(id)formatRequestion:(id)object
{
    if (object) {
        return object;
    }
    return @"";
}

@end
