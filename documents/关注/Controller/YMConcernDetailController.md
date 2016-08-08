# YMConcernDetailController.swift


类似关注的主页底部导航条的实现方式一直没有思路，直到无意间在网上看到这个帖子 
[怎么像 safari 一样滑动时隐藏navigationbar](http://blog.sina.com.cn/s/blog_4cd8dd130102va7m.html)。然后立即拿出手机打开 safari 滑动了一下，感觉还今日头条的效果有些类似，safari 使用的是下面的代码：

```
navigationController.hidesBarsOnSwipe = YES;
```

