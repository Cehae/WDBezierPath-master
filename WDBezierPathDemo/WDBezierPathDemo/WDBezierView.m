//
//  WDBezierView.m
//  WDBezierPathDemo
//
//  Created by apple on 2017/11/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WDBezierView.h"
#import "UIBezierPath+WDTools.h"

@implementation WDBezierView

- (void)drawRect:(CGRect)rect
{
    
    [super drawRect:rect];


   //黄线
    UIBezierPath.WD_path.WD_maker.WD_moveTo(30,50).WD_addLineTo(100,70).WD_color(UIColor.yellowColor).WD_lineWidth(10).WD_stroke();
    
  //蓝线
    UIBezierPath.WD_path.WD_maker.WD_moveTo(100,30).WD_addLineTo(150,30).WD_color(UIColor.blueColor).WD_lineWidth(3).WD_stroke();
    
  //红线
    UIBezierPath.WD_path.WD_maker.WD_moveTo(20,200).WD_addLineTo(200,200).WD_addLineTo(130,300).WD_addLineTo(130,450).WD_addLineTo(90,380).WD_addLineTo(50,200).WD_addLineTo(250,450).WD_addLineTo(250,450).WD_addLineTo(300,380).WD_lineWidth(7).WD_lineCapStyle(kCGLineCapRound).WD_lineJoinStyle(kCGLineJoinRound).WD_color(UIColor.redColor).WD_stroke();
}
@end
