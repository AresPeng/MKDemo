//
//  PBTimeTools.m
//  MKDemo
//
//  Created by ares on 15/9/29.
//  Copyright © 2015年 AresPeng. All rights reserved.
//

#import "PBTimeTools.h"

@implementation PBTimeTools

//时间显示规则：
//当天，昨天，前天分别显示为：X天+当前时间：
//例：今天 09：48.
//超过前天时间范围：月-日-时-分。
//例：06-09 18：52（当年6月9日的18:52）
//超过本年（例如2014年6月21 ）显示为：2014.06.21

//从时间戳，发挥如上格式的显示规则
+(NSString *)dateWithTimeStamp:(NSString *)timeStamp
{
    NSString *timeStr = nil;
    

    
    if ([[self class] isThisYearWithTimeStamp:timeStamp]) {
        //今年
        NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:timeStamp.doubleValue];
        NSTimeInterval time = [nowDate timeIntervalSinceDate:[[self class] getThisDay]];
        NSLog(@"time:%f",time);
        if ((time < 0 && ABS(time) <= 3600 * 24 * 2) || (time >=  0 && time < 3600 * 24)) {
            //今天昨天前天
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"HH:mm:ss"];
            NSDate *dd = [NSDate dateWithTimeIntervalSince1970:timeStamp.doubleValue];
            NSString *string = [formatter stringFromDate:dd];
            if (time >= 0) {
                //今天
                timeStr = [NSString stringWithFormat:@"今天 %@",string];
            }else if( ABS(time) < 3600 * 24){
                timeStr = [NSString stringWithFormat:@"昨天 %@",string];
            }else if( ABS(time) < 3600 * 24 * 2){
                timeStr = [NSString stringWithFormat:@"前天 %@",string];
            }
        }else{
            //三天前
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"MM.dd HH:mm"];
            NSDate *dd = [NSDate dateWithTimeIntervalSince1970:timeStamp.doubleValue];
            timeStr = [formatter stringFromDate:dd];
        }
    }else{
        //今年之前
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDateFormat:@"yyyy.MM.dd HH:mm"];
        NSDate *dd = [NSDate dateWithTimeIntervalSince1970:timeStamp.doubleValue];
        timeStr = [formatter stringFromDate:dd];
    }

    return timeStr;
}

+(BOOL)isThisYearWithTimeStamp:(NSString *)timeStamp
{
    NSString *timeStr = nil;
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy"];

    NSDate *dd = [NSDate dateWithTimeIntervalSince1970:timeStamp.doubleValue];
    NSDate *now = [NSDate date];
    NSString *nowStr = [formatter stringFromDate:now];
    timeStr = [formatter stringFromDate:dd];
    NSLog(@"timeStr:%@ nowStr:%@",timeStr,nowStr);
    if ([nowStr isEqualToString:timeStr]) {
        return YES;
    }
    return NO;
}

+(NSDate *)getThisDay
{
    NSDate *now = [NSDate date];
    
    return [[self class] getSomeDayStartTime:now];
}

+(NSDate *)getSomeDayStartTime:(NSDate *)date
{
    NSDate *someDayStart = nil;
    NSString *someDayStr = nil;
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"yyyy:MM:dd"];
    
    someDayStr = [formatter stringFromDate:date];
    
    someDayStart = [formatter dateFromString:someDayStr];
    
    return someDayStart;

}

@end
