# 用户详情接口

## 用户详情接口

- 请求方式：GET

- 请求地址：/user/profile/homepage/v4/?

- 请求参数


| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| user_id |   Int  |   Y    | 用户的 ID | 53271122458 |
| device_id | Int  | Y    | 设备 ID | 8800803362  |
| iid       | Int  | Y    | 未知    | 14486549076 |

![考研张雪峰](img/user_detail/user_detail_1.png)

### 相关推荐视图

![考研张雪峰](img/user_detail/user_detail_recommand.png)

```
{
	"message": "success",
	"data": {
		"status": 0,
		"is_followed": false,
		"current_user_id": 0,
		"media_id": 1554769814257666,
		"description": "考研规划“神嘴”张雪峰老师。",
		"apply_auth_url": "sslocal://apply_user_auth_info",
		"bottom_tab": [],
		"article_limit_enable": 1,
		"verified_agency": "头条认证",
		"bg_img_url": "http://p3.pstatp.com/origin/bc30011684fa86d4b71",
		"verified_content": "知名教育博主 考研名师",
		"screen_name": "考研张雪峰",
		"is_following": true,
		"apply_auth_entry_title": "我的认证",
		"pgc_like_count": 0,
		"visit_count_recent": 439189,
		"star_chart": {},
		"user_verified": true,
		"top_tab": [{
			"url": "http://issub.snssdk.com/dongtai/list/v8",
			"is_default": true,
			"show_name": "动态",
			"type": "dongtai"
		}, {
			"url": "",
			"is_default": false,
			"show_name": "文章",
			"type": "all"
		}, {
			"url": "",
			"is_default": false,
			"show_name": "视频",
			"type": "video"
		}, {
			"url": "http://isub.snssdk.com/2/user/tab_wenda/",
			"is_default": false,
			"show_name": "问答",
			"type": "wenda"
		}],
		"user_auth_info": "{\"auth_type\": \"1\", \"auth_info\": \"知名教育博主 考研名师\"}",
		"is_blocking": 0,
		"is_blocked": 0,
		"user_id": 53271122458,
		"name": "考研张雪峰",
		"big_avatar_url": "http://p3.pstatp.com/large/1234001551c0974ce2ba",
		"area": null,
		"private_letter_permission": 1,
		"gender": 0,
		"industry": null,
		"creator_id": 53271122458,
		"share_url": "http://m.toutiao.com/profile/53271122458/?version_code=6.4.2&version_name=&device_platform=iphone",
		"show_private_letter": 1,
		"ugc_publish_media_id": 1576963425007630,
		"avatar_url": "http://p3.pstatp.com/medium/1234001551c0974ce2ba",
		"followers_count": 470837,
		"media_type": "2",
		"followings_count": 3,
		"medals": []
	}
}
```

![音乐风向](img/user_detail/user_detail_2.png)

```
{
	"message": "success",
	"data": {
		"status": 0,
		"is_followed": false,
		"current_user_id": 0,
		"media_id": 1553586690739201,
		"description": "每天分享最热音乐，关注全球音乐发展风向，探寻音乐的爱与感动！",
		"apply_auth_url": "sslocal://apply_user_auth_info",
		"bottom_tab": [],
		"article_limit_enable": 1,
		"verified_agency": "",
		"bg_img_url": "http://p3.pstatp.com/origin/bc30011684fa86d4b71",
		"verified_content": "",
		"screen_name": "音乐风向",
		"is_following": true,
		"apply_auth_entry_title": "申请认证",
		"pgc_like_count": 0,
		"visit_count_recent": 505,
		"star_chart": {},
		"user_verified": false,
		"top_tab": [{
			"url": "http://issub.snssdk.com/dongtai/list/v8",
			"is_default": true,
			"show_name": "动态",
			"type": "dongtai"
		}, {
			"url": "",
			"is_default": false,
			"show_name": "文章",
			"type": "all"
		}, {
			"url": "",
			"is_default": false,
			"show_name": "视频",
			"type": "video"
		}],
		"user_auth_info": "",
		"is_blocking": 0,
		"is_blocked": 0,
		"user_id": 52857648739,
		"name": "音乐风向",
		"big_avatar_url": "http://p3.pstatp.com/large/1234000b95a37b47e8b3",
		"area": null,
		"private_letter_permission": 0,
		"gender": 0,
		"industry": null,
		"creator_id": 52857648739,
		"share_url": "http://m.toutiao.com/profile/52857648739/?version_code=6.4.2&version_name=&device_platform=iphone",
		"show_private_letter": 1,
		"ugc_publish_media_id": 0,
		"avatar_url": "http://p3.pstatp.com/medium/1234000b95a37b47e8b3",
		"followers_count": 38014,
		"media_type": "2",
		"followings_count": 25,
		"medals": []
	}
}
```

