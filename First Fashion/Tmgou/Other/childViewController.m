//
//  childViewController.m
//  Tmgou
//
//  Created by qianfeng on 16/10/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "childViewController.h"
#import "BrandDetailCell.h"
#import "BandetailsDModel.h"
@interface childViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIView *view2;
@property (nonatomic,strong) UITableView *tableiview;
@property (nonatomic, retain) UILocalizedIndexedCollation *collation;
@property (nonatomic) NSInteger recordTag;
@property (nonatomic) NSInteger recordSection;

@end

@implementation childViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableiview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width, SCREEN.height-94) style:UITableViewStylePlain];
    self.tableiview.delegate = self;
    self.tableiview.dataSource   = self;
    [self.tableiview registerNib:[UINib nibWithNibName:@"BrandDetailCell" bundle:nil] forCellReuseIdentifier:@"BrandDetailCell"];
    self.tableiview.separatorStyle =   UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.tableiview];
    [self configureSections];
    self.recordTag = 10;
    self.automaticallyAdjustsScrollViewInsets = false;

 
}


- (void)configureSections {
    
       switch (self.count) {
                case 1:{
            self.view2 = [[UIView alloc ]initWithFrame:CGRectMake(self.view.frame.size.width-20,0, 20, self.view.frame.size.height)];
            self.view2.backgroundColor = [UIColor clearColor];
                    NSArray *arr =   @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"R",@"S",@"T",@"V",@"Y"];
            NSInteger count = arr.count;
            for (NSInteger i = 0;i<arr.count; i++) {
                UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
                butt.frame = CGRectMake(0, i*((SCREEN.height-150)/count)+30, 20, 10);
                [butt setTitle:arr[i] forState:UIControlStateNormal];
                butt.tag = 10+i;
                [butt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                butt.font = [UIFont systemFontOfSize:14];
                [ self.view2 addSubview:butt];
                [butt addTarget:self action:@selector(buttAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            [self.view addSubview: self.view2];
            break;
        }
        case 2:{
            self.view2 = [[UIView alloc ]initWithFrame:CGRectMake(self.view.frame.size.width-20,0, 20, self.view.frame.size.height)];
            self.view2.backgroundColor = [UIColor clearColor];
            
            NSArray *arr =   @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"P",@"R",@"S",@"T",@"U",@"V",@"W",@"Z"];
            NSInteger count = arr.count;
            for (NSInteger i = 0;i<arr.count; i++) {
                UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
                butt.frame = CGRectMake(0, i*((SCREEN.height-150)/count)+30, 20, 10);
                [butt setTitle:arr[i] forState:UIControlStateNormal];
                butt.tag = 10+i;
                [butt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                butt.font = [UIFont systemFontOfSize:14];
                [ self.view2 addSubview:butt];
                [butt addTarget:self action:@selector(buttAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            [self.view addSubview: self.view2];
            break;
        }
        case 3:{
            self.view2 = [[UIView alloc ]initWithFrame:CGRectMake(self.view.frame.size.width-20,0, 20, self.view.frame.size.height)];
            self.view2.backgroundColor = [UIColor clearColor];
            
            NSArray *arr =   @[@"A",@"B",@"C",@"D",@"F",@"G",@"H",@"I",@"J",@"L",@"M",@"N",@"O",@"P",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Z"];
            NSInteger count = arr.count;
            for (NSInteger i = 0;i<arr.count; i++) {
                UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
                butt.frame = CGRectMake(0, i*((SCREEN.height-150)/count)+30, 20, 10);
                [butt setTitle:arr[i] forState:UIControlStateNormal];
                butt.tag = 10+i;
                [butt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                butt.font = [UIFont systemFontOfSize:14];
                [ self.view2 addSubview:butt];
                [butt addTarget:self action:@selector(buttAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            [self.view addSubview: self.view2];
            break;
        }
        case 4:{
            self.view2 = [[UIView alloc ]initWithFrame:CGRectMake(self.view.frame.size.width-20,0, 20, self.view.frame.size.height)];
            self.view2.backgroundColor = [UIColor clearColor];
            
            NSArray *arr =   @[@"A",@"B",@"C",@"D",@"F",@"H",@"J",@"K",@"L",@"M",@"O",@"P",@"Q",@"R",@"S",@"T",@"V",@"X",@"Y",@"Z"];
            NSInteger count = arr.count;
            for (NSInteger i = 0;i<arr.count; i++) {
                UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
                butt.frame = CGRectMake(0, i*((SCREEN.height-150)/count)+30, 20, 10);
                [butt setTitle:arr[i] forState:UIControlStateNormal];
                butt.tag = 10+i;
                [butt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                butt.font = [UIFont systemFontOfSize:14];
                [ self.view2 addSubview:butt];
                [butt addTarget:self action:@selector(buttAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            [self.view addSubview: self.view2];
            break;
            
        }
        default:
            break;
            
            
    }
    
    

    
         //获得当前UILocalizedIndexedCollation对象并且引用赋给collation,A-Z的数据
    self.collation = [UILocalizedIndexedCollation currentCollation];
    //获得索引数和section标题数
    NSInteger index, sectionTitlesCount = [[self.collation sectionTitles] count];
    
    //临时数据，存放section对应的userObjs数组数据
    NSMutableArray *newSectionsArray = [[NSMutableArray alloc] initWithCapacity:sectionTitlesCount];
    
    //设置sections数组初始化：元素包含userObjs数据的空数据
    for (index = 0; index < sectionTitlesCount; index++) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [newSectionsArray addObject:array];
    }
    
    //将用户数据进行分类，存储到对应的sesion数组中
    for (BandetailsDModel *userObj in self.DataSource) {
        
        //根据timezone的localename，获得对应的的section number
        NSInteger sectionNumber = [self.collation sectionForObject:userObj collationStringSelector:@selector(title)];
        
        //获得section的数组
        NSMutableArray *sectionUserObjs = [newSectionsArray objectAtIndex:sectionNumber];
        
        //添加内容到section中
        [sectionUserObjs addObject:userObj];
    }
    
    //排序，对每个已经分类的数组中的数据进行排序，如果仅仅只是分类的话可以不用这步
    for (index = 0; index < sectionTitlesCount; index++) {
        
        NSMutableArray *userObjsArrayForSection = [newSectionsArray objectAtIndex:index];
        
        //获得排序结果
        NSArray *sortedUserObjsArrayForSection = [self.collation sortedArrayFromArray:userObjsArrayForSection collationStringSelector:@selector(title)];
        
        //替换原来数组
        [newSectionsArray replaceObjectAtIndex:index withObject:sortedUserObjsArrayForSection];
    }

    self.DataSource = newSectionsArray;
    if (self.count==0) {
        self.view2 = [[UIView alloc ]initWithFrame:CGRectMake(self.view.frame.size.width-20,0, 20, self.view.frame.size.height)];
        NSInteger count = [self.collation sectionTitles].count;
        self.view2.backgroundColor = [UIColor clearColor];
        for (NSInteger i = 0;i<[self.collation sectionTitles].count; i++) {
            UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
            butt.frame = CGRectMake(0, i*((SCREEN.height-150)/count)+30, 20, 10);
            [butt setTitle:[self.collation sectionTitles][i] forState:UIControlStateNormal];
            butt.tag = 10+i;
            [butt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            butt.font = [UIFont systemFontOfSize:14];
            [ self.view2 addSubview:butt];
            [butt addTarget:self action:@selector(buttAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self.view addSubview: self.view2];
    }
   
   

}

- (void)buttAction:(UIButton *)send{
    
    send.titleLabel.font = [UIFont systemFontOfSize:18];
    [send setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:send.tag-10];
    NSArray  *index =   self.DataSource[send.tag-10];
    if ( index.count  == 0 ) {
        send.titleLabel.font = [UIFont systemFontOfSize:14];
        [send setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        return;
    }
    [self.tableiview scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:YES];
  
    
    if (self.recordTag  > send. tag) {
        UIButton   *butt =  [self.view viewWithTag:self.recordTag];
        [butt     setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        butt.titleLabel.font = [UIFont systemFontOfSize:14];

    }else{
        UIButton   *butt =  [self.view viewWithTag:self.recordTag];
        [butt     setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         butt.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    
       self.recordTag = send.tag;
   

}
#pragma mark --------tableview的委托和datasource-------
//设置Section的数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.collation sectionTitles] count];
}
//设置每个Section下面的cell数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *UserObjsInSection = [self.DataSource objectAtIndex:section];
    
    return [UserObjsInSection count];
}
//设置每行的cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BrandDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BrandDetailCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.DataSource[indexPath.section][indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
   BandetailsDModel *model =   self.DataSource[indexPath.section][indexPath.row];
    
      NSString *newstring = [self getFirstLetterFromString:model.title];
         NSString *contstring =     self.collation.sectionTitles[self.recordSection ];
      if ([newstring isEqualToString:contstring]) {
        UIButton   *butt =  [self.view viewWithTag:indexPath.section+10];
        [butt     setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        butt.titleLabel.font = [UIFont systemFontOfSize:18];
      }else{
          UIButton   *butt =  [self.view viewWithTag:self.recordSection +10];
          [butt     setTitleColor:[UIColor whiteColor   ] forState:UIControlStateNormal];
          
          butt.titleLabel.font = [UIFont systemFontOfSize:14];
      
      
      }
  
    
    self.recordSection = indexPath.section;

    
   

  }
/*
 * 跟section有关的设定
 */
//设置section的Header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 100;
}
- (NSString *)getFirstLetterFromString:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *strPinYin = [str capitalizedString];
    //获取并返回首字母
    return [strPinYin substringToIndex:1];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     BandetailsDModel *model =  self.DataSource[indexPath.section][indexPath.row];
    self.block(model.brandId,model.title);
    
    

}
- (void)viewWillAppear:(BOOL)animated{
 
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
       UIView *tempview = [[UIView alloc]init];
    NSArray *arr = self.navigationController.navigationBar.subviews;
    for (UIView *vo in arr) {
        NSString *className = NSStringFromClass([vo class]);
        
        if ([className isEqualToString:@"_UINavigationBarBackground"]) {
          tempview  = vo;
        }

    }
    tempview.alpha = 1;
}

@end
