//
//  SelecTionVC.m
//  Togou界面
//
//  Created by hj on 16/9/12.
//  Copyright © 2016年 TL. All rights reserved.
//

#import "SelecTionVC.h"
#import "Cell1.h"
#import "HeadView.h"
#import "Cell2.h"
#import "Cell3.h"
#import "Cell4.h"
#import "SelecTionModel.h"

@interface SelecTionVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) HeadView *head;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *DataSource;

@property (nonatomic,strong) NSMutableArray *ListDataSource;

@property (nonatomic) NSInteger page;

@property (nonatomic,copy) NSString *logString;

@property (nonatomic,strong) ZYZDBManager *mangagr;
@end

@implementation SelecTionVC

- (ZYZDBManager *)mangagr{
    if (_mangagr == nil) {
        _mangagr = [ZYZDBManager shareDBManager];
    }
    return _mangagr;


}
- (NSMutableArray *)DataSource{
    if (_DataSource==nil) {
        _DataSource = [NSMutableArray array];
    }
    return _DataSource;

}
- (NSMutableArray *)ListDataSource{
    if (_ListDataSource == nil) {
        _ListDataSource = [NSMutableArray array];
    }

    return _ListDataSource;
}

- (void)viewDidLoad {
 
    
      self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];

   
    
    //下载数据
    [self DonwLoadDataSource];
  
    //创建UI
    [self CreatUI];
    [self CreatHeadView];
    [self refresh];
    
   }

- (void)refresh{

self.tableView.mj_header  = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
    self.page = 0;
    [self DonwLoadDataSource];
    
}];
    
 self.tableView.mj_footer  = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
     self.page ++;
     [self DonwLoadDataSource];
     
      
  }];

}
- (void)DonwLoadDataSource{
    AFmanage *manger = [[AFmanage alloc]init];
    if (self.page==0) {
        self.logString   = [self gatDatetimer];
        [self.DataSource removeAllObjects];
        [self.ListDataSource removeAllObjects];
    }else{
        self.logString   = [self yesterday];
    
    }
  
    NSString *newurl = [NSString stringWithFormat:SELECURL,self.logString];
  NSString *NewString =  [newurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 
   
    [manger getDataFormNet:NewString andSuccsee:^(id object) {
         NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
         NSArray *listArr =  dic[@"result"][@"list"];
         NSArray *headarr =  listArr[0][@"bannerList"];
        for (NSDictionary *headDic in headarr) {
            SelctHeadModel * model = [[SelctHeadModel alloc]initWithDictionary:headDic error:nil];
            [self.mangagr insertDbWithModel:model];
            [self.DataSource addObject:model];
        }
        
            for (NSDictionary *dict in listArr) {
            
            SelecTionModel *model = [[SelecTionModel alloc]initWithDictionary:dict error:nil];
                [self.mangagr insertDbWithModel:model];
            [self.ListDataSource addObject:model];
        }
        [self.head setScrollViewPageNumber:self.DataSource];

        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer  endRefreshing];
        [self.tableView reloadData];
    } and:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer  endRefreshing];
    }];

}
- (NSString *)gatDatetimer{
    NSDate *date = [NSDate date];
    NSCalendar *cal= [NSCalendar currentCalendar];
    NSDateComponents *compoente = [cal components:NSYearCalendarUnit |NSMonthCalendarUnit |NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit |NSSecondCalendarUnit
                                         fromDate:date];
    NSDateFormatter *deteformatter = [[NSDateFormatter alloc]init];
    [deteformatter setDateFormat:@"YYYY-MM-dd"];
    NSString *timer = [deteformatter stringFromDate:date];
    return timer;



}

- (NSString *)yesterday{
    NSString *cureet =   [self gatDatetimer];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [formatter dateFromString:cureet];
    
    NSDate *yesterday = [NSDate dateWithTimeInterval:-60 * 60 * 24*self.page sinceDate:date];
    
    NSString *itmerdate = [formatter stringFromDate:yesterday];
    return itmerdate;

}
- (void)CreatUI{
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollsToTop = YES;
      self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"Cell1" bundle:nil] forCellReuseIdentifier:@"Cell1"];
    [self.tableView registerNib:[UINib nibWithNibName:@"Cell2" bundle:nil] forCellReuseIdentifier:@"Cell2"];
    [self.tableView registerNib:[UINib nibWithNibName:@"Cell3" bundle:nil] forCellReuseIdentifier:@"Cell3"];
    [self.tableView registerNib:[UINib nibWithNibName:@"Cell4" bundle:nil] forCellReuseIdentifier:@"Cell4"];
   
   

}

- (void)CreatHeadView
{
    self.head = [[HeadView alloc]init];

    self.head.frame = CGRectMake(0, 50, SCREEN.width,1.25*SCREEN.width);
    self.head.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = self.head;
    __weak typeof(self) Wekeself = self;
    [self.head setJumpblock:^(NSString * urlstring) {
        ShareWebViewController *webview = [[ShareWebViewController alloc]init];
        webview.urlString    = urlstring    ;
        [Wekeself.navigationController pushViewController:webview animated:YES];
    }];
   //获取通知！
    


}