![马未都](img/user_detail/user_detail_3.png)
![马未都](img/user_detail/user_detail_3_1.png)
![马未都-夜间](img/user_detail/user_detail_3_night.jpeg)

```
{
	"message": "success",
	"data": {
		"status": 0,
		"is_followed": false,
		"current_user_id": 0,
		"media_id": 51025535398,
		"description": "社会是锅粥，过了坎儿还有沟。",
		"apply_auth_url": "sslocal://apply_user_auth_info",
		"bottom_tab": [{
			"type": "",
			"children": [{
				"schema_href": "sslocal://webview?url=http%3A%2F%2Fwww.guanfumuseum.org.cn%2F",
				"type": "href",
				"name": "官网",
				"value": "http://www.guanfumuseum.org.cn/"
			}, {
				"schema_href": "sslocal://webview?url=http%3A%2F%2Fwww.guanfumuseum.org.cn%2F7367.html",
				"type": "href",
				"name": "北京观复",
				"value": "http://www.guanfumuseum.org.cn/7367.html"
			}, {
				"schema_href": "sslocal://webview?url=http%3A%2F%2Fwww.guanfumuseum.org.cn%2F9397.html",
				"type": "href",
				"name": "上海观复",
				"value": "http://www.guanfumuseum.org.cn/9397.html"
			}, {
				"schema_href": "sslocal://webview?url=http%3A%2F%2Fwww.guanfumuseum.org.cn%2F6059.html",
				"type": "href",
				"name": "厦门观复",
				"value": "http://www.guanfumuseum.org.cn/6059.html"
			}],
			"value": "",
			"name": "博物馆"
		}, {
			"schema_href": "sslocal://webview?url=https%3A%2F%2Fguanfumuseum.tmall.com%2F",
			"type": "href",
			"children": [{
				"schema_href": "sslocal://webview?url=http%3A%2F%2Fxt.guanfu.com.cn%2Fexplore%2Fksjls_h5_slide1.php%3Fu%3D1000%26c%3D101120",
				"type": "href",
				"name": "《凯叔讲历史》",
				"value": "http://xt.guanfu.com.cn/explore/ksjls_h5_slide1.php?u=1000&c=101120"
			}],
			"value": "",
			"name": "订阅"
		}, {
			"type": "",
			"children": [{
				"schema_href": "sslocal://webview?url=http%3A%2F%2Fi.youku.com%2Fu%2FUMzI3ODg4MTI2OA%3D%3D",
				"type": "href",
				"name": "观复嘟嘟",
				"value": "http://i.youku.com/u/UMzI3ODg4MTI2OA=="
			}, {
				"schema_href": "sslocal://webview?url=http%3A%2F%2Ftv.cntv.cn%2Fvideoset%2FC20302",
				"type": "href",
				"name": "收藏马未都",
				"value": "http://tv.cntv.cn/videoset/C20302"
			}, {
				"schema_href": "sslocal://webview?url=https%3A%2F%2Fguanfumuseum.tmall.com%2F",
				"type": "href",
				"name": "观复文创",
				"value": "https://guanfumuseum.tmall.com/"
			}],
			"value": "",
			"name": "节目商品"
		}],
		"article_limit_enable": 1,
		"verified_agency": "头条认证",
		"bg_img_url": "http://p3.pstatp.com/origin/bc30011684fa86d4b71",
		"verified_content": "著名文化学者 观复博物馆创办人",
		"screen_name": "马未都",
		"is_following": true,
		"apply_auth_entry_title": "我的认证",
		"pgc_like_count": 0,
		"visit_count_recent": 1126382,
		"star_chart": {},
		"user_verified": true,
		"top_tab": [{
			"url": "http://issub.snssdk.com/dongtai/list/v8",
			"is_default": true,
			"show_name": "动态",
			"type": "dongtai"
		}, {
			"url": "",
			"is_default": false,
			"show_name": "文章",
			"type": "all"
		}, {
			"url": "",
			"is_default": false,
			"show_name": "视频",
			"type": "video"
		}],
		"user_auth_info": "{\"auth_type\": \"1\", \"auth_info\": \"著名文化学者 观复博物馆创办人\"}",
		"is_blocking": 0,
		"is_blocked": 0,
		"user_id": 51025535398,
		"name": "马未都",
		"big_avatar_url": "http://p9.pstatp.com/large/2c5e0004a6385965f1b6",
		"area": "北京市朝阳区",
		"private_letter_permission": 1,
		"gender": 0,
		"industry": null,
		"creator_id": 51025535398,
		"share_url": "http://m.toutiao.com/profile/51025535398/?version_code=6.4.2&version_name=&device_platform=iphone",
		"show_private_letter": 1,
		"ugc_publish_media_id": 1561724231755777,
		"avatar_url": "http://p9.pstatp.com/medium/2c5e0004a6385965f1b6",
		"followers_count": 805912,
		"media_type": "2",
		"followings_count": 14,
		"medals": []
	}
}
```

