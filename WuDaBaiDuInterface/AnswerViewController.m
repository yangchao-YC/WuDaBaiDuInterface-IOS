//
//  AnswerViewController.m
//  WuDaBaiDuInterface
//
//  Created by 杨超 on 14-5-13.
//  Copyright (c) 2014年 杨 超. All rights reserved.
//

#import "AnswerViewController.h"
#import "AppDelegate.h"
#import "UIViewController+HUD.h"
@interface AnswerViewController ()
@property(nonatomic,retain)NSMutableArray *articles;

@end

@implementation AnswerViewController

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
    
    
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    NSLog(@"%@",app.userLogin);
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleBlack];
    
    UIBarButtonItem *btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                             target:self
                                                                             action:nil];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"关闭"
                                                                  style:UIBarButtonItemStyleDone
                                                                 target:self
                                                                 action:@selector(dismissKeyBoard)];
    
    NSArray * buttonsArray = @[btnSpace, doneButton];;

    [topView setItems:buttonsArray];
    [self.UIText_answer setInputAccessoryView:topView];
    topView = nil;
}


-(IBAction)dismissKeyBoard
{
    [self.UIText_answer resignFirstResponder];//关闭键盘
}





-(IBAction)AnswerBtn:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
            [self pushDate];
            break;
        case 1:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        default:
            break;
    }
}

-(void)pushDate
{
    NSLog(@"push");
    NSString *answer ;
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    NSLog(@"%@",app.userLogin);
    NSString *userid = app.userLogin;
    NSString *questionid = app.questionid;
    answer = [self.UIText_answer.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if (answer.length == 0 ) {
        UIAlertView * alert = [[UIAlertView alloc ]initWithTitle:@"提示" message:@"答案不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] ;
        [alert show];
    }
    else
    {
        NSLog(@"else");
        [self showHUDInfo:@"正在提交答案"];
        NSString *date = [NSString stringWithFormat:@"http://121.199.29.181/demo/wush/whss/index/postAnswerFromMoblie?questionid=%@&answer=%@&doctorid=%@",questionid,answer,userid];
        
        date = [date stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        NSURL *dateURL = [[NSURL alloc]initWithString:date];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:dateURL];
        [request setDelegate:self];
        [request startAsynchronous];

    }

}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    
    NSError *error;
    id rs = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&error];
    
    self.articles = rs;
   [self removeHUDInfo];
    
    [self ok];
    
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    [self removeHUDInfo];
    UIAlertView * alert = [[UIAlertView alloc ]initWithTitle:@"提示" message:@"链接失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] ;
    [alert show];
}


-(void)ok
{
    UIAlertView * alert = [[UIAlertView alloc ]initWithTitle:@"提示" message:@"提交成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] ;
    [alert show];
    
   // [self performSegueWithIdentifier:@"table" sender:nil];
    
    
    [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:1] animated:YES];
    
    
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
