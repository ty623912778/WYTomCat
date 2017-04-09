//
//  ViewController.m
//  WYTomCat
//
//  Created by mac on 15/9/16.
//  Copyright (c) 2015年 mac. All rights reserved.

//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)btnCymbal;
- (IBAction)btnDrink;
- (IBAction)btnEat;
- (IBAction)btnFart;
- (IBAction)btnScratch;
- (IBAction)btnPie;
- (IBAction)btnKnock;
- (IBAction)btnFootLeft;
- (IBAction)btnFootRight;
- (IBAction)btnStomach;
@property (weak, nonatomic) IBOutlet UIImageView *tomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)btnCymbal {
     [self playAnimationWithName:@"cymbal" imgCount:13];
//    NSMutableArray *arr=[NSMutableArray array];
//    //创建一个动态数组来保存所有要播放的图片
//    
//    for (int i=0; i<13; i++) {
//        NSString * file=[NSString stringWithFormat:@"cymbal_%02d.jpg",i];
//        UIImage *img=[UIImage imageNamed:file];
//        [arr addObject:img];//图片加载到数组中
//        
//    }
//    //把要播放的图片加载到uiimageview中
//    self.tomView.animationImages=arr;
//    //设置播放时间   快/慢
//    self.tomView.animationDuration=arr.count*0.1;
//    //设置播放次数
//    self.tomView.animationRepeatCount=1;
//    //启动播放
//    [self.tomView startAnimating];
}

- (IBAction)btnDrink {
    [self playAnimationWithName:@"drink" imgCount:81];

//    NSMutableArray *arr1=[NSMutableArray array];
//    for (int i=0; i<81; i++) {
//        NSString *file1=[NSString stringWithFormat:@"drink_%02d.jpg",i];
//        UIImage *img1=[UIImage imageNamed:file1];
//        [arr1 addObject:img1];
//    }
//    
//    self.tomView.animationRepeatCount=1;
//    self.tomView.animationDuration=3;
//    self.tomView.animationImages=arr1;
//    [self.tomView startAnimating];
}

- (IBAction)btnEat {
    [self playAnimationWithName:@"eat" imgCount:40];

//    NSMutableArray *arr2=[NSMutableArray array];
//    for (int i=0; i<40; i++) {
//        NSString *file2=[NSString stringWithFormat:@"eat_%02d.jpg",i];
//        UIImage *img2=[UIImage imageNamed:file2];
//        [arr2 addObject:img2];
//    }
//    self.tomView.animationImages=arr2;
//    self.tomView.animationRepeatCount=1;
//    self.tomView.animationDuration=2;
//    [self.tomView startAnimating];
}

- (IBAction)btnFart {
//    NSMutableArray *arr3=[NSMutableArray array];
//    for (int i=0; i<28; i++) {
//        NSString *file3=[NSString stringWithFormat:@"fart_%02d.jpg",i];
//        UIImage *img3=[UIImage imageNamed:file3];
//        [arr3 addObject:img3];
//    }
//    self.tomView.animationDuration=1.5;
//    self.tomView.animationImages=arr3;
//    self.tomView.animationRepeatCount=1;
//    [self.tomView startAnimating];
[self playAnimationWithName:@"fart" imgCount:28];
    
}

- (IBAction)btnScratch {
     [self playAnimationWithName:@"scratch" imgCount:56];
//    NSMutableArray *arr4=[NSMutableArray array];
//    for (int i=0; i<56; i++) {
//        NSString *file4=[NSString stringWithFormat:@"scratch_%02d.jpg",i];
//        UIImage *img4=[UIImage imageNamed:file4];
//        [arr4 addObject:img4];
//
//    }
//    self.tomView.animationRepeatCount=1;
//    self.tomView.animationImages=arr4;
//    self.tomView.animationDuration=2.5;
//    [self.tomView startAnimating];
}