![冯提莫](img/user_detail/user_detail_4.jpeg)

```
{
	"message": "success",
	"data": {
		"status": 0,
		"is_followed": false,
		"current_user_id": 0,
		"media_id": 1578974413519885,
		"description": "这里是我的最新资讯~欢迎大家关注我，我就是冯提莫，啦啦啦。",
		"apply_auth_url": "sslocal://apply_user_auth_info",
		"bottom_tab": [{
			"schema_href": "sslocal://webview?url=http%3A%2F%2Fweibo.com%2Fu%2F1672384324%3Frefer_flag%3D1001030101_%26is_all%3D1",
			"type": "href",
			"children": [],
			"value": "http://weibo.com/u/1672384324?refer_flag=1001030101_&is_all=1",
			"name": "提莫微博"
		}, {
			"schema_href": "sslocal://webview?url=https%3A%2F%2Fwww.douyu.com%2F71017",
			"type": "href",
			"children": [],
			"value": "https://www.douyu.com/71017",
			"name": "提莫直播"
		}],
		"article_limit_enable": 1,
		"verified_agency": "头条认证",
		"bg_img_url": "http://p3.pstatp.com/origin/bc30011684fa86d4b71",
		"verified_content": "斗鱼签约游戏主播 歌手",
		"screen_name": "冯提莫",
		"is_following": true,
		"apply_auth_entry_title": "我的认证",
		"pgc_like_count": 0,
		"visit_count_recent": 140363,
		"star_chart": {},
		"user_verified": true,
		"top_tab": [{
			"url": "http://issub.snssdk.com/dongtai/list/v8",
			"is_default": true,
			"show_name": "动态",
			"type": "dongtai"
		}, {
			"url": "",
			"is_default": false,
			"show_name": "文章",
			"type": "all"
		}, {
			"url": "",
			"is_default": false,
			"show_name": "视频",
			"type": "video"
		}],
		"user_auth_info": "{\"auth_type\": \"1\", \"auth_info\": \"斗鱼签约游戏主播 歌手\"}",
		"is_blocking": 0,
		"is_blocked": 0,
		"user_id": 69722830785,
		"name": "冯提莫",
		"big_avatar_url": "http://p3.pstatp.com/large/437900011eb6a1e77419",
		"area": null,
		"private_letter_permission": 0,
		"gender": 0,
		"industry": null,
		"creator_id": 69722830785,
		"share_url": "http://m.toutiao.com/profile/69722830785/?version_code=6.4.2&version_name=&device_platform=iphone",
		"show_private_letter": 1,
		"ugc_publish_media_id": 1579026362919950,
		"avatar_url": "http://p3.pstatp.com/medium/437900011eb6a1e77419",
		"followers_count": 258976,
		"media_type": "2",
		"followings_count": 1,
		"medals": []
	}
}
```

## 用户详情-动态

- 请求方式：GET
- 请求地址：/dongtai/list/v14/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| user_id |   Int  |   Y    | 用户的 ID | 53271122458 |
| iid |   Int  |   N    | 用户的 ID | 18145386087 |
| app_name |   Int  |   N    | app 名称 | news_article |
| version_code |   String  |   N    | 版本号 | 6.4.2 |
| device_id       | Int    |  N   | 设备 ID   | 8800803362 |

**返回数据比较多，不再展示。**

## 用户详情-动态-详细内容

- 请求方式：GET
- 请求地址：/ugc/thread/detail/v1/info/?
- 请求地址：/ugc/comment/repost_detail/v1/info/? （动态 cell 如果是评论或引用则调用这个接口）
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
|thread_id|   Int  |   N    | 用户动态模型中的 id_str | 1586368669366286 |

**返回数据比较多，不再展示。**

## 用户详情-动态-评论

- 请求方式：POST
- 请求地址：/article/v2/tab_comments/
- 请求参数(body 体)

- 请求方式：GET
- 请求地址：/2/comment/v1/reply_list/?  （动态 cell 如果是评论或引用则调用这个接口）

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
|offset|   Int  |   Y    |  | 0 |
|forum_id|   Int  |   Y    |  | 6564242300 |
|group_id|   Int  |   Y    |  | 1586368669366286 |
|count|   Int  |   Y    |  | 20 |
|fold|   Int  |   N    |  | 1 |
|item_id|   Int  |   N    |  | 0 |
|group_type|   Int  |   N    |  | 2 |

