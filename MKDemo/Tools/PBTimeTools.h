//
//  PBTimeTools.h
//  MKDemo
//
//  Created by ares on 15/9/29.
//  Copyright © 2015年 AresPeng. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  对时间以及日期做一些操作的工具类
 */
@interface PBTimeTools : NSObject

/**
 *  按指定的时间规则显示
 *
 *  @param timeStamp 时间戳
 *
 *  @return 日期字符串描述
 */
+(NSString *)dateWithTimeStamp:(NSString *)timeStamp;
/**
 *  是否是今年
 *
 *  @param timeStamp 时间戳
 *
 *  @return BOOL值，如果为YES，则是今年，反之，则否
 */
+(BOOL)isThisYearWithTimeStamp:(NSString *)timeStamp;
/**
 *  获取今天的00:00:00
 *
 *  @return 今天00:00:00的NSDate对象
 */
+(NSDate *)getThisDay;

/**
 *  获取某一天的开始时间的日期
 *
 *  @param date 某一天的任意时间的NSDate对象
 *
 *  @return 某一天的开始时间的日期NSDate对象
 */
+(NSDate *)getSomeDayStartTime:(NSDate *)date;

@end
