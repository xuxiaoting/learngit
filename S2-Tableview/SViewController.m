//
//  SViewController.m
//  S2-Tableview
//
//  Created by dongdong on 14-8-2.
//  Copyright (c) 2014年 dongdong. All rights reserved.
//

#import "SViewController.h"
#import "Shop.h"
#import "CustomCell.h"

@interface SViewController (){
    UITableView *_tableView;
}

@property (nonatomic, retain) NSMutableArray *shopArray;

@end

@implementation SViewController

/////////////////////// 更改**************************
-(void)loadView{
    [super loadView];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView release];
    
    self.shopArray = [NSMutableArray array];
    
    Shop *shop1 = [Shop shopWithName:@"母婴" icon:@"001.png" desc:@"尿不湿"];
    Shop *shop2 = [Shop shopWithName:@"图书" icon:@"002.png" desc:@"小说"];
    Shop *shop3 = [Shop shopWithName:@"玩具" icon:@"003.png" desc:@"积木"];
    [_shopArray addObjectsFromArray:@[shop1, shop2, shop3]];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.s
}


#pragma mark 一共一组（不实现这个方法，默认就是一组）
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark 这一组里面有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _shopArray.count;
}

#pragma mark 返回indexPath这行里的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [_shopArray objectAtIndex:indexPath.row];
    static NSString *cellIdentifier = @"zuotuyouwen";
    
    CustomCell *cell = [[CustomCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cellIdentifier];
    
    Shop *shop = _shopArray[indexPath.row];
    cell.aa.text = shop.name;
//    cell.textLabel.text = shop.name;
//    cell.detailTextLabel.text = shop.desc;
//    cell.imageView.image = [UIImage imageNamed:shop.icon];
    
    return cell;
}

#pragma mark 返回indexPath这行cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

#pragma mark 选中了某一行的cell就会调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出所点击这一行的产品
    Shop *shop = _shopArray[indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"产品信息" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    // 设置文本框的默认样式
    [alert textFieldAtIndex:0].text = shop.name;
    [alert show];
    alert.tag = indexPath.row;
    
}

#pragma mark alertView的delegate方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) return;
    
    // 取出文本框文字
    NSString *text = [alertView textFieldAtIndex:0].text;
    // 修改对应位置的数据 tag = indexPath.row
    Shop *shop = _shopArray[alertView.tag];
    shop.name = text;
    // 局部刷新
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
    NSArray *paths = @[indexPath];
    [_tableView reloadRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationBottom];
    
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    self.shopArray = nil;
    [super dealloc];
}
@end
