//
//  MyTabbarVC.m
//  Togou界面
//
//  Created by hj on 16/9/12.
//  Copyright © 2016年 TL. All rights reserved.
//

#import "MyTabbarVC.h"
#import "SelecTionVC.h"
#import "DiscoverVC.h"
#import "BrandVC.h"
#import "FisrtModel.h"
#import "ZYZDBManager.h"
@interface MyTabbarVC ()
//就两个view，titleView是最上面个那个view,tabbarView是下面的那个view
@property (nonatomic,strong) UIView *TabbarView;//标签
@property (nonatomic,strong) UIView *TitleView;//导航栏
@property (nonatomic,strong) UILabel *ContentLabe;//导航栏label
@property (nonatomic,strong) SelecTionVC *selctVC;
@property (nonatomic,strong) DiscoverVC *discover;
@property (nonatomic,strong) BrandVC *brand;
@end

@implementation MyTabbarVC

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    self.TitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width, 20)];
    self.TitleView.backgroundColor = [UIColor whiteColor];
    self.TitleView.userInteractionEnabled = YES;
    self.ContentLabe = [[UILabel alloc]initWithFrame:CGRectMake(30,20, SCREEN.width-40,40)];
    NSString *placeHoldertext = @"TmGou早安！";
    
    self.ContentLabe.text = placeHoldertext;
    self.ContentLabe.font=[UIFont fontWithName:@"Helvetica"size:28];
    self.ContentLabe.userInteractionEnabled = YES;
    [self.TitleView addSubview:self.ContentLabe];
    UILabel * cityName = [[UILabel alloc]initWithFrame:CGRectMake(35, CGRectGetMaxY(self.ContentLabe.frame)-3, 50, 15)];
    cityName.font = [UIFont systemFontOfSize:13];
    cityName.text = @"上海";
    cityName.userInteractionEnabled = YES;
    [self.TitleView addSubview:cityName];
    
    [self.view addSubview:self.TitleView];
    
    self.TitleView.frame = CGRectMake(0, 0, SCREEN.width, 100);
    self.TabbarView.frame = CGRectMake(0, CGRectGetMaxY(self.TitleView.frame), SCREEN.width, 50);
    self.TabbarView.userInteractionEnabled = YES;
    
    
 }


- (void)setButtNumber:(NSInteger)Number{
    
    if (Number==3) {
      self.selctVC = [[SelecTionVC alloc]init];
       self.discover = [[DiscoverVC alloc]init];
       self.brand = [[BrandVC alloc]init];
        self.viewControllers = @[self.selctVC,self.discover,self.brand];
        
        
    }else{
        self.selctVC = [[SelecTionVC alloc]init];
        self.discover = [[DiscoverVC alloc]init];
         self.viewControllers = @[self.selctVC,self.discover];
        }

    [self CreatButt:Number];
    
    
#pragma mark 回调动画
    __weak typeof(self)weakself = self;
    [self.selctVC setBlcokchange:^{
        [UIView animateWithDuration:0.5 animations:^{
       
            weakself.TitleView.frame = CGRectMake(0, 0, SCREEN.width, 20);
            weakself.TabbarView.frame = CGRectMake(0, CGRectGetMaxY(weakself.TitleView.frame),SCREEN.width,50);
            [weakself ImageAction];

        }];
        
    }];
    
    [self.discover setBlcokchange:^{
        [UIView animateWithDuration:0.5 animations:^{
            
            weakself.TitleView.frame = CGRectMake(0, 0, SCREEN.width, 20);
            weakself.TabbarView.frame = CGRectMake(0, CGRectGetMaxY(weakself.TitleView.frame),SCREEN.width,50);
            [weakself ImageAction];
        }];
        
    }];

    [self.brand setBlcokchange:^{
        [UIView animateWithDuration:0.5 animations:^{
            
            weakself.TitleView.frame = CGRectMake(0, 0, SCREEN.width, 20);
            weakself.TabbarView.frame = CGRectMake(0, CGRectGetMaxY(weakself.TitleView.frame),SCREEN.width,50);
            [weakself ImageAction];

        }];
        
    }];

}

- (void)CreatButt:(NSInteger )Number
{
  self.TabbarView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.TitleView.frame),SCREEN.width,50)];
    
    self.TabbarView.backgroundColor = [UIColor whiteColor];
    for (NSInteger i = 0; i<Number; i++) {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake(i*(SCREEN.width/3), 20, SCREEN.width/3, CGRectGetHeight(self.TabbarView.frame)-20);
        but.backgroundColor = [UIColor whiteColor];
        [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        if(i == 0){
          [but setTitle:@"精选" forState:UIControlStateNormal];
        }else if (i==1){
            [but setTitle:@"发现" forState:UIControlStateNormal];
        
        }else
          
        [but setTitle:@"品牌" forState:UIControlStateNormal];
      
        [but addTarget:self action:@selector(Buttcilck:) forControlEvents:UIControlEventTouchUpInside];
        but.tag = i;
        [self.TabbarView addSubview:but];
    }
      [self.view addSubview:self.TabbarView];
    [self amdbCach];

}

- (void)Buttcilck:(UIButton *) sendr
{
    self.selectedIndex = sendr.tag;

}
- (void)amdbCach{
    
    ZYZDBManager *mang = [ZYZDBManager shareDBManager];
    UIImageView *imagview = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    AFmanage *mange = [AFmanage ShareInstance];
    
    FisrtModel *model = [[FisrtModel alloc]init];
    NSArray *arr =  [mang selectWithModel:model];
    FisrtModel *model2 =  [arr firstObject];
    
    
    if (model2.imageUrl.length == 0) {
        [mange getDataFormNet: FIRSTURL andSuccsee:^(id object) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
            if ( [dict[@"result"][@"data"] count] == 0)
            {
                return ;
            }
            NSArray *dataarr =   dict[@"result"][@"data"];
            NSDictionary *dic =  [dataarr firstObject];
            NSDictionary    *dctt = dic[@"img4iphone"];
            FisrtModel *model = [[FisrtModel alloc]initWithDictionary:dctt error:nil];
            [mang insertDbWithModel:model];
        } and:^(NSError *error) {
            NSLog(@"%@",error);
            
        }];
        
    }else{
        [imagview sd_setImageWithURL:[NSURL URLWithString:model2.imageUrl]];
        [self.view addSubview:imagview];
        [UIView animateWithDuration:5 animations:^{
            imagview.transform = CGAffineTransformMakeScale(1.5, 1.5);
            
        } completion:^(BOOL finished) {
            [imagview removeFromSuperview];
            
        }];
        
    }
    
    
    
    
}


#pragma mark 触发动画下移动
- (void)ImageAction
{

    
   
    //高度为100，y坐标为120所以要减去20
     [[NSNotificationCenter defaultCenter] postNotificationName:@"valueChange" object:self.TabbarView];
}


@end
