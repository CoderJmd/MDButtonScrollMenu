//
//  MDMenuView.m
//  MDButtonScrollMenu
//
//  Created by 姜孟东 on 17/2/21.
//  Copyright © 2017年 姜孟东. All rights reserved.
//

#import "MDMenuView.h"

#define ScreenWidht [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface MDMenuView()<UIScrollViewDelegate>



@end

@implementation MDMenuView
//初始化按钮数组
- (NSMutableArray *)ButtonArray {
    
    if (_ButtonArray == nil) {
        
        
        _ButtonArray = [NSMutableArray array];
        
    }
    
    return _ButtonArray;
    
}

//初始化文字数组
- (void)setTitleArray:(NSArray *)TitleArray {
    
    
    _TitleArray = TitleArray;
    
    //在这里调用按钮的的初始化方法
    [self setUpButton:_TitleArray];
}
//设置按钮文字的正常颜色
- (void)setButtonTitleNormalColor:(UIColor *)ButtonTitleNormalColor {
    
    _ButtonTitleNormalColor = ButtonTitleNormalColor;
    
    for (UIButton *button in self.ButtonArray) {
        
        [button setTitleColor:ButtonTitleNormalColor forState:UIControlStateNormal];
    }
    
}
//设置按钮的选中颜色
- (void)setButtonTitleSelectedColor:(UIColor *)ButtonTitleSelectedColor {
    
    _ButtonTitleSelectedColor = ButtonTitleSelectedColor;
    
    for (UIButton *button in self.ButtonArray) {
        
        [button setTitleColor:ButtonTitleSelectedColor forState:UIControlStateSelected];
        self.BottomLine.backgroundColor = ButtonTitleSelectedColor;
        
    }
    
    
}

#pragma -mark 按钮的初始化
- (void)setUpButton:(NSArray *)titleArray {
    
    //查看有几个标题
    NSInteger titleCount = titleArray.count;
    //初始化button
    for (int i = 0; i < titleCount; i++) {
        
        double buttonW = self.bounds.size.width / titleCount;
        
        double buttonH = self.bounds.size.height;
        
        double buttonX = i * buttonW;
        
        double buttonY = 0;
        
        //创建按钮
        UIButton *button = [[UIButton alloc]init];
        //按钮的位置
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //按钮的标题奥
        NSString *title = titleArray[i];
        [button setTitle:title forState:UIControlStateNormal];
        //按钮的tag
        button.tag = i;
        //将按钮添加到按钮数组里
        [self.ButtonArray addObject:button];
        //添加按钮的点击事件
        [button addTarget:self action:@selector(ClickButton:) forControlEvents:UIControlEventTouchUpInside];
        //将按钮添加到view上
        [self addSubview:button];
        //按钮的标题颜色
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //添加中间竖线
        if (i != 0) {
            
            UIView *lin = [[UIView alloc]init];
            lin.backgroundColor = [UIColor blackColor];
            lin.frame =  CGRectMake(buttonW * i, 0, 1, buttonH / 1.5);
            //设置线的中心点
            CGPoint centr = CGPointMake(lin.center.x, button.center.y);
            lin.center = centr;
            [self addSubview:lin];
            
        }
        
        //添加滚动的view
        if (i == 0) { // 默认选中第0个按钮
            
            // 添加下划线
            UIView *underLineView = [[UIView alloc] init];
            underLineView.backgroundColor = [UIColor blackColor];
            // frame
            // 设置
            underLineView.frame = CGRectMake(0, buttonH - 1, buttonW / 1.5, 1);
            //设置线的中心点
            CGPoint centr = CGPointMake(button.center.x, underLineView.center.y);
            underLineView.center = centr;
            
            self.BottomLine = underLineView;
            
            [self addSubview:underLineView];
            [self ClickButton:button];
        }
        

        
    }
    
    
}

//点击事件
- (void)ClickButton:(UIButton *)button {
    
    // 获取角标
    NSInteger i = button.tag;
    
    // 选中按钮
    [self selButton:button];
    
    // 滚动到对应位置
    CGFloat offsetX = i * _scrollView.frame.size.width;
    //如果自定义了距离可以移动自定义的距离
    if (self.scrollViewOffSetWidht != 0) {
        offsetX = i * self.scrollViewOffSetWidht;
    }

    // 设置动画
    CGFloat Duration = 0.25;
    if (self.animateWithDuration != 0) {
        
        Duration = self.animateWithDuration;
    }
    
    [UIView animateWithDuration:Duration animations:^{
        
        self.scrollView.contentOffset = CGPointMake(offsetX, 0);
        
    }];
    
}

#pragma mark - 选中按钮
- (void)selButton:(UIButton *)button {
    
    self.selectButton.selected = NO;//
    button.selected = YES;//
    self.selectButton = button;
    // 移动下划线位置
    [UIView animateWithDuration:0.25 animations:^{
        
        CGPoint centr = CGPointMake(button.center.x, self.BottomLine.center.y);
        self.BottomLine.center = centr;
        
        
    }];
    
}

#pragma -mark 实现scrollview的代理方法
- (void)ScrollviewWidhtBottomLineViewScroll:(UIScrollView *)scrollview {
   
    NSInteger page = scrollview.contentOffset.x / self.frame.size.width;
    
    if (page >= self.ButtonArray.count) {
        printf("ScrollView的Page大于按钮个数,请重新设置\n");
        return;
    }
    
    // 获取按钮
    UIButton *btn = self.ButtonArray[page];
    // 选中按钮
    [self selButton:btn];
    
}


@end
