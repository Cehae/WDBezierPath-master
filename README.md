# WDBezierPath-master
利用链式编程和贝瑟尔曲线来画图


关于什么是链式编程思想以及链式编程的好处，网上相关资料很多，这里就不赘述了。著名的iOS自动布局库Masonry，就是利用链式编程，使用起来简洁，可读性好。仿照Masonry，我写了一个利用链式编程和贝瑟尔曲线实现绘图的分类，使用如下：

```
- (void)drawRect:(CGRect)rect
{
    
    [super drawRect:rect];


   //画黄线
    UIBezierPath.WD_path.WD_maker.WD_moveTo(30,50).WD_addLineTo(100,70).WD_color(UIColor.yellowColor).WD_lineWidth(10).WD_stroke();
    
  //画蓝线
    UIBezierPath.WD_path.WD_maker.WD_moveTo(100,30).WD_addLineTo(150,30).WD_color(UIColor.blueColor).WD_lineWidth(3).WD_stroke();
    
  //画红线
    UIBezierPath.WD_path.WD_maker.WD_moveTo(20,200).WD_addLineTo(200,200).WD_addLineTo(130,300).WD_addLineTo(130,450).WD_addLineTo(90,380).WD_addLineTo(50,200).WD_addLineTo(250,450).WD_addLineTo(250,450).WD_addLineTo(300,380).WD_lineWidth(7).WD_lineCapStyle(kCGLineCapRound).WD_lineJoinStyle(kCGLineJoinRound).WD_color(UIColor.redColor).WD_stroke();
}
```

效果图:

![效果图](http://img.blog.csdn.net/20171103165652238?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQ2VoYWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

从上述代码中可以看到，我们利用链式编程可以做到用一行代码实现绘图，有兴趣的小伙伴可以Star，[Demo传送门](https://github.com/Cehae/WDBezierPath-master)，[博客传送门](http://blog.csdn.net/Cehae/article/details/78437524)。