# YMScrollTitleView.swift

这个类和和视频顶部标题的类有些类似，对于数据和按钮点击的回调使用闭包的方式。而在视频的标题 `YMVideoTitleView.swift` 里使用代理来代替闭包，实现的功能是相同的，但是实现的方式不同，可以对比看一下。

对控件的布局方式还是使用的 `SnapKit` 来进行布局。

这个类里需要首先从服务器获取标题数据，服务器返回一个数组，根据这个数组循环创建标题的 `label`，然后设置好 `label` 的位置以及 `scrollView` 的 `contentSize`。

标题 label 的点击通过添加手势来实现监听点击操作，`titleLabelOnClick` 为标题点击的方法，当点击的时候，根据索引进行相应的偏移，调用 `adjustTitleOffSetToCurrentIndex` 来改变 label 的位置。

在 `adjustTitleOffSetToCurrentIndex(currentIndex: Int, oldIndex: Int)` 方法里，需要获取之前点击 label 的索引以及刚刚点击 label 的索引，改变形变，计算当前的偏移量。

重写 frame，来设置导航栏不再有两边的间距。请看具体代码 206 行。




