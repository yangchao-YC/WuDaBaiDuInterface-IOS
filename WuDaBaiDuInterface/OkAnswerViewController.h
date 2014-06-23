//
//  OkAnswerViewController.h
//  武大接口问答
//
//  Created by 杨超 on 14-6-16.
//  Copyright (c) 2014年 杨 超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OkAnswerViewController : UIViewController

@property(strong,nonatomic)NSDictionary *tableDate;
@property (weak, nonatomic) IBOutlet UITextView *Text_Content;

@end
