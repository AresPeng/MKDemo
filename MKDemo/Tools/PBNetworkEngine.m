//
//  PBNetworkEngine.m
//  MKDemo
//
//  Created by ares on 15/9/23.
//  Copyright © 2015年 AresPeng. All rights reserved.
//

#import "PBNetworkEngine.h"
@implementation PBNetworkEngine

-(id) initWithDefaultSettings {
    
    if(self = [super initWithHostName:@"api.zintao.com" customHeaderFields:nil]) {
        
    }
    return self;
}



//POST请求
-(void)postRequest:(NSString *)body
        parameters:(NSDictionary *)parameters
 completionHandler:(CompletionHandlerBlock)completionHandler
      errorHandler:(ErrorHandlerBlock)errorHandler
{
    [self request:body parameters:parameters httpMethod:@"POST" completionHandler:completionHandler errorHandler:errorHandler];
}
//GET请求
-(void)getRequest:(NSString *)body parameters:(NSDictionary *)parameters completionHandler:(CompletionHandlerBlock)completionHandler errorHandler:(ErrorHandlerBlock)errorHandler
{
    [self request:body parameters:parameters httpMethod:@"GET" completionHandler:completionHandler errorHandler:errorHandler];
}

-(void)request:(NSString *)body
    parameters:(NSDictionary *)parameters
    httpMethod:(NSString *)httpMethod
completionHandler:(CompletionHandlerBlock)completionHandler
  errorHandler:(ErrorHandlerBlock)errorHandler
{
    MKNetworkOperation *operation = [self operationWithPath:body params:parameters httpMethod:httpMethod?httpMethod:@"GET" ssl:NO];
    [operation addCompletionHandler:completionHandler errorHandler:errorHandler];
    [self enqueueOperation:operation];
}

-(void) serverTrustTest {
    NSDictionary *params = @{@"t_user_id":@"30697",@"f_user_id":@"30697",@"page":@"0",@"page_size":@"15"};
    MKNetworkOperation *op = [self operationWithPath:@"/Social/HomePage/get_share" params:params httpMethod:@"POST" ssl:NO];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        DLog(@"%@", [operation responseString]);
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
        DLog(@"%@", [error localizedDescription]);
    }];
    [self enqueueOperation:op];
}

-(void) clientCertTest {
    
    MKNetworkOperation *op = [self operationWithPath:@"/" params:nil httpMethod:nil ssl:YES];
    op.clientCertificate = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"client.p12"];
    op.clientCertificatePassword = @"test";
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        DLog(@"%@", [operation responseString]);
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
        DLog(@"%@", [error localizedDescription]);
    }];
    [self enqueueOperation:op];
}

-(void) basicAuthAuthWithPath:(NSString *)path
                   parameters:(NSDictionary *)parameters
                   httpMethod:(NSString *)httpMethod
                     username:(NSString *)username
                     password:(NSString *)password
            completionHandler:(CompletionHandlerBlock)completionHandler
                 errorHandler:(ErrorHandlerBlock)errorHandler
{
    
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:parameters
                                          httpMethod:httpMethod
                              ];
    
    [op setUsername:username password:password];
    
    [op addCompletionHandler:completionHandler errorHandler:errorHandler];
    
    [self enqueueOperation:op];

}


//文摘认证，记录登录，根据urlCredentialPersistence
-(void) digestAuthWithPath:(NSString *)path
                parameters:(NSDictionary *)parameters
                httpMethod:(NSString *)httpMethod
                  username:(NSString *)username
                  password:(NSString *)password
     credentialPersistence:(NSURLCredentialPersistence)urlCredentialPersistence
         completionHandler:(CompletionHandlerBlock)completionHandler
              errorHandler:(ErrorHandlerBlock)errorHandler
{
    
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:parameters
                                          httpMethod:httpMethod
                              ];
    
    [op setUsername:username password:password];
    
    [op setCredentialPersistence:urlCredentialPersistence];
    
    [op addCompletionHandler:completionHandler errorHandler:errorHandler];
    
    [self enqueueOperation:op];
}

-(MKNetworkOperation*) downloadFatAssFileFrom:(NSString*) remoteURL toFile:(NSString*) filePath {
    
    MKNetworkOperation *op = [self operationWithURLString:remoteURL];
    
    [op addDownloadStream:[NSOutputStream outputStreamToFileAtPath:filePath
                                                            append:YES]];
    
    [self enqueueOperation:op];
    
    return op;
}

-(MKNetworkOperation*) uploadImageWithPath:(NSString *)path
                              fromFilePath:(NSString *) filePath
                                parameters:(NSDictionary *)parameters
                         completionHandler:(IDBlock) completionBlock
                              errorHandler:(MKNKErrorBlock) errorBlock
{
    
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:parameters
                                          httpMethod:@"POST"];
    
    [op addFile:filePath forKey:@"image"];
    
    // 设置 freezable，上传你的图片，连接后继续上传！
    [op setFreezable:YES];
    
    [op addCompletionHandler:^(MKNetworkOperation* completedOperation) {
        
        NSString *xmlString = [completedOperation responseString];
        
        DLog(@"%@", xmlString);
        completionBlock(xmlString);
    }
                errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
                    
                    errorBlock(error);
                }];
    
    [self enqueueOperation:op];
    
    
    return op;
}


@end
