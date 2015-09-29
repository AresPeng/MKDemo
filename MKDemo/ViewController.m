//
//  ViewController.m
//  MKDemo
//
//  Created by ares on 15/9/23.
//  Copyright © 2015年 AresPeng. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Requestion.h"
#import "PBTimeTools.h"
@interface ViewController ()

@property (nonatomic,strong)    UIProgressView *downloadProgessBar;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [ApplicationDelegate.pbEngine serverTrustTest];
//    [ApplicationDelegate.pbEngine clientCertTest];
//    NSString *userId = @"30697";
//    NSDictionary *params = @{@"t_user_id":[NSString formatParameters:userId],@"f_user_id":@"30697",@"page":@"0",@"page_size":@"15"};
//    NSString *body = @"/Social/HomePage/get_share";
//    [ApplicationDelegate.pbEngine postRequest:body parameters:params completionHandler:^(MKNetworkOperation *operation) {
//         DLog(@"%@", [operation responseString]);
//        NSDictionary *result = [operation responseJSON];
//        NSLog(@"result:%@",result);
//    } errorHandler:^(MKNetworkOperation *errorOp, NSError *error) {
//         DLog(@"%@", [error localizedDescription]);
//    }];
    
    //1403841724 === 2014-06-27 12:02:04
    //1440684344 === 2015-08-27 22:05:44
    //1443495082 === 2015/9/29 10:51:22
    //1443449144 === 2015-09-28 22:05:44
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 180, 300, 21)];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.text = [PBTimeTools dateWithTimeStamp:@"1443456000"];
    [PBTimeTools isThisYearWithTimeStamp:@"1403841724"];
    [self.view addSubview:dateLabel];
    
    _downloadProgessBar = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    _downloadProgessBar.frame = CGRectMake(20, 128, 320, 20);
    _downloadProgessBar.progress = 0.0;
    [self.view addSubview:_downloadProgessBar];
    
    NSString *url = @"http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community-6.3.4-osx-x86_64.dmg";
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] init];
    MKNetworkOperation *op = [engine operationWithURLString:url];
    [op addDownloadStream:[NSOutputStream outputStreamToFileAtPath:[@"/Users/dengjianping/Documents" stringByAppendingPathComponent:url.lastPathComponent] append:YES]];
    [op onDownloadProgressChanged:^(double progress) {
        
//        DLog(@"%.2f", progress*100.0);
        self.downloadProgessBar.progress = progress;
    }];
    [engine enqueueOperation:op];

    __weak ViewController *weakSelf = self;
    [op addCompletionHandler:^(MKNetworkOperation* completedRequest) {
        
        DLog(@"%@", completedRequest);
        weakSelf.downloadProgessBar.progress = 1.0f;

        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Download Completed" message:@"The file is in your Caches directory" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alertVC dismissViewControllerAnimated:YES completion:^{
                
            }];
        }];
        [alertVC addAction:action];
        [self presentViewController:alertVC animated:YES completion:^{
            
        }];
    }
                errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
                    
                        DLog(@"%@", error);
                        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:error.localizedDescription message:error.localizedRecoverySuggestion preferredStyle:UIAlertControllerStyleAlert];
                        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            [alertVC dismissViewControllerAnimated:YES completion:^{
                                
                            }];
                        }];
                        [alertVC addAction:action];
                        [self presentViewController:alertVC animated:YES completion:^{
                            
                        }];

                    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
