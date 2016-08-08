# YMMineViewController.swift

隐藏导航栏的方法如下：

```
// 方式1
navigationController?.setNavigationBarHidden(true, animated: false)
// 方式2
navigationController?.navigationBarHidden = true
```

需要注意一点，隐藏导航栏的属性写到 `viewDidLoad()` 里不起作用。