#pragma mark tableview代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
  
    return self.ListDataSource.count;
    
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 SelecTionModel *model = self.ListDataSource[indexPath.row];
    UITableViewCell *cell  = [[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if ([model.showType  isEqual:@"1"] && [model.jumpType isEqualToString:@"1"]) {
          Cell1  *cell1 = [tableView dequeueReusableCellWithIdentifier:@"Cell1"];
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        cell1.model = model;
        
        return cell1;
    }else if([model.showType isEqualToString:@"2"] &&[model.jumpType isEqualToString:@"1"]){
        Cell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;

        cell2.model = model;
        return cell2;
    } else if ([model.showType isEqualToString:@"4"] &&[model.jumpType isEqualToString:@"7"]) {
        Cell3 *cell3 = [tableView dequeueReusableCellWithIdentifier:@"Cell3"];
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;

        cell3.model = model;
        return cell3;
    }else if ([model.showType isEqualToString:@"9"] &&[model.jumpType isEqualToString:@"9"]) {
        Cell3 *cell3 = [tableView dequeueReusableCellWithIdentifier:@"Cell3"];
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        cell3.model = model;
        return cell3;
        
    }else if ([model.showType isEqualToString:@"22"]){
        Cell4 *cell4 = [tableView dequeueReusableCellWithIdentifier:@"Cell4"];
        cell4.selectionStyle = UITableViewCellSelectionStyleNone;

        [cell4 setJumpblock:^(CellfiveModel * jumpblockmodel) {
            NSData    *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:jumpblockmodel.contentUrl]];
            NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:data options:0 error:0];
            ShareWebViewController *Webview = [[ShareWebViewController alloc]init];
            Webview.Sourcedic = dict;
            [self.navigationController pushViewController:Webview animated:YES];
        }];
        
        [cell4 setJumpVC:^(NSString *title) {
            JumpVC *jvc = [[JumpVC alloc ]init];
            
            jvc.jsindataSourceString = model.enId;
            jvc.JumpTitle = title;
            [self.navigationController pushViewController:jvc animated:YES];

        }];
        cell4.DataSource = model.newsList;
        return cell4;
    
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SelecTionModel *model = self.ListDataSource[indexPath.row];
    if ([model.showType  isEqual:@"1"] && [model.jumpType isEqualToString:@"1"]) {
        
        return 290;
    }else if([model.showType isEqualToString:@"2"] &&[model.jumpType isEqualToString:@"1"]){

        return 123;
    } else if ([model.showType isEqualToString:@"4"] &&[model.jumpType isEqualToString:@"7"]){
   
        return  235;
    }else if ([model.showType isEqualToString:@"22"]){
    
        return 250;
    }else
    
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    SelecTionModel *model = self.ListDataSource[indexPath.row];
    if ([model.showType  isEqual:@"1"] && [model.showType isEqualToString:@"1"]) {
        NSData    *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.contentUrl]];
        NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:data options:0 error:0];
        ShareWebViewController *Webview = [[ShareWebViewController alloc]init];
        Webview.Sourcedic = dict;
        
        

        [self.navigationController pushViewController:Webview animated:YES];
    
    }else if([model.showType isEqualToString:@"2"] &&[model.jumpType isEqualToString:@"1"]){
        NSData    *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.contentUrl]];
        NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:data options:0 error:0];
        ShareWebViewController *Webview = [[ShareWebViewController alloc]init];
        Webview.Sourcedic = dict;

      
        [self.navigationController pushViewController:Webview animated:YES];
        
    }else  if([model.showType isEqualToString:@"4"] &&[model.jumpType isEqualToString:@"7"]){
        //拼接url
        NSString *urlstring =    model.jumpUrl;
        ShareWebViewController *webview = [[ShareWebViewController alloc]init];
        NSRange startRange = [urlstring rangeOfString:@"="];
        NSRange endRange = [urlstring rangeOfString:@"&"];
        NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
        NSString *result = [urlstring substringWithRange:range];
        NSString *newurl = [NSString stringWithFormat:BRANDHEADIMGJUMP,result];
        webview.urlString = newurl;
        [self.navigationController pushViewController:webview animated:YES];
    }
    
    
    
}


//开始拖拽视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
//    self.tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0);
    [UIView animateWithDuration:0.5 animations:^{
        self.tableView.frame = self.view.bounds;

    }];
    if (self.blcokchange) {
        self.blcokchange();
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.hidesBarsOnSwipe = NO;
    SelecTionModel *model = [[SelecTionModel alloc]init];
    SelctHeadModel *headmodel = [[SelctHeadModel alloc]init];
    UIColor *color = [UIColor whiteColor];
    UIColor *blockcolor = [UIColor blackColor];
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status  == AFNetworkReachabilityStatusUnknown) {
            
        }
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                [RKDropdownAlert title:@"网络异常" message:@"请检查你的网络" backgroundColor:color textColor:blockcolor time:20];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                self.DataSource = [self.mangagr selectWithModel:headmodel];
                self.ListDataSource = [self.mangagr selectWithModel:model];
                [self.head setScrollViewPageNumber:self.DataSource];
                [self.tableView reloadData];
                NSLog(@"无网络");
                self.tableView.bounces = NO;
                [RKDropdownAlert title:@"网络异常" message:@"请检查你的网络" backgroundColor:color textColor:blockcolor time:20];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"移动网络");
                self.tableView.bounces = YES;

                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                self.tableView.bounces = YES;

                break;
            default:
                break;
        }
        
    }];
    [manager startMonitoring];


   
}

@end





