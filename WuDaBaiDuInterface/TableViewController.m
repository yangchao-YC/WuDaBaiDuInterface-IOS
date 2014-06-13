//
//  TableViewController.m
//  WuDaBaiDuInterface
//
//  Created by 杨超 on 14-5-13.
//  Copyright (c) 2014年 杨 超. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "UIViewController+HUD.h"
#import "ViewController.h"
@interface TableViewController ()



@property(nonatomic,retain)NSMutableArray *articles;
@property(nonatomic,retain)NSMutableArray *date;
@property(nonatomic,strong)ASIHTTPRequest *request;

@end

@implementation TableViewController

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
    self.tableView.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view.
    self.tableView.bounces = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;//取出头部20个空白
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg.png"]];
    
    
    
    self.date = [[NSMutableArray alloc]init];
    [self dateURLTable];
}


-(void)dateURLTable
{
    [self showHUDInfo:@"正在加载数据"];
    NSString *date = @"http://121.199.29.181/demo/wush/whss/index/getQuestionList";
    NSURL *dateURL = [[NSURL alloc]initWithString:date];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:dateURL];
    [request setDelegate:self];
    [request startAsynchronous];
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    
    NSError *error;
    id rs = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&error];
    
    self.articles = rs;
    [self removeHUDInfo];
    [self noDate];
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    [self removeHUDInfo];
    UIAlertView * alert = [[UIAlertView alloc ]initWithTitle:@"提示" message:@"链接失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] ;
    [alert show];
}

//未回答问题
-(void)noDate
{

    for (int i = 0; i<self.articles.count; i++) {
        NSDictionary *dic = [self.articles objectAtIndex:i];
        NSString *status = [NSString stringWithFormat:@"%@",[dic objectForKey:@"status"]];
        if ([status isEqualToString:@"0"]) {
            [self.date addObject:dic];
        }
    }
    [self.tableView reloadData];
    
    
}
//以回答问题
-(void)okDate
{

    for (int i = 0; i<self.articles.count; i++) {
        NSDictionary *dic = [self.articles objectAtIndex:i];
        NSString *status = [NSString stringWithFormat:@"%@",[dic objectForKey:@"status"]];
        if ([status isEqualToString:@"1"]) {
            [self.date addObject:dic];
        }
    }
    
    [self.tableView reloadData];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *cellID = @"TableViewCell";
    
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//去除点击高亮显示
    
    NSDictionary *dic = [self.date objectAtIndex:indexPath.row];
    
    TableViewCell *table =(TableViewCell *)cell;
    table.UILabel_Title.text = [dic objectForKey:@"title"];
   // table.UILabel_Content.text = [dic objectForKey:@"content"];

    return cell;
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.date.count;//设置显示行数
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;//设置为只有一个模块
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 81;
}//设置模块内cell的高度



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    UIAlertView * alert = [[UIAlertView alloc ]initWithTitle:@"提示" message:[NSString stringWithFormat:@"%li",indexPath.row] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
    [alert show];
    */
    NSDictionary *dic = [self.date objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"Detailed" sender:dic];
    
    
}


-(IBAction)TableBtn:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    

    
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



@end
