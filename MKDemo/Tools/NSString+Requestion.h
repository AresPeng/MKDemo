//
//  NSDictionary+Requestion.h
//  MKDemo
//
//  Created by ares on 15/9/23.
//  Copyright © 2015年 AresPeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Requestion)

-(NSString *)parametersFormat;
+(NSString *)formatParameters:(NSString *)params;
@end
