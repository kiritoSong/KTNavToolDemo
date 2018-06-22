//
//  KTNavScrollTool.m
//  KTNavViewDemo
//
//  Created by 刘嵩野 on 2018/6/22.
//  Copyright © 2018年 kirito_song. All rights reserved.
//

#import "KTNavScrollTool.h"
#import "UIView+LayoutMethods.h"


/**
 每个滚动单元的必要参数
 其实也可以每次都算、但是存起来效率高点而已
 */
@interface KTNavScrollToolItem : NSObject
//最大宽度
@property (nonatomic) CGFloat maxWidth;
//位于左侧时宽度
@property (nonatomic) CGFloat btn1Width;
//位于右侧时宽度
@property (nonatomic) CGFloat btn2Width;
//最左侧时x轴位移
@property (nonatomic) CGFloat translationofX_left;
//从左侧移到中心时x轴位移
@property (nonatomic) CGFloat translationofX_center;
//从中心移到右侧时x轴位移
//所以总位移就是_translationofX_center+_translationofX_right
@property (nonatomic) CGFloat translationofX_right;
//位于最左时形变
@property (nonatomic) CGFloat flagScale_left;
//位于中心时形变
@property (nonatomic) CGFloat flagScale_center;
//位于最右时形变
@property (nonatomic) CGFloat flagScale_right;

@end

@implementation KTNavScrollToolItem

@end;

@interface KTNavScrollTool()
@property (nonatomic) NSArray<UIView *> * titleArr;
@property (nonatomic) UIView * line;
@property (nonatomic) NSMutableArray<KTNavScrollToolItem *> *itemArr;
@end

@implementation KTNavScrollTool

- (instancetype)initWithTitleArr:(NSArray<UIView *> *)titleArr line:(UIView *)line
{
    self = [super init];
    if (self) {
        self.titleArr = titleArr;
        self.line = line;
        self.itemArr = [NSMutableArray new];
        for (NSInteger i = 1; i < titleArr.count; i++) {
            //将相邻的两个按钮的关系进行绑定
            KTNavScrollToolItem * item = [KTNavScrollToolItem new];
         
            item.btn1Width = titleArr[i -1].width;
            item.btn2Width = titleArr[i].width;
            item.maxWidth = titleArr[i].right - titleArr[i-1].left;
            if (i == 1) {
                //第一个 最左位移为0
                item.translationofX_left = 0;
            }else {
                //当前最左时位移 = 上一次最左时位移 + 中心位移 + 中心到最右位移
                item.translationofX_left = self.itemArr[i - 1 -1].translationofX_left + self.itemArr[i-1-1].translationofX_right  + self.itemArr[i - 1 -1].translationofX_center;
            }
            item.translationofX_center = (item.maxWidth - item.btn1Width)/2;
            item.translationofX_right = (item.maxWidth - item.btn2Width)/2;
            item.flagScale_left = item.btn1Width/titleArr[0].width;
            item.flagScale_center = item.maxWidth/titleArr[0].width;
            item.flagScale_right = item.btn2Width/titleArr[0].width;
            [self.itemArr addObject:item];
        }
    }
    return self;
}

- (void)configLingWithOffsetRate:(CGFloat)offsetRate {
    
    //整数部分
    int index = (int)offsetRate;
    //小数部分
    offsetRate = offsetRate - index;
    
    if (index<0 || index>self.itemArr.count-1) {
        return;
    }
    KTNavScrollToolItem * item = self.itemArr[index];
    
    if (0 <= offsetRate && offsetRate <= 0.5) {
        /*
         * 左侧与中间相互移动
         */
        
        //x轴位移 :: 中间时位移 * 偏移比例系数 + 当前最左位移
        CGFloat translationOfX = item.translationofX_center * offsetRate * 2 + item.translationofX_left;
        self.line.transform = CGAffineTransformMakeTranslation(translationOfX, 0);
        
        //x轴形变 :: 最左侧形变 + (最大时形变-最左时形变) * 偏移比例系数
        CGFloat flagScale = item.flagScale_left + (item.flagScale_center - item.flagScale_left) * (offsetRate * 2);
        self.line.transform = CGAffineTransformScale(self.line.transform, flagScale, 1);
        
        
    }else if (0.5 < offsetRate && offsetRate <= 1) {
        /*
         * 中间与右侧相互移动
         */
        
        //x轴位移 :: 中间时位移 + 最终位移 * 偏移比例系数 + 当前最左位移
        CGFloat translationOfX = item.translationofX_center + item.translationofX_right * (offsetRate - 0.5) * 2 + item.translationofX_left;
        self.line.transform = CGAffineTransformMakeTranslation(translationOfX, 0);
        
        //x轴形变 :: 最大时形变 - (最大形变 - 最右侧形变) * 偏移比例系数
        CGFloat flagScale = item.flagScale_center - (item.flagScale_center - item.flagScale_right) * (offsetRate - 0.5) * 2;

        self.line.transform = CGAffineTransformScale(self.line.transform, flagScale, 1);

    }
    
}
@end
