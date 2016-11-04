//
//  BrandStoryVC.m
//  Tmgou
//
//  Created by qianfeng on 16/10/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandStoryVC.h"
#import "StoryModel.h"
#import "StoryTableViewCell.h"
#import "BrandStoryCelljump.h"
@interface BrandStoryVC()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *DataSource;

@property (nonatomic,strong) UITableView *tableiview;

@property (nonatomic,assign) NSInteger page;

@end
@implementation BrandStoryVC
- (void)viewWillAppear:(BOOL)animated{

    self.automaticallyAdjustsScrollViewInsets = YES;
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidDisappear:(BOOL)animated{

    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
    NSArray *subs = self.navigationController.navigationBar.subviews;
    for (UIView *v in subs) {
        
        NSString *className = NSStringFromClass([v class]);
        
        if ([className isEqualToString:@"_UINavigationBarBackground"]) {
        }
        
        
        
    }
    


}
- (NSMutableArray *)DataSource{

    if (_DataSource == nil) {
        _DataSource = [NSMutableArray array];
    }
    return _DataSource;

}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"品牌故事";
    self.page = 1;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self DownLoadData];
    [self CreatUI];
    self.tableiview.mj_footer  = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        self.page ++;
        [self DownLoadData];
    }];

    
}
- (void )DownLoadData{
    NSString *newurl = [NSString stringWithFormat:BRANDSYORREFRETH,self.page];
    AFmanage *manage = [AFmanage ShareInstance];
    [manage getDataFormNet:newurl andSuccsee:^(id object) {
        NSDictionary *DicdataSource = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
        NSArray *arr =   DicdataSource[@"result"][@"list"];
        for (NSDictionary *dic in arr) {
            StoryModel *model = [[StoryModel alloc]initWithDictionary:dic error:nil];
            [self.DataSource addObject:model];
        }
        [self.tableiview reloadData];
        [self.tableiview.mj_header endRefreshing];
    } and:^(NSError *error) {
        [self.tableiview.mj_header endRefreshing];

        NSLog(@"%@",error);
    }];


}
- (void)CreatUI{
    self.tableiview = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableiview.delegate = self;
    self.tableiview.dataSource= self;
    self.tableiview.scrollsToTop = YES;
    [self.tableiview registerNib:[UINib nibWithNibName:@"StoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"StoryTableViewCell"];
    self.tableiview.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 20, 20);
    [butt setImage:[UIImage imageNamed:@"brandstoryback.png"] forState:UIControlStateNormal];
    [butt addTarget:self action:@selector(BackAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butt];
    [self.view addSubview:self.tableiview];

}
- (void)BackAction{

    [self.navigationController popViewControllerAnimated:YES];


}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.DataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    StoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoryTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.DataSource[indexPath.row];
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 335;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    StoryModel *model = self.DataSource[indexPath.row];
    NSString *urlstring = [NSString stringWithFormat:BRANDNEWLISTJUMP,model.newsId];
    BrandStoryCelljump *vc = [[BrandStoryCelljump alloc]init];
    vc.MyurlString = urlstring;
    [self.navigationController pushViewController:vc animated:YES];


}
@end
