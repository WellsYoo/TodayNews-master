# YMNewsTopic.swift

这个类是我觉得最麻烦的一个类了，有很多种情况，所以判断也比较多。

今日头条返回的数据中，有这四个字段，`image_list` ，`middle_image`，`large_image_list`，`video_detail_info`。

`image_list` 这是一个**数组**，表示中间有三种图的情况；
![](http://obna9emby.bkt.clouddn.com/home-cell-3.png)
`middle_image` 这是一个**字典**，表示图片在右侧的情况；
![右边显示一张图片的情况](http://obna9emby.bkt.clouddn.com/home-cell-4.png)
`large_image_list` 这是一个**数组**，表示中间是一张大图；
![](http://obna9emby.bkt.clouddn.com/home-cell-2.png)
`video_detail_info` 这是一个**字典**，表示是视频，中间也用一张大图表示，这种情况和大图的情况基本相同，但是视频中间多了播放按钮。
![](http://obna9emby.bkt.clouddn.com/home-cell-5.png)
还有最后一种情况就是没有图片的情况，比如置顶的专题，但是置顶的专题和上面在**举报按钮**的地方也有所区别，置顶的新闻没有举报按钮，其他情况有举报按钮，需要根据 一个字段 `label` 来进行判断。
![](http://obna9emby.bkt.clouddn.com/home-cell-1.png)
上面五种情况出现的依赖关系，也需要进行判断，

下面说一下，具体的判断过程：

|image_list|middle_image|large_image_list|video_detail_info|
|----------|------------|----------------|-----------------|
|   nil    |    nil     |       nil      |       nil       |
|   nil    |   不为 nil  |    不为 nil    |       nil       |
|   nil    |   不为 nil  |      nil       |      nil       |
| 不为 nil  |   不为 nil  |    不为 nil     |    不为 nil     |
| 不为 nil  |   不为 nil  |    不为 nil     |       nil      |
| 不为 nil  |   不为 nil  |      nil       |    不为 nil     |
| 不为 nil  |   不为 nil  |      nil       |       nil      |

还有一些其他情况，比如有个数据里没有 `image_list` 这个字段，这种情况我没做判断，一般程序崩溃都是因为这个原因。但是实际上，我是先判断 `image_list` 是否有值，如果有值，则显示三张图片，如果为 `nil`，再判断 `middle_image` 的情况。

如果各位朋友有什么更好的实现方法，欢迎给我留言或『Pull Request』，非常感谢您的留言和建议。