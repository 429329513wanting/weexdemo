//
//  ScanCardVC.m
//  WeexDemo
//
//  Created by ghwang on 2017/8/4.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "ScanCardVC.h"
#import <SDAutoLayout.h>

#define SCREEN_WIDTH           [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT          [UIScreen mainScreen].bounds.size.height
#define SCREEN_BOUNDS          [UIScreen mainScreen].bounds
#define VIEW_WIDTH             self.view.frame.size.width
#define VIEW_HEIGHT            self.view.frame.size.height

@interface ScanCardVC (){

    NSString *_qrResult;
    BOOL _isOn,_running;
}
@property(nonatomic,strong)UIView *navView;
@end

@implementation ScanCardVC

- (void)back{

    [self.navigationController popViewControllerAnimated:YES];
}
- (UIView *)navView{
    
    if (_navView == nil) {
        
        _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navView.backgroundColor = [UIColor blackColor];
        UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
        [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [back setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_navView addSubview:back];
        
        UILabel *titL = [UILabel new];
        titL.font = [UIFont systemFontOfSize:18];
        titL.text = self.title;
        titL.textColor = [UIColor whiteColor];
        [_navView addSubview:titL];
        titL.textAlignment = NSTextAlignmentCenter;
        
        back.sd_layout
        .leftSpaceToView(_navView,10)
        .heightIs(34).widthIs(34)
        .topSpaceToView(_navView,20+5);
        
        titL.sd_layout
        .widthIs(100).heightIs(34)
        .centerXEqualToView(_navView)
        .topSpaceToView(_navView,25);
        
        
    }
    
    return _navView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.navView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"确认信息";
    [self setupCamera];
}

- (void)setupCamera
{
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error = nil;
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:&error];
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"无法使用相机" message:@"请在iPhone的 设置-隐私-相机 中允许访问相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        alert.tag = 90908;
        [alert show];
        return;
    }
    
    if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
        
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"当前系统版本过低,请先升级系统" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
        return;
    }
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    //_output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    
    // 条码类型 AVMetadataObjectTypeQRCode
    //_output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    [_output setMetadataObjectTypes:[NSArray arrayWithObjects:AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeQRCode,AVMetadataObjectTypeDataMatrixCode, nil]];
    _output.rectOfInterest = CGRectMake(0.2f, 0.2f, 0.8f, 0.8f);
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame =CGRectMake(20,128,self.view.frame.size.width-40,250);
    [self.view.layer insertSublayer:self.preview atIndex:0];
    
    UIButton *loginBtn = [UIButton new];
    loginBtn.sd_cornerRadius = @(3);
    [loginBtn setTitle:@"支付宝支付" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [loginBtn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:loginBtn];
    
    loginBtn.sd_layout
    .heightIs(45)
    .leftSpaceToView(self.view, 10).rightSpaceToView(self.view, 10)
    .topSpaceToView(self.view,250+128+40);
    
    UIButton *loginBtn0 = [UIButton new];
    loginBtn0.sd_cornerRadius = @(3);
    [loginBtn0 setTitle:@"微信支付" forState:UIControlStateNormal];
    loginBtn0.titleLabel.font = [UIFont systemFontOfSize:16];
    [loginBtn0 setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:loginBtn0];
    
    loginBtn0.sd_layout
    .heightIs(45)
    .leftSpaceToView(self.view, 10).rightSpaceToView(self.view, 10)
    .topSpaceToView(loginBtn,20);
    
    [self startRunning];
    
    
    // Start
}
- (void)startRunning {
    if (_running)
        return;
    
    [_session startRunning];
    _output.metadataObjectTypes = _output.availableMetadataObjectTypes;
    _running = YES;
}

- (void)stopRunning {
    if (!_running) return;
    
    [_session stopRunning];
    _running = NO;
}
#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    [self stopRunning];
    [timer invalidate];
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    
    NSLog(@"%@",stringValue);
    _qrResult = stringValue;
    self.scanSuccess(_qrResult);

    
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self startRunning];
}

- (void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
