//
//  DiscoverVC.m
//  Togou界面
//
//  Created by hj on 16/9/12.
//  Copyright © 2016年 TL. All rights reserved.
//

#import "DiscoverVC.h"
#import "DisCoverModel.h"
#import "DisCoverCell.h"
#import "TopLestModel.h"
#import "topCell.h"
#import "DiscovreJumpVC.h"
#import "TowDiscoveVC.h"
@interface DiscoverVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) NSMutableArray *dataSoucer;
@property (nonatomic,strong) NSMutableArray *TopDataSoucer;
@end

@implementation DiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  self.automaticallyAdjustsScrollViewInsets = NO;
    [self downLoadData];
    [self CreatUI];
    //获取通知！
}
- (NSMutableArray *)TopDataSoucer{

    if (_TopDataSoucer == nil) {
        _TopDataSoucer = [NSMutableArray array];
    }
    return _TopDataSoucer;

}
-(NSMutableArray *)dataSoucer{
    if (_dataSoucer==nil) {
        _dataSoucer = [NSMutableArray array];
    }
    return _dataSoucer;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.hidesBarsOnSwipe = NO;
    UIColor *color = [UIColor whiteColor];
    UIColor *blockcolor = [UIColor blackColor];
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                [RKDropdownAlert title:@"网络异常" message:@"请检查你的网络" backgroundColor:color textColor:blockcolor time:20];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                
                NSLog(@"无网络");
                [RKDropdownAlert title:@"网络异常" message:@"请检查你的网络" backgroundColor:color textColor:blockcolor time:20];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"移动网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
            default:
                break;
        }
        
    }];
    

}


#pragma mark ----下载数据;

- (void)downLoadData{
    AFmanage *mange = [AFmanage ShareInstance];
    [mange getDataFormNet:DISCOVERURL andSuccsee:^(id object) {
        //下载channerNewList
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
     NSArray *channeArr = dict[@"result"][@"channelNewsList"];
        for (NSDictionary *chandict in channeArr) {
            DisCoverModel *modle = [[DisCoverModel alloc]initWithDictionary:chandict error:nil];
            [self.dataSoucer addObject:modle];
    
        }
           //下载topicList，topic主题
        NSArray *topolTistArr = dict[@"result"][@"topicList"];
        for (NSDictionary *topdict in topolTistArr) {
            TopLestModel *topModel = [[TopLestModel alloc]initWithDictionary:topdict error:nil];
            [self.TopDataSoucer addObject:topModel];
        }
        [self.dataSoucer addObject:self.TopDataSoucer];

        [self.tableview reloadData];
    } and:^(NSError *error) {
        
    }];


}
#pragma mark ----创建tableview;


- (void)CreatUI{
    self.tableview  = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview.bounces = false;
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.contentInset = UIEdgeInsetsMake([UIScreen mainScreen].bounds.origin.x+50, 0, 0, 0);
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableview  registerNib:[UINib nibWithNibName:@"DisCoverCell" bundle:nil] forCellReuseIdentifier:@"DisCoverCell"];
    [self.tableview registerNib:[UINib nibWithNibName:@"topCell" bundle:nil] forCellReuseIdentifier:@"topCell"];
    [self.view addSubview:self.tableview];
    

}
#pragma mark ----tableviewdalegat;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSoucer.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == self.dataSoucer.count-1) {
        topCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topCell"];
        cell.dataSoucre = self.dataSoucer[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setJumpwebViewblock:^(NSString * Urlstring) {
            ShareWebViewController *Webview = [[ShareWebViewController alloc]init];
            Webview.urlString = Urlstring;
            [self.navigationController pushViewController:Webview animated:YES];
            
        }];
        return  cell;
    }
    
#pragma mark ----点击事件跳转;

    DisCoverCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DisCoverCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.dataSoucer[indexPath.row];
    [cell setJumpVCblock:^(NSString *Jumpvcurl, NSString *NavgationTetile) {
        //跳转的VCDiscovreJumpVC
        if ([NavgationTetile isEqualToString:@"找到惊喜好物"]) {
            TowDiscoveVC *vc = [[TowDiscoveVC alloc]init];
            
            [self.navigationController pushViewController:vc animated:YES];
        }else{
        DiscovreJumpVC *vc = [[DiscovreJumpVC alloc]init];
        vc.urlString = Jumpvcurl;
        vc.Navtitle =NavgationTetile;
        [self.navigationController pushViewController:vc animated:YES];
        }
    }];
    [cell setJumpwebViewblock:^(newsListModle * jumpblockmodel) {
        //分块
        if (jumpblockmodel.contentUrl.length == 0) {
            NSString *NewUrlstring = [NSString stringWithFormat:BRANDHEADIMGJUMP,jumpblockmodel.newsId];
            ShareWebViewController *Webview = [[ShareWebViewController alloc]init];
            Webview.urlString = NewUrlstring;
            [self.navigationController pushViewController:Webview animated:YES];
            
        }else{
        
        
        NSData    *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:jumpblockmodel.contentUrl]];
        NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:data options:0 error:0];
        ShareWebViewController *Webview = [[ShareWebViewController alloc]init];
        Webview.Sourcedic = dict;
        [self.navigationController pushViewController:Webview animated:YES];
        
        }
        
    }];
    return cell;


}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.dataSoucer.count-1) {
        return 310;
    }

    return 270;


}
#pragma mark ----控制导航栏坐标

//开始拖拽视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    [UIView animateWithDuration:0.5 animations:^{
        self.tableview.frame = self.view.bounds;
        
    }];
    if (self.blcokchange) {
        self.blcokchange();
    }
}

@end
