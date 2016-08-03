# YMHomeViewController.swift


首先，首页的状态栏的颜色是白色，所以调用了下面的方法：

```
override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
```

但是，经过测试，上面的代码不起作用，对于 `YMMineViewController.swift` 上面的代码是起作用的。

唯一的区别是就是在 `YMMineViewController.swift` 中隐藏了导航条。所以经过查阅资料，得到下面的结论：
> 1.不管是调用了系统的 `UINavigationController` 还是使用自己继承自 `UINavigationController`，如果 `navigationBar` 没有被隐藏的话，那么导航控制器的 `rootController` 以及它 `push` 的控制器的 `preferredStatusBarStyle()` 方法都不会被调用。
> 2.如果在当前控制器手动设置了 `navagationBar` 的 `barStyle` 为 `.Black` 或者使用下面的代码手动设置：

```
// 方式1
navigationController?.setNavigationBarHidden(true, animated: false)
// 方式2
navigationController?.navigationBarHidden = true
```

那么 `preferredStatusBarStyle()` 就会被正常调用了。

还有一点关于隐藏导航栏的注意点请看 [YMMineViewController.swift](YMMineViewController.md)。
