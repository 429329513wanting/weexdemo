//
//  WXCheckCardModel.m
//  WeexDemo
//
//  Created by ghwang on 2017/8/4.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "WXCheckCardModel.h"
#import "WXDemoViewController.h"
#import "ScanCardVC.h"

@implementation WXCheckCardModel
@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(openScan:callback:))
- (void)openScan:(NSString *)url callback:(WXModuleCallback)callback
{
    NSString *newURL = url;
    if ([url hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", url];
    } else if (![url hasPrefix:@"http"]) {
        newURL = [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    ScanCardVC *controller = [[ScanCardVC alloc] init];
    [[weexInstance.viewController navigationController] pushViewController:controller animated:YES];
    controller.scanSuccess = ^(NSString *result) {
        
        callback(@{@"result":result});

    };
    
}
@end
