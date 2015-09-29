//
//  PBNetworkEngine.h
//  MKDemo
//

/*
    Created by ares on 15/9/23.
    Copyright © 2015年 AresPeng. All rights reserved.

    这是一个网络数据交互的类，使用了MKNetworkKit
 
 */

#import "MKNetworkEngine.h"

typedef void (^IDBlock)(id object);
//定义一个 请求完成block 类型
typedef void (^CompletionHandlerBlock)(MKNetworkOperation *operation);
//定义一个 请求错误block 类型
typedef void (^ErrorHandlerBlock)(MKNetworkOperation *errorOp, NSError* error);


/**
 PB网络交互引擎
 */
@interface PBNetworkEngine : MKNetworkEngine

/**
 *  默认配置一个主机名
 *
 *  @return 一个MKNetworkEngine对象
 */
-(id) initWithDefaultSettings;

/**
 *  服务端信任
 */
-(void) serverTrustTest;
/**
 *  客户端证书认证
 */
-(void) clientCertTest;

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
/**
 *  GET请求数据
 *
 *  @param body              路径
 *  @param parameters        参数表NSDictionary
 *  @param completionHandler 完成Block CompletionHandlerBlock
 *  @param errorHandler      失败Block  ErrorHandlerBlock
 */
-(void)getRequest:(NSString *)body
       parameters:(NSDictionary *)parameters
completionHandler:(CompletionHandlerBlock)completionHandler
     errorHandler:(ErrorHandlerBlock)errorHandler;

/**
 *  请求数据
 *
 *  @param body              路径
 *  @param parameters        参数表NSDictionary
 *  @param completionHandler 完成Block CompletionHandlerBlock
 *  @param errorHandler      失败Block  ErrorHandlerBlock
 */
-(void)request:(NSString *)body
    parameters:(NSDictionary *)parameters
    httpMethod:(NSString *)httpMethod
completionHandler:(CompletionHandlerBlock)completionHandler
  errorHandler:(ErrorHandlerBlock)errorHandler;

/**
 *  基本认证
 *
 *  @param path              路径
 *  @param parameters        参数列表
 *  @param httpMethod        请求方法
 *  @param username          用户名
 *  @param password          用户密码
 *  @param completionHandler 完成block
 *  @param errorHandler      失败block
 */
-(void) basicAuthAuthWithPath:(NSString *)path
                   parameters:(NSDictionary *)parameters
                   httpMethod:(NSString *)httpMethod
                     username:(NSString *)username
                     password:(NSString *)password
            completionHandler:(CompletionHandlerBlock)completionHandler
                 errorHandler:(ErrorHandlerBlock)errorHandler;

/**
 *  文摘认证，记录登录，根据urlCredentialPersistence
 *
 *  @param path                     路径
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

/**
 *  从一个url下载文件并写到指定位置
 *
 *  @param remoteURL 文件url
 *  @param filePath  目标路径
 *
 *  @return MKNetworkOperation对象
 */
-(MKNetworkOperation*) downloadFatAssFileFrom:(NSString*) remoteURL toFile:(NSString*) filePath;

/**
 *  上传图片
 *
 *  @param path            上传路径
 *  @param filePath        文件路径
 *  @param parameters      参数列表
 *  @param completionBlock 完成block
 *  @param errorBlock      失败block
 *
 *  @return MKNetworkOperation对象
 */
-(MKNetworkOperation*) uploadImageWithPath:(NSString *)path
                              fromFilePath:(NSString *) filePath
                                parameters:(NSDictionary *)parameters
                         completionHandler:(IDBlock) completionBlock
                              errorHandler:(MKNKErrorBlock) errorBlock;
@end
