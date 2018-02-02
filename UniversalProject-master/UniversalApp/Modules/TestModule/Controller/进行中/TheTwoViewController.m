//
//  TheTwoViewController.m
//  YiShopkeeper
//
//  Created by  apple on 2017/11/28.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "TheTwoViewController.h"
#import "SegmentTapView.h"
#import "FlipTableView.h"




#import "MyOrderTableViewCell.h"
#import "DingDanXiangQingSViewController.h"
#import "JinxingzhongdaiquerenViewController.h"
#import "JinxingzhongdaidaodaViewController.h"
#import "JinxingzhongyiwangongViewController.h"
#import "JinxingzhongdaiyanshouViewController.h"
@interface TheTwoViewController ()<SegmentTapViewDelegate,FlipTableViewDelegate>
@property (nonatomic, strong)SegmentTapView *segment;
@property (nonatomic, strong)FlipTableView *flipView;
@property (strong, nonatomic) NSMutableArray *controllsArray;

@end

@implementation TheTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSegment];
    [self initFlipTableView];
}

-(void)initSegment{
    self.segment = [[SegmentTapView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40) withDataArray:[NSArray arrayWithObjects:@"待确认",@"待到达",@"待完工",@"待验收", nil] withFont:15];
    self.segment.delegate = self;
    [self.view addSubview:self.segment];
}


-(void)initFlipTableView{
    if (!self.controllsArray) {
        self.controllsArray = [[NSMutableArray alloc] init];
    }
    JinxingzhongdaiquerenViewController *OneVC = [[JinxingzhongdaiquerenViewController alloc]init];
    OneVC.Navi = self.Navi;
    
    JinxingzhongdaidaodaViewController *TwoVC = [[JinxingzhongdaidaodaViewController alloc]init];
    TwoVC.Navi = self.Navi;
    
    JinxingzhongyiwangongViewController *ThreeVC = [[JinxingzhongyiwangongViewController alloc]init];
    ThreeVC.Navi = self.Navi;
    
    JinxingzhongdaiyanshouViewController *FourVC = [[JinxingzhongdaiyanshouViewController alloc]init];
    FourVC.Navi = self.Navi;
    
    [self.controllsArray addObject:OneVC];
    [self.controllsArray addObject:TwoVC];
    [self.controllsArray addObject:ThreeVC];
    [self.controllsArray addObject:FourVC];
    
    self.flipView = [[FlipTableView alloc] initWithFrame:CGRectMake(0, 40, kScreenWidth, self.view.frame.size.height - 40) withArray:_controllsArray];
    self.flipView.delegate = self;
    [self.view addSubview:self.flipView];
}
#pragma mark -------- select Index
-(void)selectedIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    [self.flipView selectIndex:index];
    
}
-(void)scrollChangeToIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    [self.segment selectIndex:index];
}

@end
