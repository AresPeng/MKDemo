//
//  NSDictionary+Requestion.m
//  MKDemo
//
//  Created by ares on 15/9/23.
//  Copyright © 2015年 AresPeng. All rights reserved.
//

#import "NSString+Requestion.h"

@implementation NSString (Requestion)

-(NSString *)parametersFormat
{
    NSString *string = @"";
    if (self) {
        return self;
    }
    return string;
}

+(NSString *)formatParameters:(NSString *)params
{
    if (params) {
        return params;
    }
    return @"";
}

@end