- (IBAction)btnPie {
    [self playAnimationWithName:@"pie" imgCount:24];
//    NSMutableArray *arr5=[NSMutableArray array];
//    for (int i=0; i<24; i++) {
//        NSString *file5=[NSString stringWithFormat:@"pie_%02d.jpg",i];
//        UIImage *img5=[UIImage imageNamed:file5];
//        [arr5 addObject:img5];
//        
//    }
//    self.tomView.animationDuration=1.5;
//    self.tomView.animationImages=arr5;
//    self.tomView.animationRepeatCount=1;
//    [self.tomView startAnimating];
}
//注意抽取方法的原则
//把公共的内容放到方法中，把不同的当成参数
-(void)playAnimationWithName:(NSString *)fileName imgCount:(int)imgCount
{
    if (self.tomView.isAnimating) {
        //表明当前正在播放图片
        return ;//不再播放其他动画
    }
    NSMutableArray *arr6=[NSMutableArray array];
    for (int i=0; i<imgCount; i++) {
        NSString *file6=[NSString stringWithFormat:@"%@_%02d.jpg",fileName,i];
        NSString *path=[[NSBundle mainBundle]pathForResource:file6 ofType:nil ];
        UIImage *img=[UIImage imageWithContentsOfFile:path];
    
        //
        //UIImage *img6=[UIImage imageNamed:file6];//直接从bundle中加载图片
        //如果使用这种方法来加载图片，系统会自动缓存这些图片
        //不缓存图片
        [arr6 addObject:img];
    }
    self.tomView.animationRepeatCount=1;
    self.tomView.animationImages=arr6;
    self.tomView.animationDuration=4;
    [self.tomView startAnimating];
    //self.tomView.animationImages=nil;此方法延迟执行
    //动画
    //1.数组存放图片
    //2.把所有图片放到view
    //3.设置播放时间等，启动播放
    //延迟执行方法的方法
    //优化内存
    CGFloat time=self.tomView.animationRepeatCount*self.tomView.animationDuration;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.tomView.animationImages=nil;//清除动画图片
//    });
    //第二中清除方法
    [self.tomView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:time];//过段时间以后执行方法
   // [self.tomView setAnimationImages:nil];
    //必须使用imageWithContentOfFile来加载图片
    //当播放完所有的图片以后一定要清空uiimageview动画数组中所有图片
    
}

//敲击头部
- (IBAction)btnKnock {
    [self playAnimationWithName:@"knockout" imgCount:81];
//    NSMutableArray *arr6=[NSMutableArray array];
//    for (int i=0; i<81; i++) {
//        NSString *file6=[NSString stringWithFormat:@"knockout_%02d.jpg",i];
//        UIImage *img6=[UIImage imageNamed:file6];
//        [arr6 addObject:img6];
//    }
//    self.tomView.animationRepeatCount=1;
//    self.tomView.animationImages=arr6;
//    self.tomView.animationDuration=4;
//    [self.tomView startAnimating];

}

- (IBAction)btnFootLeft {
    [self playAnimationWithName:@"footRight" imgCount:30];
//    NSMutableArray *arr7=[NSMutableArray array];
//    for (int i=0; i<30; i++) {
//        NSString *file7=[NSString stringWithFormat:@"footRight_%02d.jpg",i];
//        UIImage *img7=[UIImage imageNamed:file7];
//        [arr7 addObject:img7];
//    }
//    self.tomView.animationRepeatCount=1;
//    self.tomView.animationImages=arr7;
//    self.tomView.animationDuration=1.5;
//    [self.tomView startAnimating];
}

- (IBAction)btnFootRight {
    [self playAnimationWithName:@"footLeft" imgCount:30];
//    NSMutableArray *arr7=[NSMutableArray array];
//    for (int i=0; i<30; i++) {
//        NSString *file7=[NSString stringWithFormat:@"footLeft_%02d.jpg",i];
//        UIImage *img7=[UIImage imageNamed:file7];
//        [arr7 addObject:img7];
//    }
//    self.tomView.animationRepeatCount=1;
//    self.tomView.animationImages=arr7;
//    self.tomView.animationDuration=1.5;
//    [self.tomView startAnimating];
}

- (IBAction)btnStomach {
    [self playAnimationWithName:@"stomach" imgCount:34];

//    NSMutableArray *arr7=[NSMutableArray array];
//    for (int i=0; i<34; i++) {
//        NSString *file7=[NSString stringWithFormat:@"stomach_%02d.jpg",i];
//        UIImage *img7=[UIImage imageNamed:file7];
//        [arr7 addObject:img7];
//    }
//    self.tomView.animationRepeatCount=1;
//    self.tomView.animationImages=arr7;
//    self.tomView.animationDuration=1.5;
//    [self.tomView startAnimating];
}

@end
