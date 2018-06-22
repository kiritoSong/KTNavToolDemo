//
//  NavView.h
//  KTNavViewDemo
//
//  Created by 刘嵩野 on 2018/6/22.
//  Copyright © 2018年 kirito_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavView : UIView
@property (nonatomic,readonly) NSMutableArray<UILabel *> * titleLabMArr;
@property (nonatomic,readonly) UIView * line;

/**
 想生成几个title
 */
@property (nonatomic) NSInteger titleCount;
@end
