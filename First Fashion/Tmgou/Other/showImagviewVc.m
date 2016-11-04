//
//  showImagviewVc.m
//  Tmgou
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "showImagviewVc.h"
#import "CellBrandBookModel.h"
#import <UMSocialCore/UMSocialCore.h>
@interface showImagviewVc ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollview;

@property (nonatomic,strong) UIView *CustemView;

@property (nonatomic,assign) NSInteger index;

@end

@implementation showImagviewVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreartUI];
    

}
- (void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;


}
- (void)CreartUI{

    self.scrollview = [[UIScrollView alloc   ]initWithFrame:self.view.bounds];
    self.scrollview.delegate = self;
    self.scrollview.pagingEnabled = YES;
    self.scrollview.contentSize = CGSizeMake(SCREEN.width*self.Datasource.count, 0);
   
    for (NSInteger i = 0; i<self.Datasource.count; i++) {
        CellBrandBookModel *model = self.Datasource[i];
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(i*SCREEN.width, 0, SCREEN.width, SCREEN.height)];
        NSArray *arr4 =  [model.imgUrl componentsSeparatedByString:@"jpg"];
        NSString *tempstr = arr4[0];
        NSString *nweurl = [NSString stringWithFormat:@"%@jpg",tempstr];

        [imageview sd_setImageWithURL:[NSURL URLWithString:nweurl] placeholderImage:[UIImage imageNamed:@"1"]];
        [self.scrollview addSubview:imageview];
    }
    [self.scrollview setContentOffset:CGPointMake(self.showstartImagview*SCREEN.width, 0) animated:YES];
    [self.view addSubview:self.scrollview];
    self.CustemView = [[UIView alloc]initWithFrame:CGRectMake(0,SCREEN.height-40, SCREEN.width, 40)];
    self.CustemView.backgroundColor = [UIColor whiteColor];
    UIButton *brankButt = [UIButton buttonWithType:UIButtonTypeCustom];
    brankButt.frame = CGRectMake(20, 10, 20, 20);
    [brankButt setImage:[UIImage imageNamed:BACKIMG] forState:UIControlStateNormal];
    [brankButt addTarget:self action:@selector(BackController) forControlEvents:UIControlEventTouchUpInside];
    [self.CustemView addSubview:brankButt];
    
    UIButton *listbutt = [UIButton buttonWithType:UIButtonTypeCustom];
    listbutt.frame = CGRectMake(SCREEN.width-30, 10, 20, 20);
    [listbutt  setImage:[UIImage imageNamed:@"detail_share_black.png"] forState:UIControlStateNormal];
    [listbutt  addTarget:self action:@selector(shareIamge) forControlEvents:UIControlEventTouchUpInside];
    [self.CustemView addSubview:listbutt];
    
    [self.view addSubview:self.CustemView];
}
-(void)shareIamge{

   CellBrandBookModel *model =     self.Datasource[self.index];
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    messageObject.text = [NSString stringWithFormat:@"社会化组件UShare将各大社交平台接入您的应用，快速武装App"];
    
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = [UIImage imageNamed:model.imgUrl];
    [shareObject setShareImage:model.imgUrl];
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_Sina messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];




}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat  index =  self.scrollview.contentOffset.x;
    self.index = index/SCREEN.width;


}
- (void)BackController{

    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
