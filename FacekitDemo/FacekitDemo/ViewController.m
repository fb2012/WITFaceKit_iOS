//
//  ViewController.m
//  FacekitDemo
//
//  Created by bing on 2022/8/29.
//

#import "ViewController.h"
#import <WITFaceKit/WITFaceManager.h>
#import <Photos/PHPhotoLibrary.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}



- (IBAction)submitDemo:(UIButton *)sender {
    
//    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
//    }];

    
    WITRequestModel *model = [[WITRequestModel alloc]init];
    model.clientId = _clientId.text;
    model.secret = _secret.text;
    model.phone = _phone.text;
    model.userName = _userName.text;
    
#warning 实名认证入口 参数请保证有值。
#warning 2.1 iOS14..8 以下会跳至 safari 浏览器 参考集成文档2.1
    
      //实名认证入口 参数请保证有值
    //url 目前是生产环境地址：https://sim-realname.tongxin.cn:20004
    //调试地址:https://wit-web-h5-dev.tongxin.cn/#/authentication/login
    NSString *devUrl = @"https://wit-web-h5-dev.tongxin.cn/#/authentication/login";
    [WITFaceManager enterFaceManager:model type:WITEntryFaceTypePresent ViewController:self RequestURL:devUrl result:^(BOOL isExit, id  _Nullable options) {
        // 回调，根据自己的业务自行处理;
        NSLog(@"isExit = %d",isExit);
    }];
    
}
@end
