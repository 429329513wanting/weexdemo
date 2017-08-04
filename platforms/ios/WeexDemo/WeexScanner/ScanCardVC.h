//
//  ScanCardVC.h
//  WeexDemo
//
//  Created by ghwang on 2017/8/4.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ScanCardVC : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,AVCaptureMetadataOutputObjectsDelegate>{
    
    int num;
    BOOL upOrdown;
    NSTimer * timer;
}

@property(nonatomic,copy) void (^scanSuccess)(NSString *result);

@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;
@property (nonatomic, retain) UIImageView * line;

@end
