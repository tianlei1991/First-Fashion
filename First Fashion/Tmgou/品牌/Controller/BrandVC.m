//
//  BrandVC.m
//  Togou界面
//
//  Created by hj on 16/9/12.
//  Copyright © 2016年 TL. All rights reserved.
//

#import "BrandVC.h"
#import "Brandmodel.h"
#import "BrandHeadViewModle.h"
#import "BrandHeadView.h"
#import "BrandCell1.h"
#import "BrandCell2.h"
#import "BrandCell3.h"
#import "BrandCell5.h"
#import "breadCell4.h"
#import "BrandJumpHeadVC.h"
#import "branddetailVC.h"
#import "CellJumpdetaliVC.h"
#import "BrandStoryVC.h"
#import "BrandStoryCelljump.h"
#import "BookBrandVc.h"
#import "CellBrandBookVC.h"
#import "InteractiveJumpVC.h"

@interface BrandVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView  *tableView;

@property (nonatomic,strong) NSMutableArray *headDataSource;//头数据源



@property (nonatomic,strong) NSMutableArray *DataSourec;

@property (nonatomic,strong) BrandHeadView *headView;

@property (nonatomic) NSInteger counti;
@end

@implementation BrandVC

- (NSMutableArray *)DataSourec{

    if (_DataSourec == nil) {
        _DataSourec = [NSMutableArray array];
    }
    return _DataSourec;
}
-(NSMutableArray *)headDataSource{
    if (_headDataSource == nil) {
        _headDataSource = [NSMutableArray array];
    }
    
    return _headDataSource;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.hidesBarsOnSwipe = NO;
    self.tableView.contentInset  = UIEdgeInsetsMake([UIScreen mainScreen].bounds.origin.x+50, 0, 0, 0);
    UIColor *color = [UIColor whiteColor];
    UIColor *blockcolor = [UIColor blackColor];
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                [RKDropdownAlert title:@"网络异常" message:@"请检查你的网络" backgroundColor:color textColor:blockcolor time:20];
                break;
            case AFNetworkReachabilityStatusNotReachable:
               
                [self.tableView reloadData];
                NSLog(@"无网络");
                self.tableView.bounces = NO;
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

- (void)viewDidLoad {

    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //创建ui
    [self creatUI];
        //数据下载
    [self DownLoadData];

}
- (void)DownLoadData{

//下载cell 的数据。。
    AFmanage *manage = [AFmanage ShareInstance];
   [manage getDataFormNet:BRANDURL andSuccsee:^(id object) {
       NSDictionary *dictsource = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
       NSArray *banner = dictsource[@"result"][@"banner"];
       for (NSDictionary *dict in banner) {
           BrandHeadViewModle *modelhead = [[BrandHeadViewModle alloc]initWithDictionary:dict error:nil];
           [self.headDataSource addObject:modelhead];
       }
       [self.headView setScrollViewPageNumber:self.headDataSource];
       
       Brandmodel *model = [[Brandmodel alloc]initWithDictionary:dictsource[@"result"] error:nil];
       [self.DataSourec addObject:model.brandList];
       [self.DataSourec addObject:model.brandStory];
       [self.DataSourec addObject:model.lookBook];
       for (NSInteger i = 0; i<model.interactive.count; i++) {
           interactiveModel *interModel = model.interactive[i];
           [self.DataSourec addObject:interModel];
       }
       
       [self.tableView reloadData];
   } and:^(NSError *error) {
       
   }];



}
#pragma mark -- HeadViewURL 有问题。。！
- (void)creatUI {
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.contentInset  = UIEdgeInsetsMake(50, 0, 0, 0);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.bounces = false;

    self.headView = [[BrandHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width, 0.97*SCREEN.width)];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    __weak typeof (self)weakself = self;
    [self.headView setJumpBlock:^(NSString *urlstring,NSString *re_id) {
        NSRange rang = NSMakeRange(0, 2);
        NSString *newURL =  [re_id substringWithRange:rang];
        if ([newURL isEqualToString:@"30"]) {
            BrandJumpHeadVC *vc = [[BrandJumpHeadVC alloc]init];
            
            NSRange startRange = [urlstring rangeOfString:@"="];
            NSString *result = [urlstring substringWithRange:NSMakeRange(startRange.location+1, 6)];
            NSString *newurl = [NSString stringWithFormat:BRANDHVJUMPIMG,result];
            vc.Urlstring = newurl;
            [weakself.navigationController pushViewController:vc animated:YES];
            
         
        }else{
             NSArray *temparr =  [urlstring componentsSeparatedByString:@"="];
               NSString *jointurl =   temparr[1];
             NSArray *joinarr =  [jointurl componentsSeparatedByString:@"&"];
            NSString *tempstring = joinarr[0];
            NSString *newurl = [NSString stringWithFormat:BRANDHVJUMPIMG,tempstring];
            NSURL *url = [NSURL URLWithString:newurl];
            NSData *data = [NSData dataWithContentsOfURL:url];
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:0];
            NSString *newstringUrl = dict[@"result"][@"shareUrl"];
            shareWebViewVC2 *webview = [[shareWebViewVC2 alloc]init];
            webview.urlString = newstringUrl;
            [weakself.navigationController pushViewController:webview animated:YES];
        
        
        }
        
    }];
    self.tableView.tableHeaderView = self.headView;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BrandCell1" bundle:nil] forCellReuseIdentifier:@"BrandCell1"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BrandCell2" bundle:nil] forCellReuseIdentifier:@"BrandCell2"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BrandCell3" bundle:nil] forCellReuseIdentifier:@"BrandCell3"];
    [self.tableView registerNib:[UINib nibWithNibName:@"breadCell4" bundle:nil] forCellReuseIdentifier:@"breadCell4"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BrandCell5" bundle:nil] forCellReuseIdentifier:@"BrandCell5"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DataSourec.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *datasou = self.DataSourec[indexPath.row];
    if (indexPath.row ==0) {
        BrandCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"BrandCell1"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.DataSource  = datasou;
        [cell setJumpClick:^(NSString *brandid) {
            CellJumpdetaliVC *jumpvc = [[CellJumpdetaliVC alloc]init];
            jumpvc.urlString = [NSString stringWithFormat:BRANDTETALURL,brandid];
            [self.navigationController pushViewController:jumpvc animated:YES];
        }];
        [cell setBlockJumpClick:^{
            branddetailVC *vc = [[branddetailVC alloc]init];
            vc.Urlstring = BRANDALLURL;
            [self.navigationController pushViewController:vc animated:YES];
        }];
        return cell;
    }else if (indexPath.row==1){
        
        BrandCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:@"BrandCell2"];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        cell2.DataSource = datasou;
        [cell2 setJumpblockCell:^(NSString * brandid) {
            BrandStoryCelljump *vc = [[BrandStoryCelljump alloc]init];
            vc.MyurlString = [NSString stringWithFormat:BRANDSTORYCELL,brandid];
            [self.navigationController pushViewController:vc animated:YES];
            
        }];
        [cell2 setJumpbolckButt:^{
            BrandStoryVC *storyvc  = [[BrandStoryVC alloc]init];
            storyvc.MyUrlstring = BRANDSTORYJUMP;
            [self.navigationController pushViewController:storyvc animated:YES];
        }];
        return cell2;
    }else if (indexPath.row ==2){
    
    BrandCell3 *cell3 = [tableView dequeueReusableCellWithIdentifier:@"BrandCell3"];
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        cell3.DataSource = datasou;
        [cell3 setButtjumpAction:^{
            BookBrandVc *bookvc = [[BookBrandVc alloc]init];
            bookvc.myurlstring = BRANDBOOKJUMO;
            [self.navigationController pushViewController:bookvc animated:YES];
            
        }];
        
        [cell3 setCellJumpblcok:^(NSString *newid) {
            CellBrandBookVC *bookvc = [[CellBrandBookVC alloc]init];
            bookvc.Myurlstring = [NSString stringWithFormat:BRANDBOOKCELLJUMP,newid];
            [self.navigationController pushViewController:bookvc animated:YES];
            
            
        }];
        
        [cell3 setCellJumpblcok1:^(NSString *newid) {
            CellBrandBookVC *bookvc = [[CellBrandBookVC alloc]init];
            bookvc.Myurlstring = [NSString stringWithFormat:BRANDBOOKCELLJUMP,newid];
            [self.navigationController pushViewController:bookvc animated:YES];
        
            
        }];
        
        
        [cell3 setInteractivejumoBlock:^{
            InteractiveJumpVC *interactiovevc = [[InteractiveJumpVC alloc]init];
            [self.navigationController pushViewController:interactiovevc animated:YES];
            
            
        }];

        return cell3;
    
    }
    
    interactiveModel *interModel = self.DataSourec[indexPath.row];
        if ([interModel.showType isEqualToString:@"7"]&&[interModel.jumpType isEqualToString:@"12"]) {
            breadCell4 *cell4 = [tableView dequeueReusableCellWithIdentifier:@"breadCell4"];
            cell4.selectionStyle = UITableViewCellSelectionStyleNone;
            cell4.model = (Brandmodel*)interModel;
            [cell4 setButtblock:^{
                shareWebViewVC2 *vc = [[shareWebViewVC2 alloc]init];
                vc.urlString = interModel.newsDetailUrl;
                [self.navigationController pushViewController:vc animated:YES];

                
            }];
            return cell4;
        }
  
    BrandCell5 *cell5 = [tableView dequeueReusableCellWithIdentifier:@"BrandCell5"];
    cell5.selectionStyle = UITableViewCellSelectionStyleNone;
    cell5.model = (Brandmodel*)interModel;
    return cell5;
 
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        if (SCREEN.width == 320) {
            return 300;
        }else{
        
         return 220;
        }
        
    }else if (indexPath.row ==1){
        return 330;
    
    } else if (indexPath.row ==2){
    return 1.1 * SCREEN.width;
    }
    interactiveModel *interModel = self.DataSourec[indexPath.row];
 if ([interModel.showType isEqualToString:@"7"]&&[interModel.jumpType isEqualToString:@"12"]) {
     
     return 260;
 }
    
    return 123;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row>2) {
        interactiveModel *interModel = self.DataSourec[indexPath.row];
        if ([interModel.showType isEqualToString:@"7"] && [interModel.jumpType isEqualToString:@"12"]) {
            shareWebViewVC2 *vc = [[shareWebViewVC2 alloc]init];
            vc.urlString = interModel.newsDetailUrl;
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            
            shareWebViewVC2 *vc = [[shareWebViewVC2 alloc]init];
            vc.urlString = interModel.newsDetailUrl;
            [self.navigationController pushViewController:vc animated:YES];
    }
    

 
        
        
        
    }
    


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//开始拖拽视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    [UIView animateWithDuration:0.5 animations:^{
        self.tableView.frame = self.view.bounds;
        
    }];
    if (self.blcokchange) {
        self.blcokchange();
    }
}





@end
