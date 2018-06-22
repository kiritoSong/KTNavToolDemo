//
//  ViewController.m
//  KTNavViewDemo
//
//  Created by 刘嵩野 on 2018/6/22.
//  Copyright © 2018年 kirito_song. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "NavView.h"
#import "UIView+LayoutMethods.h"
#import "KTNavScrollTool.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) KTNavScrollTool * scrollTool1;
@property (nonatomic) KTNavScrollTool * scrollTool2;
@property (nonatomic) KTNavScrollTool * scrollTool3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.scrollView];
    
    
    //没啥意义、只是为了让3个nav一开始就添加到屏幕上。懒得改代码了
    [self.scrollTool1 configLingWithOffsetRate:0];
    [self.scrollTool2 configLingWithOffsetRate:0];
    [self.scrollTool3 configLingWithOffsetRate:0];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.scrollView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, self.view.bounds.size.height);

}


#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat offsetRate = offsetX/self.view.width;
    
    
    //将偏移率传递给KTNavScrollTool执行动画
    
    [self.scrollTool1 configLingWithOffsetRate:offsetRate];
    [self.scrollTool2 configLingWithOffsetRate:offsetRate];
    [self.scrollTool3 configLingWithOffsetRate:offsetRate];
    
    
}



- (KTNavScrollTool *)scrollTool1 {
    if (!_scrollTool1) {
        NavView *navView = [[NavView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 30)];
        navView.titleCount = 3;
        [self.view addSubview:navView];
        _scrollTool1 = [[KTNavScrollTool alloc]initWithTitleArr:navView.titleLabMArr line:navView.line];
    }
    return _scrollTool1;
}


- (KTNavScrollTool *)scrollTool2 {
    if (!_scrollTool2) {
        NavView *navView = [[NavView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 30)];
        navView.titleCount = 5;
        [self.view addSubview:navView];
        _scrollTool2 = [[KTNavScrollTool alloc]initWithTitleArr:navView.titleLabMArr line:navView.line];
    }
    return _scrollTool2;
}



- (KTNavScrollTool *)scrollTool3 {
    if (!_scrollTool3) {
        NavView *navView = [[NavView alloc]initWithFrame:CGRectMake(0, 150, self.view.bounds.size.width, 30)];
        navView.titleCount = 7;
        [self.view addSubview:navView];
        _scrollTool3 = [[KTNavScrollTool alloc]initWithTitleArr:navView.titleLabMArr line:navView.line];
    }
    return _scrollTool3;
}



- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.delegate = self;
        
        for (NSInteger i = 0; i < 5; i++) {
            UIView * view = [[UIView alloc]initWithFrame:CGRectMake(self.view.width * i, 0, self.view.width, self.view.height)];
            if (i%2) {
                view.backgroundColor = [UIColor grayColor];
            }else {
                view.backgroundColor = [UIColor brownColor];
            }
            
            [_scrollView addSubview:view];
        }
        
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        
    }
    return _scrollView;
}


@end
