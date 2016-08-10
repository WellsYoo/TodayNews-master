# YMHomeViewController.swift


![首页-1](http://obna9emby.bkt.clouddn.com/news/%E9%A6%96%E9%A1%B5-1_spec.png)

## 1.首先，首页的状态栏的颜色是白色，所以调用了下面的方法：

```
override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
```

但是，经过测试，上面的代码不起作用，对于 `YMMineViewController.swift` 上面的代码是起作用的。

唯一的区别是就是在 `YMMineViewController.swift` 中隐藏了导航条。所以经过查阅资料，得到下面的结论：
> 1.不管是调用了系统的 `UINavigationController` 还是使用自己继承自 `UINavigationController`，如果 `navigationBar` 没有被隐藏的话，那么导航控制器的 `rootController` 以及它 `push` 的控制器的 `preferredStatusBarStyle()` 方法都不会被调用。
> 2.如果在当前控制器手动设置了 `navagationBar` 的 `barStyle` 为 `.Black` 或者 `.Default` 或者使用下面的代码手动设置：

```
// 方式1
navigationController?.setNavigationBarHidden(true, animated: false)
// 方式2
navigationController?.navigationBarHidden = true
```

那么 `preferredStatusBarStyle()` 就会被正常调用了。

还有一点关于隐藏导航栏的注意点请看 [YMMineViewController.swift](YMMineViewController.md)。

## 2.关于导航栏的 titleView

在首页首页顶部标题的时候，直接设置 titleView 的宽度为屏幕的宽，但是两边总是会留出 10 的间距，这个时候需要重写父类的 setFrame 方法，在 OC 里面可以使用下面的方法：

```

- (void)setFrame:(CGRect)frame  
{  
    CGRect newFrame = CGRectMake(0, 0, SCREENW, 44);
    [super setFrame:frame];  
} 
```

但是在 swift 中不能这样写，要使用下面的方式：

```
/// 重写 frame
override var frame: CGRect {
    didSet {
        let newFrame = CGRectMake(0, 0, SCREENW, 44)
        super.frame = newFrame
    }
}
```

这样设置，运行程序，发现 titleView 在屏幕两边不在留有间距。

## 3.子控制器

`YMHomeTopicController.swift` 作为 `YMHomeViewController.swift`的子控制器，显示新闻数据。

