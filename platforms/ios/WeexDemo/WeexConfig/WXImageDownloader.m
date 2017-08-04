//
//  WXImageDownloader.m
//  WeexDemo
//
//  Created by ghwang on 2017/7/26.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "WXImageDownloader.h"
#import <SDWebImage/SDWebImageManager.h>
#import "WXXCassetsLoaderOperation.h"

@implementation WXImageDownloader

- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url
                                          imageFrame:(CGRect)imageFrame
                                            userInfo:(NSDictionary *)options
                                           completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock {
    
    
    if ([url hasPrefix:@"xcassets:"]) {
        
        NSArray *sss = [url componentsSeparatedByString:@":"];
        UIImage *image = [UIImage imageNamed:sss[1]];
        completedBlock(image,nil,YES);
        
        return [WXXCassetsLoaderOperation new];
        
        
    }
    
    return (id<WXImageOperationProtocol>)
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url]
                                                    options:0
                                                   progress:^(NSInteger receivedSize, NSInteger expectedSize)
     {
         
     } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL)
     {
         if (completedBlock) {
             completedBlock(image, error, finished);
         }
     }];
}
@end
