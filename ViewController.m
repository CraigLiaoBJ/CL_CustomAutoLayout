//
//  ViewController.m
//  CustomAutoLayout
//
//  Created by Craig Liao on 2017/3/5.
//  Copyright © 2017年 Craig Liao. All rights reserved.
//

#import "ViewController.h"
#import "AutoLayoutShowViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"使用Category方法实现自定义自动化布局";
    self.dataArray = [NSArray arrayWithObjects:@"同一控件内两子之控件之间的相对位置", @"填充式布局", @"相对父控件进行填充", @"同一控件内两子之控件之间的对齐关系", @"与父控件对齐的关系", @"与父控件的边距", @"控件在父控控件中的位置", @"与其他控件的大小关系", @"使views以Grid方式均匀显示",nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AutoLayoutShowViewController *showVC = [[AutoLayoutShowViewController alloc] init];
    showVC.indexChoosed = indexPath.row;
    showVC.titleName = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:showVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