**返回数据比较多，不再展示。**

## 用户详情-文章

- 请求方式：GET
- 请求地址：/pgc/ma/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| media_id |   Int  |   Y    | 用户的 ID | 53271122458 |
|   uid    |   Int  |   Y    | 用户的 ID | 53271122458 |
|     as   | Int    |  Y   |    | A1856A615F87457 |
|  output  |   String  |   Y    |  输出 | json |
|  count   |   Int  |   Y    |  输出 | 20 |
| page_type|   Int  |   Y    |  | **1(文章)** |
|   from   |   Int  |   N    | 来源 | user_profile_app |
|  version | Int    |  N   | 版本   | 2 |
|    cp    | Int    |  N   |    | 5A1F871485672E1 |

```
{
    "app_url": "sslocal://thread_detail?fid=6564242300&tid=1585650748196877",
    "go_detail_count": "214万",
    "title": "早上来上海观复博物馆时，工作人员正在做开馆前的准备，随手拍了...",
    "internal_visit_count_format": "214万",
    "abstract": "早上来上海观复博物馆时，工作人员正在做开馆前的准备，随手拍了几张无人时的照片。在上海中心大厦37层上，又一次印证了我的办馆理念：没来时不能想象，来了也不能复述。",
    "image_list": [],
    "external_visit_count": 0,
    "behot_time": 1512194393,
    "datetime": "2017-12-02 13:59",
    "source": "上头条",
    "is_thread": true,
    "create_time": 1512194393,
    "source_url": "http://toutiao.com/dongtai/1585650748196877/",
    "group_id": 1585650748196877,
    "middle_image": "",
    "external_visit_count_format": "0",
    "internal_visit_count": 2140405
}
```

## 用户详情-视频

- 请求方式：GET
- 请求地址：/pgc/ma/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| media_id |   Int  |   Y    | 用户的 ID | 53271122458 |
|   uid    |   Int  |   Y    | 用户的 ID | 53271122458 |
|     as   | Int    |  Y   |    | A1856A615F87457 |
|  output  |   String  |   Y    |  输出 | json |
|  count   |   Int  |   Y    |  输出 | 20 |
| page_type|   Int  |   Y    |  | **0(视频)** |
|   from   |   Int  |   N    | 来源 | user_profile_app |
|  version | Int    |  N   | 版本   | 2 |
|    cp    | Int    |  N   |    | 5A1F871485672E1 |

**返回数据比较多，不再展示。**

## 用户详情-问答

- 请求方式：GET
- 请求地址：/wenda/profile/wendatab/brow/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| other_id |   Int  |   Y    | 用户的 ID | 53271122458 |
| format |   Int  |   Y    | 格式 | json |
| from_channel |   Int  |   Y    | 来源 | media_channel |
| device_id       | Int    |  N   | 设备 ID   | 8800803362 |

