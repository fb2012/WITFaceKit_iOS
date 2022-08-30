//
//  WITRequestModel.h
//  WITFaceKit
//
//  Created by bing on 2022/7/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WITRequestModel : NSObject

/// 平台分配应用Id
@property (nonatomic, copy) NSString *clientId;

/// 平台分配密钥
@property (nonatomic, copy) NSString *secret;

/// 手机号
@property (nonatomic, copy) NSString *phone;

/// 用户昵称
@property (nonatomic, copy,nullable) NSString *userName;
@end

NS_ASSUME_NONNULL_END
