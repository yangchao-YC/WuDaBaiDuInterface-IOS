//
//  OkAnswerViewController.m
//  武大接口问答
//
//  Created by 杨超 on 14-6-16.
//  Copyright (c) 2014年 杨 超. All rights reserved.
//

#import "OkAnswerViewController.h"

@interface OkAnswerViewController ()

@end

@implementation OkAnswerViewController

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
    self.Text_Content.text = [self.tableDate objectForKey:@"answer"];
    
}

-(IBAction)okAnswerBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
