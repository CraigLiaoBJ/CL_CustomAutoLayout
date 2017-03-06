//
//  AutoLayoutShowViewController.m
//  CustomAutoLayout
//
//  Created by Craig Liao on 2017/3/5.
//  Copyright © 2017年 Craig Liao. All rights reserved.
//

#import "AutoLayoutShowViewController.h"
#import "UIView+CustomAutoLayout.h"

@implementation AutoLayoutShowViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.titleName;

    switch (self.indexChoosed) {
        case 0:
            [self example0];
            break;
        case 1:
            [self example1];
            break;
        case 2:
            [self example2];
            break;
        case 3:
            [self example3];
            break;
        case 4:
            [self example4];
            break;
        case 5:
            [self example5];
            break;
        case 6:
            [self example6];
            break;
        case 7:
            [self example7];
            break;
        case 8:
            [self example8];
            break;
        default:
            break;
    }    
}

#pragma mark -- 同一控件内两子之空间之间的相对位置
- (void)example0{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view1.backgroundColor = [UIColor yellowColor];
    view1.alpha = 0.5f;
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view2];
    
    //布局
    [view2 sizeWith:CGSizeMake(20, 20)];
    [view2 layoutBelow:view1 margin:10];
    [view2 layoutToLeftOf:view1 margin:10];
}

#pragma mark -- 填充式布局
- (void)example1{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view1.backgroundColor = [UIColor yellowColor];
    view1.alpha = 0.5f;
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [view1 addSubview:view2];
    
    //布局
    [view2 sizeWith:CGSizeMake(20, 20)];
    [view2 scaleToAboveOf:view1];
    [view2 scaleToLeftOf:view1];
}

#pragma mark -- 相对父控件进行填充
- (void)example2{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view1.backgroundColor = [UIColor yellowColor];
    view1.alpha = 0.5f;
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [view1 addSubview:view2];
    
    //布局
    [view2 sizeWith:CGSizeMake(20, 20)];
    [view2 scaleToParentTop];
    [view2 scaleToParentLeft];
}

#pragma mark -- 同一控件内两子之控件之间的对齐关系
- (void)example3{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view1.backgroundColor = [UIColor yellowColor];
    view1.alpha = 0.5f;
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [view1 addSubview:view2];
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor cyanColor];
    [view1 addSubview:view3];
    
    //view2相对于父视图进行填充布局
    [view2 sizeWith:CGSizeMake(20, 20)];
    [view2 scaleToParentTop];
    [view2 scaleToParentLeft];
    
    //view3 的布局和view2进行对齐
    [view3 sizeWith:CGSizeMake(20, 20)];
    [view3 alignTop:view2];
    [view3 alignLeft:view2 margin:30];
}

#pragma mark -- 与父控件对齐的关系
- (void)example4{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view1.backgroundColor = [UIColor yellowColor];
    view1.alpha = 0.5f;
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [view1 addSubview:view2];
    
    //布局
    [view2 sizeWith:CGSizeMake(20, 20)];
    [view2 alignParentBottom];
    [view2 alignParentRightWithMargin:20];
}

#pragma mark -- 与父控件的边距
- (void)example5{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view1.backgroundColor = [UIColor yellowColor];
    view1.alpha = 0.5f;
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [view1 addSubview:view2];
    
    //布局
    [view2 sizeWith:CGSizeMake(20, 20)];
    [view2 marginParetnTop:10 bottom:20 left:10 rigth:10];
}

#pragma mark -- 控件在父控控件中的位置
- (void)example6{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view1.backgroundColor = [UIColor yellowColor];
    view1.alpha = 0.5f;
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [view1 addSubview:view2];
    
    //布局
    [view2 sizeWith:CGSizeMake(20, 20)];
    [view2 layoutParentHorizontalCenter];
    [view2 layoutParentVerticalCenter];
}

#pragma mark -- 与其他控件的大小关系
- (void)example7{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view1.backgroundColor = [UIColor yellowColor];
    view1.alpha = 0.5f;
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [view1 addSubview:view2];
    
    //布局
    [view2 sizeWith:CGSizeMake(100, 100)];
    [view2 layoutParentHorizontalCenter];
    [view2 layoutParentVerticalCenter];
    [view2 shrink:CGSizeMake(10, 10)];//每边缩小了
}

#pragma mark -- 使views以Grid方式均匀显示
- (void)example8{
    NSMutableArray *viewArray = [NSMutableArray array];
    for (int i = 0; i < 3; i ++) {
        UIView *view1 = [[UIView alloc] init];
        view1.backgroundColor = [UIColor yellowColor];
        view1.alpha = 0.5f;
        [self.view addSubview:view1];
        [viewArray addObject:view1];
    }
    
    [self.view gridViews:viewArray inColumn:viewArray.count size:CGSizeMake(50, 50)  margin:CGSizeMake(10, 20) inRect:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
    
}
@end
