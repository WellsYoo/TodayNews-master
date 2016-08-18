# YMVideoTopicController.swift

![](http://obna9emby.bkt.clouddn.com/news/topicVC.png)

使用的一个 tableView 实现。集成上拉刷新和下拉刷新。实现起来不难。
但是视频播放麻烦一点。需要考虑 cell 的重用机制，由于今日头条返回的数据是一个网址，并不是视频的真实地址，试了一些方法，想把视频的真实地址搞出来，但是没有成功，也是我能力有限。搜易视频播放暂时写了一个地址，播放是这一个视频。

cell的图片是一个 button 的背景图片，通过 button 的点击事件，来判断此时是选中还是没有选中。当点击图片按钮或是播放按钮的时候，在这个按钮上再创建一个 playerView，来播放视频，具体类请看 `YMPlayerView.swift`。

首先提前定义一个 cell，来保存上一次点击的 cell，然后通过 `YMPlayerView.swift` 的回调， 首先把上一次 cell 的状态，恢复原状，然后再在当前选中的 cell 上，进行新的设置，并添加一个 `YMPlayerView`。