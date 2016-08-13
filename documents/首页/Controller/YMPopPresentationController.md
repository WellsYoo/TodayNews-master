# YMPopPresentationController.swift

## iOS 8 以后推出的专门负责转场动画的控制器。

在 Xcode 7 以上的版本中，`UIPresentationController` 有一个 bug，见下图：

![野指针](http://obna9emby.bkt.clouddn.com/news/home-pop-error.png)

`presentingViewController` 会报一个野指针的错误，这是 Xcode 的 bug。

## `UIPresentationController` 中有两个方法可以布局子视图，分别是：

```
// 即将布局转场子视图时调用
public func containerViewWillLayoutSubviews()
// 布局完成转场子视图时调用
public func containerViewDidLayoutSubviews()
```
可以在两个方法里设置 `UIPresentationController` 的容器视图 `containerView` 和 被展现的视图 `presentedView()`。

![containerView-presentedView](http://obna9emby.bkt.clouddn.com/news/containerView-presentedView.png)