```
{
  "cursor": "6484757658522878221", 
  "err_no": 0, 
  "answer_question": [
    {
      "answer": {
        "show_time": "2017.11.05", 
        "content_abstract": {
          "text": "这位同学问的问题很有灵性，这2件装备都是比较适合武器大师出的装备。再同时出的情况下，这2个装备的主动效果就有点重复了。都是造成一个减速的效果，科技枪是造成魔法伤害高并且减速40%，破败王者之刃是偷取目标25%的移动速度。而且科技枪的被动技能主要是配合武器大师的魔法伤害达到一个不错的回复能力，而破败呢就是配合武器大师的被动造成一个普通攻击的额外生命值的物理伤害。所以这2件装备，我们在对线坦克的时候可以出破败，在对线一些线上伤害高的可以出科技枪。但是马老师不建议你同时出，因为这2件装备都有点贵，有点托节奏。而且要看你的对手是什么样的段位，如果青铜白银嘛那就随便锤，如果大师王者了那还是要根据阵容来出装。", 
          "thumb_image_list": [], 
          "large_image_list": []
        }, 
        "user": {
          "is_verify": 1, 
          "uname": "大司马解说", 
          "create_time": 1471766978, 
          "user_auth_info": "{\"auth_type\":\"1\",\"auth_info\":\"\知\名\游\戏\解\说 \斗\鱼\签\约\主\播\"}", 
          "user_id": "50329949946", 
          "avatar_url": "http://p3.pstatp.com/thumb/216d0012235c54f782d9", 
          "profit_amount": 0, 
          "user_intro": "知名游戏解说 斗鱼签约主播", 
          "profit_user": false, 
          "medals": [], 
          "schema": "sslocal://profile?uid=50329949946&refer=wenda"
        }, 
        "ans_url": "https://ic.snssdk.com/wenda/v1/wapanswer/content/?ansid=6484757658522878221", 
        "ansid": "6484757658522878221", 
        "is_show_bury": false, 
        "wap_url": "https://www.wukong.com/answer/6484757658522878221/", 
        "is_buryed": false, 
        "bury_count": 0, 
        "title": "", 
        "is_delete": 0, 
        "digg_count": 270, 
        "content": "<p>这位同学问的问题很有灵性，这2件装备都是比较适合武器大师出的装备。再同时出的情况下，这2个装备的主动效果就有点重复了。都是造成一个减速的效果，科技枪是造成魔法伤害高并且减速40%，破败王者之刃是偷取目标25%的移动速度。而且科技枪的被动技能主要是配合武器大师的魔法伤害达到一个不错的回复能力，而破败呢就是配合武器大师的被动造成一个普通攻击的额外生命值的物理伤害。所以这2件装备，我们在对线坦克的时候可以出破败，在对线一些线上伤害高的可以出科技枪。但是马老师不建议你同时出，因为这2件装备都有点贵，有点托节奏。而且要看你的对手是什么样的段位，如果青铜白银嘛那就随便锤，如果大师王者了那还是要根据阵容来出装。</p>", 
        "brow_count": 209544, 
        "is_digg": false, 
        "schema": "sslocal://wenda_detail?gd_ext_json=%7B%22article_type%22%3A%22wenda%22%2C%22author_id%22%3A%2250329949946%22%7D&ansid=6484757658522878221&api_param=%7B%22scope%22%3A%22toutiao_wenda%22%2C%22origin_from%22%3A%22click_headline%22%2C%22parent_enter_from%22%3A%22question%22%2C%22enter_from%22%3A%22answer_detail%22%7D"
      }, 
      "question": {
        "content": {
          "text": "", 
          "pic_uri_list": [
            {
              "width": 720, 
              "type": "1", 
              "web_uri": "3ea500096cee704ef232", 
              "height": 1280
            }, 
            {
              "width": 720, 
              "type": "1", 
              "web_uri": "3ea30009698e9d0f0a47", 
              "height": 1280
            }
          ], 
          "thumb_image_list": [
            {
              "url": "http://p3.pstatp.com/list/s192/3ea500096cee704ef232", 
              "url_list": [
                {
                  "url": "http://p3.pstatp.com/list/s192/3ea500096cee704ef232"
                }, 
                {
                  "url": "http://pb9.pstatp.com/list/s192/3ea500096cee704ef232"
                }, 
                {
                  "url": "http://pb3.pstatp.com/list/s192/3ea500096cee704ef232"
                }
              ], 
              "uri": "3ea500096cee704ef232", 
              "height": 192, 
              "width": 192, 
              "type": 1
            }, 
            {
              "url": "http://p9.pstatp.com/list/s192/3ea30009698e9d0f0a47", 
              "url_list": [
                {
                  "url": "http://p9.pstatp.com/list/s192/3ea30009698e9d0f0a47"
                }, 
                {
                  "url": "http://pb1.pstatp.com/list/s192/3ea30009698e9d0f0a47"
                }, 
                {
                  "url": "http://pb3.pstatp.com/list/s192/3ea30009698e9d0f0a47"
                }
              ], 
              "uri": "3ea30009698e9d0f0a47", 
              "height": 192, 
              "width": 192, 
              "type": 1
            }
          ], 
          "large_image_list": [
            {
              "url": "http://p3.pstatp.com/large/3ea500096cee704ef232", 
              "url_list": [
                {
                  "url": "http://p3.pstatp.com/large/3ea500096cee704ef232"
                }, 
                {
                  "url": "http://pb9.pstatp.com/large/3ea500096cee704ef232"
                }, 
                {
                  "url": "http://pb3.pstatp.com/large/3ea500096cee704ef232"
                }
              ], 
              "uri": "3ea500096cee704ef232", 
              "height": 1280, 
              "width": 720, 
              "type": 1
            }, 
            {
              "url": "http://p9.pstatp.com/large/3ea30009698e9d0f0a47", 
              "url_list": [
                {
                  "url": "http://p9.pstatp.com/large/3ea30009698e9d0f0a47"
                }, 
                {
                  "url": "http://pb1.pstatp.com/large/3ea30009698e9d0f0a47"
                }, 
                {
                  "url": "http://pb3.pstatp.com/large/3ea30009698e9d0f0a47"
                }
              ], 
              "uri": "3ea30009698e9d0f0a47", 
              "height": 1280, 
              "width": 720, 
              "type": 1
            }
          ]
        }, 
        "tag_name": "", 
        "create_time": 1509821971, 
        "normal_ans_count": 5, 
        "user": {
          "is_verify": 0, 
          "uname": "六更9728", 
          "create_time": 1454582496, 
          "user_auth_info": "", 
          "user_id": "5980352250", 
          "avatar_url": "http://p3.pstatp.com/thumb/2bd6002342d1e63b6857", 
          "profit_amount": 0, 
          "user_intro": "", 
          "profit_user": false, 
          "medals": [], 
          "schema": "sslocal://profile?uid=5980352250&refer=wenda"
        }, 
        "title": "LOL的武器大师可以科技枪和破败一起出吗？", 
        "qid": "6484635986562121998", 
        "nice_ans_count": 3, 
        "tag_id": 0, 
        "fold_reason": {
          "open_url": "sslocal://detail?groupid=6293724675596402946", 
          "title": "为什么折叠？"
        }
      }
    }
  ], 
  "err_tips": "", 
  "api_param": {
    "origin_from": "out_wenda", 
    "enter_from": "out_wenda"
  }, 
  "has_more": false, 
  "login_user": {}, 
  "total": 1, 
  "user_data": {
    "all_brow_cnt_str": "1696万人读过你的回答", 
    "is_verify": 0, 
    "curretn_month_digg_cnt_str": "本月共0人点赞", 
    "all_digg_cnt_str": "回答获0人点赞", 
    "current_month_brow_cnt": "1633万", 
    "youzhi_info": [], 
    "laomo_info": [], 
    "uname": "", 
    "all_brow_cnt": "1696万", 
    "is_valid": 1, 
    "current_month_brow_cnt_str": "本月共1633万人浏览", 
    "user_intro": "", 
    "current_month_digg_cnt": "0", 
    "all_digg_cnt": "0", 
    "user_profile_image_url": "", 
    "ming_ren_tang": "", 
    "schema": ""
  }, 
  "can_ask": false
}
```

