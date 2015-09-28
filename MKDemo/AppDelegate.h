//
//  AppDelegate.h
//  MKDemo
//
//  Created by ares on 15/9/23.
//  Copyright © 2015年 AresPeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBNetworkEngine.h"

#import "PBDownloadEngine.h"

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)


@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PBNetworkEngine *pbEngine;
@property (strong, nonatomic) PBDownloadEngine *downloadEngine;

@end

