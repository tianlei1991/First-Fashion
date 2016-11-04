//
//  BrandStoryCelljump.m
//  Tmgou
//
//  Created by qianfeng on 16/10/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandStoryCelljump.h"
#import "BrandSToryCellModel.h"
#import "BrandstoryHeadview.h"
#import "BrandStoryJumoCell.h"
#import "BranStoryJumpCell2.h"
#import <UMSocialCore/UMSocialCore.h>
@interface BrandStoryCelljump ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic,strong) UITableView *tableiview;

@property (nonatomic,strong) NSMutableArray *Datsource;

@property (nonatomic,strong) UIView *CustemView;

@property (nonatomic) CGFloat offset;

@property (nonatomic,assign) NSInteger index;

@property (nonatomic,copy) NSString *headviewtitle;

@property (nonatomic,copy) NSString *iconImageview;
@end

@implementation BrandStoryCelljump

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.MyurlString);
    [self downloadData];
    self.index = 0;
    [self CreatUi];

}
- (NSMutableArray *)Datsource{
    if (_Datsource == nil) {
        _Datsource = [NSMutableArray array];
    }
    return _Datsource;

}
- (void)downloadData{

    AFmanage *manage = [AFmanage ShareInstance];
    [manage getDataFormNet:self.MyurlString andSuccsee:^(id object) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:object options: 0 error:0];
        
        NSArray *tableviewarr =   dic[@"result"][@"newImgList"];
        for (NSDictionary *dic in tableviewarr) {
            BrandSToryCellModel *model = [[BrandSToryCellModel alloc]initWithDictionary:dic error:nil];
            [self.Datsource addObject:model];
        }
        self.headviewtitle =   dic[@"result"][@"title"];
        self.iconImageview =     dic[@"result"][@"topImg"];
        BrandstoryHeadview *headview = [[BrandstoryHeadview alloc]initWithTitle:self.headviewtitle AndIamgview:self.iconImageview AndarrCount:self.Datsource.count];
        headview.frame = CGRectMake(0, 0, SCREEN.width, SCREEN.height);
        headview.backgroundColor = [UIColor redColor];
        self.tableiview.tableHeaderView = headview;
        [self.tableiview reloadData];
    } and:^(NSError *error) {
        NSLog(@"%@",error);
    }];


}
- (BOOL)prefersStatusBarHidden{

    return YES;

}
-(void)CreatUi{
    self.tableiview = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableiview.delegate = self;
    self.tableiview.dataSource = self;
    self.tableiview.pagingEnabled =YES;
    [self.tableiview registerNib:[UINib nibWithNibName:@"BrandStoryJumoCell" bundle:nil] forCellReuseIdentifier:@"BrandStoryJumoCell"];
    [self.tableiview registerNib:[UINib nibWithNibName:@"BranStoryJumpCell2" bundle:nil] forCellReuseIdentifier:@"BranStoryJumpCell2"];
    [self.view addSubview:self.tableiview];
    self.tableiview.scrollsToTop = YES;
    self.CustemView = [[UIView alloc]initWithFrame:CGRectMake(0,SCREEN.height-40, SCREEN.width, 40)];
    self.CustemView.backgroundColor = [UIColor whiteColor];
    UIButton *brankButt = [UIButton buttonWithType:UIButtonTypeCustom];
    brankButt.frame = CGRectMake(20, 10, 20, 20);
    [brankButt setImage:[UIImage imageNamed:BACKIMG] forState:UIControlStateNormal];
    [brankButt addTarget:self action:@selector(BackController) forControlEvents:UIControlEventTouchUpInside];
    [self.CustemView addSubview:brankButt];
    
    UIButton *listbutt = [UIButton buttonWithType:UIButtonTypeCustom];
    listbutt.frame = CGRectMake(SCREEN.width-30, 10, 20, 20);
    [listbutt setImage:[UIImage imageNamed:@"detail_share_black.png"] forState:UIControlStateNormal];
    [listbutt addTarget:self action:@selector(ShareImagv) forControlEvents:UIControlEventTouchUpInside];
    [self.CustemView addSubview:listbutt];
    
    
    
    
    
    [self.view addSubview:self.CustemView];



}
- (void)ShareImagv{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    if (self.index == 0) {
        
        messageObject.text = [NSString stringWithFormat:@"社会化组件UShare将各大社交平台接入您的应用，快速武装App%@",self.headviewtitle];
        
        //创建图片内容对象
        UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
        //如果有缩略图，则设置缩略图
            shareObject.thumbImage = [UIImage imageNamed:self.iconImageview];
            [shareObject setShareImage:self.iconImageview];
            messageObject.shareObject = shareObject;
        
        messageObject.shareObject = shareObject;
        
    }else{
        BrandSToryCellModel *model =     self.Datsource[self.index-1];
        //创建网页内容对象
        messageObject.text = [NSString stringWithFormat:@"社会化组件UShare将各大社交平台接入您的应用，快速武装App%@",model.descriptionInfo];
        
        //创建图片内容对象
        UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
        //如果有缩略图，则设置缩略图
        
            shareObject.thumbImage = [UIImage imageNamed:model.imgUrl];
            [shareObject setShareImage:model.imgUrl];
        
        messageObject.shareObject = shareObject;

    
    }
    
  
    
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_Sina messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
    





}
- (void)BackController{
    [self.navigationController popViewControllerAnimated:YES];


}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.Datsource.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   
    BrandSToryCellModel *model = self.Datsource[indexPath.row];
    NSInteger count = indexPath.row+1;
    model.recordNumber = [NSString stringWithFormat:@"%ld",count];
    model.arrcount = [NSString stringWithFormat:@"%ld",self.Datsource.count];
    self.index = count;
    if (model.imgUrl.length == 0) {
        
        
        BranStoryJumpCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:@"BranStoryJumpCell2"];
        cell2.model = model;
        return cell2;

    }
    BrandStoryJumoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BrandStoryJumoCell"];
    cell.model = model;
    return cell;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return SCREEN.height;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    CGFloat  y =   self.tableiview.contentOffset.y;
    if (self.offset>y) {
        
        self.CustemView.hidden = false;
    }else
        
        self.CustemView.hidden = true;
    
    
    
}


-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    self.offset =   self.tableiview.contentOffset.y;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
