//
//  PBNetworkEngine.h
//  MKDemo
//
//  Created by ares on 15/9/23.
//  Copyright © 2015年 AresPeng. All rights reserved.
//

#import "MKNetworkEngine.h"

typedef void (^IDBlock)(id object);
//声明 请求完成block 类型
typedef void (^CompletionHandlerBlock)(MKNetworkOperation *operation);
//声明 请求错误block 类型
typedef void (^ErrorHandlerBlock)(MKNetworkOperation *errorOp, NSError* error);

@interface PBNetworkEngine : MKNetworkEngine
//默认配置一个主机
-(id) initWithDefaultSettings;
//服务器认证
-(void) serverTrustTest;
//客户端证书认证
-(void) clientCertTest;

//POST请求
/**
 *  POST请求数据
 *
 *  @param body              body
 *  @param parameters        参数表NSDictionary
 *  @param completionHandler 完成Block CompletionHandlerBlock
 *  @param errorHandler      失败Block  ErrorHandlerBlock
 */
-(void)postRequest:(NSString *)body
        parameters:(NSDictionary *)parameters
 completionHandler:(CompletionHandlerBlock)completionHandler
      errorHandler:(ErrorHandlerBlock)errorHandler;

//基础验证
-(void) basicAuthTest;

/**
 *  文摘认证，记录登录，根据urlCredentialPersistence
 *
 *  @param path                     body
 *  @param parameters               参数表
 *  @param httpMethod               请求方法POST 或者 GET
 *  @param username                 username
 *  @param password                 user password
 *  @param urlCredentialPersistence 文摘方式
 *  @param completionHandler        完成block
 *  @param errorHandler             失败block
 */
-(void) digestAuthWithPath:(NSString *)path
                parameters:(NSDictionary *)parameters
                httpMethod:(NSString *)httpMethod
                  username:(NSString *)username
                  password:(NSString *)password
     credentialPersistence:(NSURLCredentialPersistence)urlCredentialPersistence
         completionHandler:(CompletionHandlerBlock)completionHandler
              errorHandler:(ErrorHandlerBlock)errorHandler;

//从一个url下载文件并写到置顶位置
-(MKNetworkOperation*) downloadFatAssFileFrom:(NSString*) remoteURL toFile:(NSString*) filePath;
//上传图片
-(MKNetworkOperation*) uploadImageFromFile:(NSString*) file
                         completionHandler:(IDBlock) completionBlock
                              errorHandler:(MKNKErrorBlock) errorBlock;
@end
