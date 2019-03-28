//
//  TableViewController.m
//  YiRefresh
//
//  Created by coderyi on 15/3/5.
//  Copyright (c) 2015年 coderyi. All rights reserved.
//

#import "TableViewController.h"
#import "YiRefreshHeader.h"
#import "YiRefreshFooter.h"
#import "TableViewModel.h"

#import "MytableView.h"

@interface TableViewController ()
{

    YiRefreshHeader *refreshHeader;
    YiRefreshFooter *refreshFooter;
    NSMutableArray *totalSource;
    TableViewModel *tableViewModel;
    MytableView *myT;
   
}

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }
    self.title=@"MVVM之 TableView 代理方法迁移";
    self.view.backgroundColor=[UIColor whiteColor];
    
    myT=[[MytableView alloc] initWithFrame:CGRectMake(0, 0, WScreen, HScreen-64) style:UITableViewStylePlain];
    [self.view addSubview:myT];
    tableViewModel=[[TableViewModel alloc] init];
    totalSource=0;
    
//    YiRefreshHeader  头部刷新按钮的使用
    refreshHeader=[[YiRefreshHeader alloc] init];
    refreshHeader.scrollView=myT;
    [refreshHeader header];
    __weak typeof(self) weakSelf = self;
    refreshHeader.beginRefreshingBlock=^(){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf headerRefreshAction];
    };
    
//    是否在进入该界面的时候就开始进入刷新状态
    [refreshHeader beginRefreshing];

//    YiRefreshFooter  底部刷新按钮的使用
    refreshFooter=[[YiRefreshFooter alloc] init];
    refreshFooter.scrollView=myT;
    [refreshFooter footer];
    
    refreshFooter.beginRefreshingBlock=^(){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf footerRefreshAction];
    };
    
}

- (void)headerRefreshAction
{
//   __weak typeof(self) weakSelf = self;
    [tableViewModel headerRefreshRequestWithCallback:^(NSArray *array){
        
        self->totalSource=(NSMutableArray *)array;
        self->myT.vc = self;
        self->myT.array = array;
        [self->refreshHeader endRefreshing];
        [self->myT reloadData];
    }];

}

- (void)footerRefreshAction
{
    [tableViewModel footerRefreshRequestWithCallback:^(NSArray *array){
        [totalSource addObjectsFromArray:array] ;
        myT.vc = self;
        myT.array = totalSource;
        [refreshFooter endRefreshing];
        [myT reloadData];
    
    }];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
