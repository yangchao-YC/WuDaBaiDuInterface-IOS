//
//  ViewController.m
//  WuDaBaiDuInterface
//
//  Created by 杨超 on 14-5-13.
//  Copyright (c) 2014年 杨 超. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+HUD.h"
#import "AppDelegate.h"
@interface ViewController ()
@property(nonatomic,retain)NSDictionary *articles;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.UIText_Pwd setSecureTextEntry:YES];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btn:(UIButton *)sender
{
    NSString *loginname;
    NSString *loginpwd;
    
    loginname = [self.UIText_User.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    loginpwd = [self.UIText_Pwd.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if (loginname.length == 0 || loginpwd.length == 0 ) {
        UIAlertView * alert = [[UIAlertView alloc ]initWithTitle:@"提示" message:@"用户名或密码不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] ;
        [alert show];
    }
    else
    {
        [self showHUDInfo:@"正在登录"];
        NSString *date = [NSString stringWithFormat:@"http://121.199.29.181/demo/wush/whss/index/adminLogin?username=%@&password=%@",loginname,loginpwd];
        
        date = [date stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        NSURL *dateURL = [[NSURL alloc]initWithString:date];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:dateURL];
        [request setDelegate:self];
        [request startAsynchronous];
    }
   
    
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    [self removeHUDInfo];
    NSError *error;
    id rs = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&error];
    
    self.articles = rs;
    [self login];
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    [self removeHUDInfo];
    UIAlertView * alert = [[UIAlertView alloc ]initWithTitle:@"提示" message:@"链接失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] ;
    [alert show];
}





-(void)login
{
   // NSDictionary *dic =[self.articles objectAtIndex:0];
    
    if ([[self.articles  objectForKey:@"user_id"] isEqualToString:@""]) {
        UIAlertView * alert = [[UIAlertView alloc ]initWithTitle:@"提示" message:@"用户名或密码错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] ;
        [alert show];
    }
    else
    {
        AppDelegate *app = [[UIApplication sharedApplication]delegate];
        
        app.userLogin = [self.articles  objectForKey:@"user_id"];
        
        
        [self performSegueWithIdentifier:@"table" sender:nil];

    }
    
}



@end
