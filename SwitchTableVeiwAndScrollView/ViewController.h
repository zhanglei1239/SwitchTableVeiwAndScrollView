//
//  ViewController.h
//  SwitchTableVeiwAndScrollView
//
//  Created by highcom on 15-1-12.
//  Copyright (c) 2015年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic,retain) UITableView * tableView;
@property (nonatomic,retain) UIScrollView * scrollView;
@property (nonatomic,retain) UIButton * btnSwitchT;
@property (nonatomic,retain) UIButton * btnSwitchS;
@property (nonatomic,retain) UIView * curView;
@property (nonatomic,retain) NSMutableArray * dataArr;
@end

