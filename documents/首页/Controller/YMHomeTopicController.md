# YMHomeTopicController.swift

该类注册了四种 cell，分别表示中间三张图片，右边一张图片，中间一张大图，中间一张视频大图，没有图片的情况。

在 `tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell` 中，根据不同情况对要显示的 cell 进行判断，显示对应的 cell。

具体判断情况请看 `Model` 里的 `YMNewsTopic.swift` 类。