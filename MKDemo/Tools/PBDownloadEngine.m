//
//  PBDownloadEngine.m
//  MKDemo
//
//  Created by ares on 15/9/24.
//  Copyright © 2015年 AresPeng. All rights reserved.
//

#import "PBDownloadEngine.h"

@implementation PBDownloadEngine

//-(id)initDownloadWithHost:(NSString *)host
//{
//    if(self = [super initWithHostName:host customHeaderFields:nil]) {
//        
//    }
//    return self;
//}

-(MKNetworkOperation *)downloadWithUrl:(NSString *)url
               downloadFileDealHandler:(void (^)(NSString *targetPath))dealHandler
                     completionHandler:(void (^)(MKNetworkOperation *))completionHandler
                          errorHandler:(void (^)(MKNetworkOperation *, NSError *))errorHandler
{
    MKNetworkOperation *operation = [self operationWithURLString:url];
    
    [operation addDownloadStream:[NSOutputStream outputStreamToFileAtPath:@"/Users/dengjianping/Documents/QQ_V4.0.4.dmg"
                                                            append:YES]];
    [operation onDownloadProgressChanged:^(double progress) {
        
        DLog(@"%.2f", progress*100.0);
    }];
    
    [operation addCompletionHandler:completionHandler
                errorHandler:errorHandler];

    [self enqueueOperation:operation];
    return operation;
}


@end
