# HBPmd
实现轮播文字，以及弹幕

```
{

  	HBdansView *_randomDansView;
  
}

 	_randomDansView = [[HBdansView alloc] initWithFrame:CGRectMake(0, 84, self.view.width, 320)]; //初始化
 
 	[self.view addSubview:_randomDansView];

	[_randomDansView addRandomText:@"需要展现的文字"];

```
