//
//  OkViewController.m
//  武大接口问答
//
//  Created by 杨超 on 14-6-16.
//  Copyright (c) 2014年 杨 超. All rights reserved.
//

#import "OkViewController.h"

@interface OkViewController ()

@end

@implementation OkViewController

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
    self.Label_Title.text = [self.tableDate objectForKey:@"title"];
    self.Label_Content.text = [self.tableDate objectForKey:@"content"];
}



-(IBAction)okBtn:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
            
            [self performSegueWithIdentifier:@"okanswer" sender:self.tableDate];
            
            break;
        case 1:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        default:
            break;
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *destinationController = segue.destinationViewController;
    [destinationController setValue:sender forKey:@"tableDate"];
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
