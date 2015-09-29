//
//  PBDownloadEngine.h
//  MKDemo
//
//  Created by ares on 15/9/24.
//  Copyright © 2015年 AresPeng. All rights reserved.
//

#import "MKNetworkEngine.h"
/**
 PB下载下载引擎
  */
@interface PBDownloadEngine : MKNetworkEngine

//-(id)initDownloadWithHost:(NSString *)host;

/**
 *  下载文件到本地指定位置
 *
 *  @param url               下载地址
 *  @param dealHandler       下载处理操作
 *  @param completionHandler 完成
 *  @param errorHandler      失败
 *
 *  @return 一个 MKNetworkOperation 对象
 */
-(MKNetworkOperation *)downloadWithUrl:(NSString *)url
               downloadFileDealHandler:(void (^)(NSString *targetPath))dealHandler
                     completionHandler:(void (^)(MKNetworkOperation *))completionHandler
                          errorHandler:(void (^)(MKNetworkOperation *, NSError *))errorHandler;

@end