## 关注用户（取消关注）

- 请求方式：GET
- 请求地址：/2/relation/unfollow/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| user_id |   Int  |   Y    | 用户的 ID | 53271122458 |
| iid |   Int  |   N    | 用户的 ID | 18145386087 |
| app_name |   Int  |   N    | app 名称 | news_article |
| version_code |   String  |   N    | 版本号 | 6.4.2 |
| device_id       | Int    |  N   | 设备 ID   | 8800803362 |

```
{
    "message":"success",
    "data":{
        "user":{
            "is_followed":false,
            "media_id":1554769814257666,
            "create_time":1482744040,
            "is_following":false,
            "user_verified":true,
            "name":"考研张雪峰",
            "user_id":53271122458,
            "screen_name":"考研张雪峰",
            "last_update":"考研规划“神嘴”张雪峰老师。",
            "avatar_url":"http://p3.pstatp.com/thumb/1234001551c0974ce2ba",
            "user_auth_info":"{"auth_type": "1", "auth_info": "知名教育博主 考研名师"}",
            "type":1
        },
        "created":true
    }
}
```

## 取消关注用户每天上限

**不能无限次取消关注用户，每天上限是 30 次**

```
{
    "data":{
        "error_code":9,
        "name":"can unfollow no more than 30 times per day, now is 30",
        "description":"今日取消关注数量已达上限, 请明天再试"
    },
    "message":"error"
}
```


## 关注用户（点击关注按钮）

- 请求方式：GET
- 请求地址：/2/relation/follow/v2/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| user_id |   Int  |   Y    | 用户的 ID | 53271122458 |
| iid |   Int  |   Y    | 用户的 ID | 18145386087 |
| device_id | Int |  Y   | 设备 ID   | 8800803362 |


```
{
    "message":"success",
    "data":{
        "created":true,
        "description":"关注成功",
        "user":{
            "is_followed":false,
            "media_id":1554769814257666,
            "create_time":1482744040,
            "is_following":true,
            "user_verified":true,
            "name":"考研张雪峰",
            "user_id":53271122458,
            "screen_name":"考研张雪峰",
            "last_update":"考研规划“神嘴”张雪峰老师。",
            "avatar_url":"http://p3.pstatp.com/thumb/1234001551c0974ce2ba",
            "user_auth_info":"{"auth_type": "1", "auth_info": "知名教育博主 考研名师"}",
            "type":1
        }
    }
}
```

## 点击了关注按钮，就会出现相关推荐

