//
//  MDMenuView.h
//  MDButtonScrollMenu
//
//  Created by 姜孟东 on 17/2/21.
//  Copyright © 2017年 姜孟东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDMenuView : UIView

//标题数组
@property (nonatomic, strong)NSArray *TitleArray;

//按钮数组
@property (nonatomic, strong)NSMutableArray *ButtonArray;

//下面的线
@property (nonatomic, weak)UIView *BottomLine;

//中间的线
@property (nonatomic, weak)UIView *midLine;

//选中的按钮
@property (nonatomic, strong)UIButton *selectButton;

//将scorllview传进来
@property (nonatomic, strong)UIScrollView *scrollView;

//可以自定义传移动的距离，否则默认移动scrollview的宽
@property (nonatomic, assign)CGFloat scrollViewOffSetWidht;

//可以设置scrollview滚动的动画时间 默认是0.25
@property (nonatomic, assign)CGFloat animateWithDuration;

//在滚动时调用这个方法,按钮才会岁scrollview的滚动而变化
- (void)ScrollviewWidhtBottomLineViewScroll:(UIScrollView *)scrollview;

//设置正常状态的按钮文字颜色
@property (nonatomic, strong)UIColor *ButtonTitleNormalColor;

//设置选中状态的按钮文字颜色
@property (nonatomic, strong)UIColor *ButtonTitleSelectedColor;

@end
