//
//  DetailedViewController.h
//  WuDaBaiDuInterface
//
//  Created by 杨超 on 14-5-13.
//  Copyright (c) 2014年 杨 超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedViewController : UIViewController<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *UIText_Content;
@property (weak, nonatomic) IBOutlet UILabel *UILabel_Title;
@property(strong,nonatomic)NSDictionary *tableDate;
@end
