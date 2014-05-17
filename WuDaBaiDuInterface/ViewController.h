//
//  ViewController.h
//  WuDaBaiDuInterface
//
//  Created by 杨超 on 14-5-13.
//  Copyright (c) 2014年 杨 超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface ViewController : UIViewController<ASIHTTPRequestDelegate>
@property (strong, nonatomic) IBOutlet UITextField *UIText_Pwd;
@property (strong, nonatomic) IBOutlet UITextField *UIText_User;

@end
