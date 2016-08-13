# YMPopViewAnimator.swift

## 负责转场动画的代理

自定义转场动画需要集成两个代理协议，分别是 `UIViewControllerTransitioningDelegate` 和 `UIViewControllerAnimatedTransitioning`。

如果需要自定义转场动画，那么所有的操作需要自己完成，系统不再处理。

## `UIViewControllerTransitioningDelegate` 

`UIViewControllerTransitioningDelegate` 共有五个代理方法，这里我用到了三个代理方法，分别是：

```
// MARK: - UIViewControllerTransitioningDelegate
    /**
     告诉系统由哪个控制器来实现代理
     - parameter presented:  被展现的视图
     - parameter presenting: 展现的视图
     - returns: YMPopPresentationController iOS 8 以后推出的专门负责转场动画的控制器
     */
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?
    /**
     告诉系统谁来负责 modal 的展现动画
     - parameter presented:  被展现的视图
     - parameter presenting: 展现的视图
     - returns: 由谁管理
     */
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    /**
     告诉系统谁来负责 modal 的消失动画
     - parameter dismissed: 消失的控制器
     - returns: 由谁管理
     */
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? 
```

## `UIViewControllerAnimatedTransitioning`

用到了两个代理方法：

```
/** 动画时长*/
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval 
    /** 负责转场动画的效果*/
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            // 展开
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            // 一定要将视图添加到容器上
            transitionContext.containerView()?.addSubview(toView!)
            // 锚点
            toView?.layer.anchorPoint = CGPoint(x: 1.0, y: 0.0)
            toView?.transform = CGAffineTransformMakeScale(0.0, 0.0)
            UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: 
```
