# MDButtonScrollMenu
###通过传入数组的按钮标题,来批量生成按钮,并且添加ScrollView跟随按钮点击而滚动
###![](https://github.com/CoderJmd/MDButtonScrollMenu/blob/master/MDButtonScrollMenu/2017-02-21%2013_30_26.gif)
## 使用说明:
```objc
    //创建
    MDMenuView *view = [[MDMenuView alloc]init];
    //分配frame
    view.frame = CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 40);
    //传入数组标题.创建按钮
    view.TitleArray = @[@"订单",@"菜单",@"全部",];
    //添加到view上
    [self.view addSubview:view];
    //将需要滚动的scrollView通过属性方法出入
    view.scrollView = scrollview;
    //设置按钮标题的选中颜色
    view.ButtonTitleSelectedColor = [UIColor redColor];
    //设置按钮标题的正常颜色
    view.ButtonTitleNormalColor =[UIColor blackColor];
 ```
 ####在scorllView滚动的时候调用menView的方法即可实现按钮随ScrollView的滚动而改变
 ```objc
     //在ScrollView滚动完成的代理方法内实现这个方法
    [self.mdview ScrollviewWidhtBottomLineViewScroll:scrollView];
 
