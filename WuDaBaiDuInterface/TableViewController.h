//
//  TableViewController.h
//  WuDaBaiDuInterface
//
//  Created by 杨超 on 14-5-13.
//  Copyright (c) 2014年 杨 超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
@interface TableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ASIHTTPRequestDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSString *key;
@end
