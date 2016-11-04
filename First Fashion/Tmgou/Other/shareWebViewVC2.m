//
//  shareWebViewVC2.m
//  Tmgou
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "shareWebViewVC2.h"
#import <UMSocialCore/UMSocialCore.h>

@interface shareWebViewVC2 ()<UIWebViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) UIWebView *webview;

@property (nonatomic,strong) UIView *Tabview;

@property (nonatomic) CGFloat offset;

@end

@implementation shareWebViewVC2
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = true;

}
- (BOOL)prefersStatusBarHidden{

    return YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width, SCREEN.height)];
    self.webview.scalesPageToFit = YES;
    if (self.urlString.length<10) {
        AFmanage *mange = [AFmanage ShareInstance];
        NSString *newurl = [NSString stringWithFormat:BRANDNEWLISTJUMP,self.urlString];
        [mange getDataFormNet:newurl andSuccsee:^(id object) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
           NSString *urlstring =   dict[@"result"][@"shareUrl"];
            NSURL *url = [NSURL  URLWithString:urlstring];
            NSURLRequest *requset = [NSURLRequest  requestWithURL:url];
            [self.webview loadRequest:requset];
            [self.webview reload];
        } and:^(NSError *error) {
            
        }];
        
    }else{
        NSURL *url = [NSURL URLWithString:self.urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webview loadRequest:request];
    }
    
    self.webview.delegate = self;
    self.webview.scrollView.delegate  = self;
    
    [self.view addSubview:self.webview];
    [self creatTabbar];

}
- (void)creatTabbar{
    
    self.Tabview = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN.height-46, SCREEN.width, 46)];
    UIButton * butt = [UIButton buttonWithType:UIButtonTypeCustom];
    self.Tabview.backgroundColor = [UIColor whiteColor];
    [butt setImage:[UIImage imageNamed:@"arrow_black_back"] forState:UIControlStateNormal];
    butt.frame = CGRectMake(10, 16, 20, 20);
    
    [butt addTarget:self action:@selector(gobackAction) forControlEvents:UIControlEventTouchUpInside];
    [self.Tabview addSubview:butt];
    
    UIButton *sharebutt = [UIButton buttonWithType:UIButtonTypeCustom];
    sharebutt.frame = CGRectMake(SCREEN.width-40, 16, 20, 20);
    [sharebutt setImage:[UIImage imageNamed:@"detail_share_black.png"] forState:UIControlStateNormal];
    [sharebutt addTarget:self action:@selector(shareclick ) forControlEvents:UIControlEventTouchUpInside];
    UIButton *likeButt = [UIButton buttonWithType:UIButtonTypeCustom];
    likeButt.frame = CGRectMake(CGRectGetMaxX(sharebutt.frame)-80, 16, 20, 20);
    [likeButt setImage:[UIImage imageNamed:@"like_default_goods.png"] forState:UIControlStateNormal];
    [likeButt setImage:[UIImage imageNamed:@"detail_like_active.png"] forState:UIControlStateSelected];
    [likeButt addTarget:self action:@selector(like:) forControlEvents:UIControlEventTouchUpInside];
    [self.Tabview addSubview:sharebutt];
    [self.Tabview addSubview:likeButt];
    
    [self.view addSubview:self.Tabview];
}
- (void)shareclick{

    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    messageObject.text = [NSString stringWithFormat:@"社会化组件UShare将各大社交平台接入您的应用，快速武装App。%@",self.urlString];
    
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = [UIImage imageNamed:@"453_80921_813949.jpg"];
    [shareObject setShareImage:@"http://dev.umeng.com/images/tab2_1.png"];
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
    
    
    CGFloat  y =   self.webview.scrollView.contentOffset.y;
    if (self.offset>y) {
        
        self.Tabview.hidden = false;
    }else
        
        self.Tabview.hidden = true;
    
    
    
}


-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    self.offset =   self.webview.scrollView.contentOffset.y;
    
    
}
- (void)gobackAction{
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
- (void)like:(UIButton *)sendr{
    sendr.selected =! sendr.selected;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
