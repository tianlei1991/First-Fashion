//
//  URLInterface.h
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#ifndef URLInterface_h
#define URLInterface_h
#define FIRSTURL @"http://moguapp.mogujie.com/startup/imgList?cityId=13a&_cityId=13a&_uid=1257400a"
//精选url,直接时间操作
#define SELECURL  @"http://moguapp.mogujie.com/v3/news/selected?_cityId=13a&strDayTime=%@ 16:01:48"
//发现
#define DISCOVERURL @"http://moguapp.mogujie.com/v3/discover?_t=1474284428&_lang=0&_cityId=13a&_ab=2546&_newdid=cd94df6283ab9992cebe19c1595d6540&_av=242"
//品牌
#define BRANDURL @"http://moguapp.mogujie.com/v2/brand/discover?_t=1474548505%20&_cityId=13a"

//head里面的isoURL newsId 调转时候拼接 下面的，
#define BRANDHEADIMGJUMP @"http://moguapp.mogujie.com/h5/act.html?newsId=%@"
//JUMPVC跳转拼接ENID,URL
#define VCJUMPURL @"http://moguapp.mogujie.com/news/channelNews?cityId=13a&channelId=%@&_newdid=cd94df6283ab9992cebe19c1595d6540"
//下拉刷新拼接Mpage
#define JUMPDOWNURL @"http://moguapp.mogujie.com/news/recommend?cityId=13a&_newdid=cd94df6283ab9992cebe19c1595d6540&mpage=%@"
//JUMPVC --headViewURL
#define JUMPHEADVIEWURL @"http://moguapp.mogujie.com/v3/news/channelColumn?channelId=542&_cityId=13a"//美容
#define HAPPYURL @"http://moguapp.mogujie.com/v3/news/channelColumn?channelId=04a&_cityId=13a#endif"//乐活
#define STARSURL @"http://moguapp.mogujie.com/v3/news/channelColumn?channelId=664&_cityId=13a#endif"//明星
#define FIDURL @"http://moguapp.mogujie.com/v3/news/channelColumn?channelId=448&_cityId=13a#endif"//时尚
//跳转买东西界面
#define TOWDISCOVEVC @"http://moguapp.mogujie.com/news/channelItemNews?channelId=14c&_cityId=13a"
//下拉刷新拼接Mpage
#define TOWDOWNURL @"http://moguapp.mogujie.com/news/channelItemNews?_cityId=13a&mpage=%@"

/*品牌界面*/ //headView跳转图片显示
#define BRANDHVJUMPIMG  @"http://moguapp.mogujie.com/v2/news/imgList?_cityId=13a&newsId=%@"
#define BRANDALLURL @"http://moguapp.mogujie.com/brand/allBrand?_cityId=13a&_uid=1257400a"
#define BRANDTETALURL @"http://moguapp.mogujie.com/v2/brand/detail?_cityId=13a&brandId=%@"
//http://moguapp.mogujie.com/v2/news/imgList?_cityId=13a&newsId=2a3218
//品牌故事跳转
#define BRANDSTORYJUMP @"http://moguapp.mogujie.com/v2/brand/brandStory?_cityId=13a"
#define BRANDSTORYCELL @"http://moguapp.mogujie.com/news/detail?_cityId=13a&newsId=%@"
//Butt点击界面刷新
#define BRANDSYORREFRETH @"http://moguapp.mogujie.com/v2/brand/brandStory?_cityId=13a&mpage=%ld"
//图片
#define BRANDBOOKJUMO @"http://moguapp.mogujie.com/v2/brand/lookBook?_cityId=13a"
#define BRANDBOOKCELLJUMP @"http://moguapp.mogujie.com/v2/news/imgList?_cityId=13a&newsId=%@"
//交互
#define BRANDINTERJUMP @"http://moguapp.mogujie.com/brand/interactive?_cityId=13a"
#define BRANDINTERJOINJUMP @"http://moguapp.mogujie.com/brand/interactive?_cityId=13a&brandId=%@"

#define BRANDINTERDATAL @"http://moguapp.mogujie.com/brand/interactive?_cityId=13a&mpage=%ld"
//品牌资讯跳转视频拼接取值
#define BRANDNEWLISTJUMP @"http://moguapp.mogujie.com/news/detail?_cityId=13a&newsId=%@"
#define BRANDBNEWLISTJUMPCELL @"http://moguapp.mogujie.com/v2/brand/getBrandNews?brandId=%@&_cityId=13a"
#define BRANDITEMJUMP @"http://moguapp.mogujie.com/v2/brand/moreItem?_cityId=13a&brandId=%@"

#endif