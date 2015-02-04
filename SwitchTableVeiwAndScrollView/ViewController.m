//
//  ViewController.m
//  SwitchTableVeiwAndScrollView
//
//  Created by highcom on 15-1-12.
//  Copyright (c) 2015年 zhanglei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArr = [NSMutableArray array];
    
    [self.dataArr addObject:@"1"];
    [self.dataArr addObject:@"2"];
    [self.dataArr addObject:@"3"];
    [self.dataArr addObject:@"4"];
    [self.dataArr addObject:@"5"];
    [self.dataArr addObject:@"6"];
    [self.dataArr addObject:@"7"];
    [self.dataArr addObject:@"8"];
    [self.dataArr addObject:@"9"];
    [self.dataArr addObject:@"10"];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-40)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-40)];
    [self initialScrollView];
    
    self.btnSwitchT = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [self.btnSwitchT setTitle:@"table" forState:UIControlStateNormal];
    [self.btnSwitchT setBackgroundColor:[UIColor redColor]];
    [self.btnSwitchT addTarget:self action:@selector(showTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnSwitchT];
    
    
    self.btnSwitchS = [[UIButton alloc] initWithFrame:CGRectMake(210, 0, 100, 40)];
    [self.btnSwitchS setTitle:@"scroll" forState:UIControlStateNormal];
    [self.btnSwitchS setBackgroundColor:[UIColor redColor]];
    [self.btnSwitchS addTarget:self action:@selector(showScroll) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnSwitchS];
    
    self.curView = self.tableView;
    
}

-(void)showTable{
    if ([self.curView isKindOfClass:[UITableView class]]) {
        return;
    }else{
        [self.scrollView removeFromSuperview];
        [self.view addSubview:self.tableView];
        self.curView = self.tableView;
    }
}

-(void)showScroll{
    if ([self.curView isKindOfClass:[UITableView class]]) {
        [self.tableView removeFromSuperview];
        [self.view addSubview:self.scrollView];
        self.curView = self.scrollView;
    }else{
        
        return;
    }
}

-(void)initialScrollView{
    int count = 0;
    for (NSString * str in self.dataArr) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(count%2==0?0:[UIScreen mainScreen].bounds.size.width/2, count/2*100, [UIScreen mainScreen].bounds.size.width/2, 100)];
        UILabel * lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2, 100)];
        [lbl setText:str];
        [lbl setTextAlignment:NSTextAlignmentCenter];
        [view addSubview:lbl];
        [self.scrollView addSubview:view];
        count++;
    }
    [self.scrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, (count%2==0?count/2:count+1)*100)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- ScrollViewDelegate

#pragma mark -- UITableViewDelagate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

#pragma mark -- UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.dataArr objectAtIndex:indexPath.row];
    //config the cell
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArr count];
}

@end
