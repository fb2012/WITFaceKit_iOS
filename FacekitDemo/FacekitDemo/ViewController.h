//
//  ViewController.h
//  FacekitDemo
//
//  Created by bing on 2022/8/29.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/**
 */
@property(weak,nonatomic)IBOutlet UITextField *clientId;
@property(weak,nonatomic)IBOutlet UITextField *secret;
@property(weak,nonatomic)IBOutlet UITextField *phone;
@property(weak,nonatomic)IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UIButton *RealNameSubmit;
- (IBAction)submitDemo:(UIButton *)sender;

@end

