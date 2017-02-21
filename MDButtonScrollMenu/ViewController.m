//
//  ViewController.m
//  MDButtonScrollMenu
//
//  Created by 姜孟东 on 17/2/21.
//  Copyright © 2017年 姜孟东. All rights reserved.
//

#import "ViewController.h"
#import "MDMenuView.h"
#import "OredrViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak)MDMenuView *mdview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    UIScrollView *scrollview = [[UIScrollView alloc]init];
    scrollview.frame = self.view.bounds;
    scrollview.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 4, 0);
    scrollview.delegate = self;
    scrollview.pagingEnabled = YES;
    [self.view addSubview:scrollview];
    
    OredrViewController *oredr = [[OredrViewController alloc]init];
    [scrollview addSubview:oredr.view];
    oredr.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    MDMenuView *view = [[MDMenuView alloc]init];
    view.frame = CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 40);
    view.TitleArray = @[@"菜单",@"选项",@"自定义",];
    [self.view addSubview:view];
    view.scrollView = scrollview;
    self.mdview = view;
    view.ButtonTitleSelectedColor = [UIColor redColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//滚动完成就会调用 (监听滚动,用代理)
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    [self.mdview ScrollviewWidhtBottomLineViewScroll:scrollView];
    
    
}

@end
