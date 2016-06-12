//
//  LGPMainViewController.m
//  QQ好友列表Demo
//
//  Created by 李广鹏 on 16/6/12.
//  Copyright © 2016年 李广鹏. All rights reserved.
//

#import "LGPMainViewController.h"
#import "LGPSectionModel.h"
#import "LGPCellModel.h"
#import "LGPTableViewHeaderView.h"

@interface LGPMainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation LGPMainViewController

static NSString *const cellID = @"11";
static NSString *const headerID = @"22";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadTableView];
    
}
- (void)loadTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[LGPTableViewHeaderView class] forHeaderFooterViewReuseIdentifier:headerID];
}

#pragma mark - UITableViewDelegate & UITableViewDataSoure
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 取模型
    LGPSectionModel *sectionModel = self.dataArray[section];
    
    return sectionModel.isExpanded ? sectionModel.cellModels.count : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    LGPSectionModel *sectionModel = self.dataArray[indexPath.section];
    LGPCellModel *cellModel = sectionModel.cellModels[indexPath.row];
    cell.textLabel.text = cellModel.cellTitle;
    
    return cell;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LGPTableViewHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    
    headerView.sectionModel = self.dataArray[section];
    
    headerView.clickBlock = ^(BOOL isExpanded){
        
        //header 被点击
        //  刷新  QQ上的效果是 reloadData
//        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationNone];
        [tableView reloadData];
        
    };
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
// lazy dataArray 模拟数据
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
        for (int i = 0; i < 5; i ++) {
            LGPSectionModel *sectionModel = [[LGPSectionModel alloc] init];
            sectionModel.sectionTitle = @"分组";
            sectionModel.isExpanded = NO;
            for (int j = 0; j < 10; j ++) {
                LGPCellModel *cellModel = [[LGPCellModel alloc] init];
                cellModel.cellTitle = @"好友";
                [sectionModel.cellModels addObject:cellModel];
            }
            
            [self.dataArray addObject:sectionModel];
        }
        
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
