# YMNewCareViewController.swift

这个类是第三个主控制器，显示关注界面。

这个界面创建了一个 tableView，并且注册了三种不同的 cell，分别是 [YMNewCareNoLoginCell.swift](YMNewCareNoLoginCell.md)，[YMNewCareTopCell.swift]()，以及 [YMNewCareBottomCell.swift]()，可分别打开各自的文件，进行查看。

首先设置 UI，然后 `setupRefresh()` 是添加上拉和下拉刷新，然后将 tableView 分成了上下两组，上边一组表示自己添加的关注内容，下边一组表示未添加的关注内容，下面一组可以上拉加载更多内容。

今日头条的接口里有一个 `concern_time` 字段，未添加关注之前，该值为 `0`，当添加某一关注内容之后，该值变为一个关注的时间，单位是秒。由于今日头条接口里返回的数据是一个数组，即已关注和未关注的内容同时包含在一个数组中，所以可以根据这个参数来区分是已关注还是未关注。具体方法可以参考 `setupRefresh` 方法里面调用的 `loadNewConcernList` 方法，以及 `loadMoreConcernList` 方法，这两个方法实现了对已关注和未关注的拆分。

接口里还有一个参数需要注意，就是 `newly` 这个字段，对于刚刚关注的内容或是已关注的内容并没有点击相应的 cell，跳转到下一控制器的关注内容，都会在右边显示一个 『NEW』，这个控件的显示与隐藏需要根据 `newly` 的值进行判断，`newly` 会返回两种情况，一种是 `1`， 另一种是 `0`，即对应显示和隐藏。

上面的参数定义请看 `YMConcern.swift`.

在下面一组每一个 cell 上都有一个『关注』 按钮，这里我使用代理来实现按钮点击的响应事件，让 `YMNewCareViewController` 来接收按钮的点击。

当添加关注的时候，会有一个动画效果，这个动画效果暂时还未实现，大家可以参考今日头条的效果。参考一下，有实现的朋友，也可以联系我，也可以给我 『pull request』。

这个界面的实现还算简单，就说明到这里吧~

