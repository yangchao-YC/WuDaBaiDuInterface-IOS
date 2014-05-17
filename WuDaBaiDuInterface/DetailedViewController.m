//
//  DetailedViewController.m
//  WuDaBaiDuInterface
//
//  Created by 杨超 on 14-5-13.
//  Copyright (c) 2014年 杨 超. All rights reserved.
//

#import "DetailedViewController.h"
#import "AppDelegate.h"
@interface DetailedViewController ()

@end

@implementation DetailedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.UIText_Content.editable = NO;
    
    NSLog(@"%@",[self.tableDate objectForKey:@"questionid"]);
    self.UILabel_Title.text = [self.tableDate objectForKey:@"title"];
    self.UIText_Content.text = [self.tableDate objectForKey:@"content"];
    
    
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    app.questionid = [self.tableDate objectForKey:@"questionid"];
}





-(IBAction)DetaileBtn:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
            
            break;
            
        case 1:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        default:
            break;
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
