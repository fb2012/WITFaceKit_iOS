//
//  WITFaceManager.h
//  WITFaceKit
//
//  Created by bing on 2022/7/28.
//

#import <Foundation/Foundation.h>
#import "WITRequestModel.h"
typedef  NS_ENUM(NSInteger ,WITEntryFaceType) {
    WITEntryFaceTypePush,
    WITEntryFaceTypePresent
};
typedef NS_ENUM(NSInteger, WITDevelopmentEnvironment) {
    WITDevelopmentEnvironmentTypeRelease,
    WITDevelopmentEnvironmentTypeTest,
    WITDevelopmentEnvironmentTypeDevelop
};
typedef void (^faceResult)(BOOL isExit,id _Nullable options);

NS_ASSUME_NONNULL_BEGIN
@interface WITFaceManager : NSObject


/// 实名认证入口 域名改变 暂时舍去不用
/// @param model 入口参数
/// @param type 进入类型
/// @param vc 进入的VC
/// @param environment 当前服务环境 默认是生产地址
/// @param result 返回流程结果，退出 1。。
+ (void)enterFaceManager:(WITRequestModel *)model type:(WITEntryFaceType)type ViewController:(UIViewController *)vc Environment:(WITDevelopmentEnvironment)environment result:(faceResult)result DEPRECATED_MSG_ATTRIBUTE("use enterFaceManager:type:ViewController: RequestURL: result: instead") ;


/// 实名认证入口
/// @param model model 入口参数
/// @param type type 进入类型
/// @param vc vc 进入的VC
/// @param url 请求URL地址。目前是用这个
/// @param result  返回流程结果，退出 1。。
+ (void)enterFaceManager:(WITRequestModel *)model type:(WITEntryFaceType)type ViewController:(UIViewController *)vc RequestURL:(NSString *)url result:(faceResult)result;
@end

NS_ASSUME_NONNULL_END
