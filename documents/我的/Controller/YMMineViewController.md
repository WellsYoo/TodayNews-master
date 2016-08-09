# YMMineViewController.swift

![](http://obna9emby.bkt.clouddn.com/news/%E6%88%91%E7%9A%84-%E6%9C%AA%E7%99%BB%E5%BD%95_spec.png)

![](http://obna9emby.bkt.clouddn.com/news/%E6%88%91%E7%9A%84.png)

隐藏导航栏的方法如下：

```
// 方式1
navigationController?.setNavigationBarHidden(true, animated: false)
// 方式2
navigationController?.navigationBarHidden = true
```

需要注意一点，隐藏导航栏的属性写到 `viewDidLoad()` 里不起作用。