# HBPmd

![设计图.jpg](http://7xnt2l.com1.z0.glb.clouddn.com/设计图.jpg)

实现跑马灯，以及弹幕

```
{

  	HBdansView *_randomDansView;
  
}

 	_randomDansView = [[HBdansView alloc] initWithFrame:CGRectMake(0, 84, self.view.width, 320)]; //初始化
 
 	[self.view addSubview:_randomDansView];

	[_randomDansView addRandomText:@"需要展现的文字"];

```
## Tip
* 本项目仅支持`文字弹幕`，后续会持续更新。
* 实现思路仅来源项目需求，所以不是完全适用所有需求场景。