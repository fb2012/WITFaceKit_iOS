# WITFaceKit

#### 介绍
WITFaceKit 的设计目的是用于车辆网实名认证

#### 安装教程

 通过cocospod 安装。具体操作见最后操作步骤
     在Podfile 中添加  
     ``` 
     pod 'WITFaceKit'
     ```
​     然后执行 
     ```
     pod install 
     ```
​     或 
     ```
     pod update
     ```

#### 如何使用

需要使用的地方   \#import <WITFaceKit/WITFaceManager.h>
WITFaceKit  入口方法：

`/// 实名认证入口`

`/// **@param** model model 入口参数`

`/// **@param** type type 进入类型`

`/// **@param** vc vc 进入的VC`

`/// **@param** url 请求URL地址。目前是用这个`

`/// **@param** result 返回流程结果，退出 1。。`

`\+ (**void**)enterFaceManager:(WITRequestModel *)model type:(WITEntryFaceType)type ViewController:(UIViewController *)vc RequestURL:(NSString *)url result:(faceResult)result;`

参数说明：

| 参数名   | 说明           | 是否必填                                                     |
| -------- | -------------- | ------------------------------------------------------------ |
| clientId | 平台分配应用Id | 是                                                           |
| secret   | 平台分配密钥   | 是                                                           |
| phone    | 手机号         | 是                                                           |
| userName | 用户昵称       | 否                                                           |
| url      | 入口url        | 是生产环境地址：https://sim-realname.tongxin.cn:20004/#/authentication/login<br/><br/>  //调试地址:https://wit-web-h5-dev.tongxin.cn/#/authentication/login |
|          |                |                                                              |

例如：

```
- (**IBAction**)submitDemo:(UIButton *)sender {

   

//  [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {

//  }];
  WITRequestModel *model = [[WITRequestModel alloc]init];

  model.clientId = _clientId.text;

  model.secret = _secret.text;

  model.phone = _phone.text;

  model.userName = _userName.text;

   

\#warning 实名认证入口 参数请保证有值。

\#warning 2.1 iOS14.3. 以下会跳至 safari 浏览器 

   

   //实名认证入口 参数请保证有值

  //url 目前是生产环境地址：https://sim-realname.tongxin.cn:20004/#/authentication/login

  //调试地址:https://wit-web-h5-dev.tongxin.cn/#/authentication/login

  NSString *devUrl = @"https://wit-web-h5-dev.tongxin.cn/#/authentication/login";

  [WITFaceManager enterFaceManager:model type:WITEntryFaceTypePresent ViewController:**self** RequestURL:devUrl result:^(**BOOL** isExit, **id** **_Nullable** options) {

​    // 回调，根据自己的业务自行处理;

​    NSLog(@"isExit = %d",isExit);

  }];

   

}
```

iOS 14.3 以下需要跳转到safari并在APP回调监控。[必须要回调，不然没有结果或者结果直接失败]

步骤、在AppDelegate 类，回调方法

```
 -(BOOL)application:(UIApplication *)app openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
#warning 此处是自己的clientid 【app68939512 只是demo中的例子】 只有14.3 以下的才走这个逻辑
    if ([url.absoluteString hasPrefix:@"app68939512://"] && [url.absoluteString containsString:@"faceRecogn"]) {
    //解析 url 字段
        UIViewController *root = [self currentViewController];//.rootViewController;
        if(root){
            [WITFaceManager ResultOfFaceManagerAbsoluteString:url.absoluteString ViewController:root type:WITEntryFaceTypePresent result:^(BOOL isExit, id  _Nullable options) {
                ;
            }];
           
        }

        
    }
    
    return YES;
}
```

Xcode 权限配置相机和照片访问：

参考：

```
Privacy - Photo Library Usage Description ：实名认证访问相册

Privacy - Camera Usage Description：实名认证访问相机
```



#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request

# WITFaceKit安装步骤

[![CI Status](https://img.shields.io/travis/fb2012/WITFaceKit.svg?style=flat)](https://travis-ci.org/fb2012/WITFaceKit)
[![Version](https://img.shields.io/cocoapods/v/WITFaceKit.svg?style=flat)](https://cocoapods.org/pods/WITFaceKit)
[![License](https://img.shields.io/cocoapods/l/WITFaceKit.svg?style=flat)](https://cocoapods.org/pods/WITFaceKit)
[![Platform](https://img.shields.io/cocoapods/p/WITFaceKit.svg?style=flat)](https://cocoapods.org/pods/WITFaceKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

WITFaceKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WITFaceKit'
```

## Author

fengbing, fenbing@tongxin.cn

## License

WITFaceKit is available under the MIT license. See the LICENSE file for more info.