- 请求方式：GET
- 请求地址：/user/relation/user_recommend/v1/supplement_recommends/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| follow_user_id |   Int  |   Y    | 用户的 ID | 53271122458 |
| iid |   Int  |   N    | 用户的 ID | 18145386087 |
| app_name |   Int  |   N    | app 名称 | news_article |
| device_platform |   Int  |   N    | 手机平台 | iphone |
| scene |   String  |   N    | 来源 | follow |
| source       | Int    |  N   | 来源   | follow |

![](img/user_detail/user_detail_recommand.png)

```
{
    "has_more":0,
    "err_no":0,
    "user_cards":[
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"papitube创始人 搞笑视频达人",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":5726188736,
                    "name":"papi酱",
                    "avatar_url":"http://p9.pstatp.com/thumb/9152/5124314802",
                    "desc":"你看！我是你们的光呀",
                    "schema":"sslocal://profile?uid=5726188736",
                    "user_auth_info":"{"auth_type": "1", "auth_info": "papitube创始人 搞笑视频达人"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"新车测评长期测试驾驶技术机械原理汽车文化交通安全等",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":51177075853,
                    "name":"38号车评中心",
                    "avatar_url":"http://p3.pstatp.com/thumb/ef500000b463966740a",
                    "desc":"新车测评长期测试驾驶技术机械原理汽车文化交通安全等",
                    "schema":"sslocal://profile?uid=51177075853",
                    "user_auth_info":""
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"著名军事专家张召忠的网络脱口秀节目，以幽默风趣的语言给大家讲述军事奇闻轶事！",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":6511017912,
                    "name":"张召忠说",
                    "avatar_url":"http://p3.pstatp.com/thumb/4120012180243088c5b",
                    "desc":"著名军事专家张召忠的网络脱口秀节目，以幽默风趣的语言给大家讲述军事奇闻轶事！",
                    "schema":"sslocal://profile?uid=6511017912",
                    "user_auth_info":""
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"小米MIUI官方帐号",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":4157162791,
                    "name":"小米MIUI",
                    "avatar_url":"http://p3.pstatp.com/thumb/3753/3024700975",
                    "desc":"MIUI是小米手机操作系统，全球联网激活用户已达2.8亿。",
                    "schema":"sslocal://profile?uid=4157162791",
                    "user_auth_info":"{"auth_type": "0", "auth_info": "小米MIUI官方帐号"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"Big笑工坊有唐唐神吐槽，唐唐脱口秀，唐唐嘻游路等娱乐节目！",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":4161577335,
                    "name":"Big笑工坊",
                    "avatar_url":"http://p9.pstatp.com/thumb/411000ff8cf50fd0ef0",
                    "desc":"Big笑工坊有唐唐神吐槽，唐唐脱口秀，唐唐嘻游路等娱乐节目！",
                    "schema":"sslocal://profile?uid=4161577335",
                    "user_auth_info":""
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"著名相声演员 德云社班主",
            "recommend_type":67110912,
            "user":{
                "info":{
                    "user_id":58083841776,
                    "name":"郭德纲",
                    "avatar_url":"http://p9.pstatp.com/thumb/3643000643b9b1f1c305",
                    "desc":"中国北京德云社文化公司",
                    "schema":"sslocal://profile?uid=58083841776",
                    "user_auth_info":"{"auth_type": "1", "auth_info": "著名相声演员 德云社班主"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"头条号原创作者",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":3133232617,
                    "name":"老梁讲故事",
                    "avatar_url":"http://p3.pstatp.com/thumb/2c670007a9f3232ee318",
                    "desc":"老梁故事汇聚娱乐影评，街拍视频，征集企业名人故事",
                    "schema":"sslocal://profile?uid=3133232617",
                    "user_auth_info":"{"auth_type": "0", "other_auth": {"pgc": "头条号原创作者"}, "auth_info": "头条号原创作者"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"头条号优质视频原创作者",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":5530518140,
                    "name":"科客黑科技",
                    "avatar_url":"http://p3.pstatp.com/thumb/6cb0003045a30ed4bad",
                    "desc":"科客网，定期推出黑科技资讯、嗨科技评测，新鲜有趣的科技讯息。",
                    "schema":"sslocal://profile?uid=5530518140",
                    "user_auth_info":"{"auth_type": "0", "other_auth": {"pgc": "头条号优质视频原创作者"}, "auth_info": "头条号优质视频原创作者"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"头条号优质视频原创作者",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":5857206714,
                    "name":"Maxonor创意公元",
                    "avatar_url":"http://p3.pstatp.com/thumb/78f001fbf2763a39592",
                    "desc":"专注于全球最有创意的设计",
                    "schema":"sslocal://profile?uid=5857206714",
                    "user_auth_info":"{"auth_type": "0", "other_auth": {"pgc": "头条号优质视频原创作者"}, "auth_info": "头条号优质视频原创作者"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"TED今日头条中国官方合作平台",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":6317831772,
                    "name":"TED官方",
                    "avatar_url":"http://p3.pstatp.com/thumb/411000536ef7de606f7",
                    "desc":"TED今日头条中国官方合作平台",
                    "schema":"sslocal://profile?uid=6317831772",
                    "user_auth_info":"{"auth_type": "0", "auth_info": "TED今日头条中国官方合作平台"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"高考填志愿，你想要的都在这里！",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":6911344333,
                    "name":"志愿填报指南",
                    "avatar_url":"http://p3.pstatp.com/thumb/bc3000eb8f07a15bada",
                    "desc":"高考填志愿，你想要的都在这里！",
                    "schema":"sslocal://profile?uid=6911344333",
                    "user_auth_info":""
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"揭秘身边的物品制造过程，及科技，机械视频",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":5859670551,
                    "name":"制造原理",
                    "avatar_url":"http://p3.pstatp.com/thumb/412000f20686f4a8b8c",
                    "desc":"揭秘身边的物品制造过程，及科技，机械视频",
                    "schema":"sslocal://profile?uid=5859670551",
                    "user_auth_info":""
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"高级二手车鉴定评估师 汽车问答专家",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":4372599275,
                    "name":"吱道二手车",
                    "avatar_url":"http://p9.pstatp.com/thumb/e590003261e725e849e",
                    "desc":"专注好玩有趣实用的二手车内容，吱！",
                    "schema":"sslocal://profile?uid=4372599275",
                    "user_auth_info":"{"auth_type": "0", "auth_info": "高级二手车鉴定评估师 汽车问答专家"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"汽车自媒体",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":6761472100,
                    "name":"李老鼠说车",
                    "avatar_url":"http://p3.pstatp.com/thumb/6cb0026bfdda0351b36",
                    "desc":"全球最好玩，最有趣的的二手车节目。",
                    "schema":"sslocal://profile?uid=6761472100",
                    "user_auth_info":"{"auth_type": "0", "auth_info": "汽车自媒体"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"「科技美学」是国内领先的数码产品测评机构，为消费者购买使用数码产品提供有价值的信息。",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":4689160121,
                    "name":"科技美学",
                    "avatar_url":"http://p3.pstatp.com/thumb/6205/6913306792",
                    "desc":"「科技美学」是国内领先的数码产品测评机构，为消费者购买使用数码产品提供有价值的信息。",
                    "schema":"sslocal://profile?uid=4689160121",
                    "user_auth_info":""
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"汽车自媒体",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":5466979322,
                    "name":"30秒懂车",
                    "avatar_url":"http://p9.pstatp.com/thumb/178200091f321ab46ff5",
                    "desc":"中国汽车第一视频新媒体，您身边的汽车问答专家",
                    "schema":"sslocal://profile?uid=5466979322",
                    "user_auth_info":"{"auth_type": "0", "auth_info": "汽车自媒体"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"锤子科技CEO",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":5469817756,
                    "name":"罗永浩",
                    "avatar_url":"http://p1.pstatp.com/thumb/6cb001cf649112aacf1",
                    "desc":"Smartisan，智能机时代的工匠。锤子科技CEO",
                    "schema":"sslocal://profile?uid=5469817756",
                    "user_auth_info":"{"auth_type": "1", "auth_info": "锤子科技CEO"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"小米公司创始人、董事长兼CEO",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":3334438776,
                    "name":"雷军",
                    "avatar_url":"http://p3.pstatp.com/thumb/1164/1387391816",
                    "desc":"小米创始人、董事长，金山董事长",
                    "schema":"sslocal://profile?uid=3334438776",
                    "user_auth_info":"{"auth_type": "1", "auth_info": "小米公司创始人、董事长兼CEO"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        },
        {
            "stats_place_holder":"{"impr_id":"2017112908491701000805908912481"}",
            "recommend_reason":"头条号优质原创作者",
            "recommend_type":2048,
            "user":{
                "info":{
                    "user_id":6026968107,
                    "name":"大唐雷音寺",
                    "avatar_url":"http://p1.pstatp.com/thumb/97d00017a2c037ec6c5",
                    "desc":"大唐雷音寺，教你好好说话。“铁嘴”梁宏达第一次触网。",
                    "schema":"sslocal://profile?uid=6026968107",
                    "user_auth_info":"{"auth_type": "0", "other_auth": {"pgc": "头条号优质原创作者"}, "auth_info": "头条号优质原创作者"}"
                },
                "relation":{
                    "is_followed":0,
                    "is_following":0,
                    "is_friend":0
                }
            }
        }
    ]
}
```



