//
//  AppDelegate.m
//  FacekitDemo
//
//  Created by bing on 2022/8/29.
//

#import "AppDelegate.h"
#import <WITFaceKit/WITFaceManager.h>
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    if (@available(iOS 13.0, *))
        {
            // 在SceneDelegate里创建UIWindow
        }else{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            self.window.rootViewController = [storyBoard instantiateInitialViewController];
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
        }

    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}
- (BOOL)application:(UIApplication *)app openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
#warning 此处是自己的clientid 【app68939512 只是demo中的例子】 只有14.3 以下的才走这个逻辑
    if ([url.absoluteString hasPrefix:@"app68939512://"] && [url.absoluteString containsString:@"faceRecogn"]) {
    //解析 url 字段
    //并刷新 webview 的 url  【 】 自己处理业务处理
        UIViewController *root = [self currentViewController];//.rootViewController;
        if(root){
            [WITFaceManager ResultOfFaceManagerAbsoluteString:url.absoluteString ViewController:root type:WITEntryFaceTypePresent result:^(BOOL isExit, id  _Nullable options) {
                ;
            }];
//            [self performSelectorOnMainThread:@selector(viewVC:) withObject:url.absoluteString waitUntilDone:NO];
          //  [self performSelectorOnMainThread:@selector(login)withObject:nilwaitUntilDone:NO];

           
        }
        
        
        
//        NSURLComponents *components = [[NSURLComponents alloc] initWithString:url.absoluteString];
//        NSMutableDictionary *params = @{}.mutableCopy;
//        [components.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSURLQueryItem *item = (NSURLQueryItem *)obj;
//            [params setValue:item.value forKey:item.name];
//        }];
//
//        NSString *path = [NSString stringWithFormat:@"%@/#%@",@"https://wit-web-h5-dev.tongxin.cn",params[@"url"]];
//        [self jumpToWebViewWithUrl:path];
        
    }
    
    return YES;
}
- (UIViewController *)currentViewController
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *top = window.rootViewController;
    while (top.presentedViewController) {
        top = top.presentedViewController;
    }
    return top;
}


/*
- (void)viewVC:(NSString *)url{
    UIViewController * fromVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([fromVC isKindOfClass:[UINavigationController class]]) {

        return (SKBaseViewController *)[((SKBaseNavigationController *)fromVC) visibleViewController];

    } else if ([fromVC isKindOfClass:[SKTabBarController class]]) {

        return [((SKTabBarController *)fromVC) selectedViewController];

    } else {

        if (fromVC.presentedViewController) {

            return (SKBaseViewController *)fromVC.presentedViewController;

        } else {

            return (SKBaseViewController *)fromVC;

        }

    }
    
    
}*/
@end
