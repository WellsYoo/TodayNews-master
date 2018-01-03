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

![navigationBar](img/dongtai/dongtai_detail_navigationBar.png)

![header](img/dongtai/dongtai_detail_header.png)

```
{
    "err_no":0,
    "show_repost_entrance":1,
    "comment":{
        "id":1586852090470414,
        "comment_base":{
            "id":1586852090470414,
            "content":"这个是ar眼镜的任务 识别不是难点//@36氪:人脸识别啥时候能解决脸盲问题？感觉可以福泽很多人[机智]",
            "status":1,
            "create_time":1513340083,
            "user":{
                "info":{
                    "user_id":8,
                    "name":"张一鸣",
                    "desc":"观察移动互联网带来的变革",
                    "schema":"sslocal://profile?uid=8",
                    "avatar_url":"http://p3.pstatp.com/thumb/db40005ee1157a3aeb0",
                    "user_auth_info":"{"auth_type": "1", "auth_info": "今日头条创始人兼CEO"}",
                    "user_verified":1,
                    "verified_content":"今日头条创始人兼CEO",
                    "medals":[

                    ],
                    "user_url":"",
                    "remark_name":""
                },
                "relation":{
                    "is_friend":0,
                    "is_following":0,
                    "is_followed":0
                },
                "relation_count":{
                    "followings_count":1489,
                    "followers_count":458290
                },
                "block":{
                    "is_blocking":0,
                    "is_blocked":0
                }
            },
            "action":{
                "forward_count":3,
                "comment_count":14,
                "read_count":525,
                "digg_count":38,
                "bury_count":0,
                "user_digg":0,
                "user_repin":0,
                "user_bury":0,
                "play_count":0
            },
            "content_rich_span":"{"links":[{"start":19,"length":4,"link":"sslocal://profile?uid=3757989448","type":0,"text":""}]}",
            "detail_schema":"sslocal://comment_repost_detail?category_id=&comment_id=1586852090470414&enter_from=click_headline&group_id=1586852090470414&refer=",
            "share":{
                "share_url":"https://weitoutiao.zjurl.cn/ugc/share/comment/1586852090470414/",
                "share_title":"微头条",
                "share_desc":"张一鸣 : 这个是ar眼镜的任务 识别不是难点",
                "share_weibo_desc":"",
                "share_cover":{
                    "uri":"",
                    "url_list":[
                        "http://p3.pstatp.com/thumb/db40005ee1157a3aeb0"
                    ]
                }
            },
            "group_id":1586852090470414,
            "repost_params":{
                "repost_type":212,
                "fw_id":1585727870572557,
                "fw_id_type":2,
                "fw_user_id":0,
                "opt_id":1586852090470414,
                "opt_id_type":1
            }
        },
        "comment_type":212,
        "is_repost":1,
        "show_origin":1,
        "show_tips":"",
        "origin_thread":{
            "thread_id":1585727870572557,
            "content":"开会的挑战是人脸识别 打招呼的时候快速想是谁是谁 和考试一样",
            "title":"",
            "create_time":1512267943,
            "modify_time":0,
            "forum_id":0,
            "status":1,
            "reason":"",
            "share_url":"https://toutiao.com/ugc/share/thread/1585727870572557/?app=&iid=0",
            "content_rich_span":"{"links":[]}",
            "item_type":0,
            "flags":0,
            "rate":0,
            "digg_count":1283,
            "read_count":642390,
            "comment_count":244,
            "user_digg":0,
            "user_repin":0,
            "position":{
                "latitude":0,
                "longitude":0,
                "position":"嘉兴市 桐乡市",
                "city":""
            },
            "forum":{
                "forum_id":0,
                "forum_name":"",
                "status":0,
                "show_et_status":0,
                "banner_url":"",
                "desc":"",
                "talk_count":0,
                "onlookers_count":0,
                "follower_count":0,
                "participant_count":0,
                "avatar_url":"",
                "introdution_url":"",
                "like_time":0,
                "schema":""
            },
            "user":{
                "id":0,
                "user_id":8,
                "name":"张一鸣",
                "screen_name":"张一鸣",
                "desc":"观察移动互联网带来的变革",
                "schema":"sslocal://profile?uid=8&refer=dongtai",
                "avatar_url":"http://p3.pstatp.com/thumb/db40005ee1157a3aeb0",
                "user_auth_info":"{"auth_type": "1", "auth_info": "今日头条创始人兼CEO"}",
                "user_verified":1,
                "verified_content":"今日头条创始人兼CEO",
                "medals":[

                ],
                "user_role_icons":null,
                "is_friend":0,
                "is_following":0,
                "is_blocked":0,
                "is_blocking":0,
                "followers_count":0,
                "followings_count":0,
                "remark_name":""
            },
            "digg_list":null,
            "friend_digg_list":[

            ],
            "large_image_list":[
                {
                    "uri":"large/w960/47770005360b462a6c63",
                    "url":"http://p7.pstatp.com/large/w960/47770005360b462a6c63",
                    "width":1500,
                    "height":1124,
                    "url_list":[
                        {
                            "url":"http://p7.pstatp.com/large/w960/47770005360b462a6c63"
                        },
                        {
                            "url":"http://p4.pstatp.com/large/w960/47770005360b462a6c63"
                        },
                        {
                            "url":"http://p.pstatp.com/large/w960/47770005360b462a6c63"
                        }
                    ],
                    "type":1
                }
            ],
            "thumb_image_list":[
                {
                    "uri":"list/640x360/47770005360b462a6c63",
                    "url":"http://p7.pstatp.com/list/640x360/47770005360b462a6c63",
                    "width":1500,
                    "height":1124,
                    "url_list":[
                        {
                            "url":"http://p7.pstatp.com/list/640x360/47770005360b462a6c63"
                        },
                        {
                            "url":"http://p4.pstatp.com/list/640x360/47770005360b462a6c63"
                        },
                        {
                            "url":"http://p.pstatp.com/list/640x360/47770005360b462a6c63"
                        }
                    ],
                    "type":1
                }
            ],
            "forward_info":{
                "forward_count":163
            },
            "comments":[

            ],
            "user_role":0,
            "talk_type":0,
            "show_comments_num":0,
            "cursor":0,
            "digg_limit":0,
            "show_origin":0,
            "show_tips":"",
            "forward_num":0,
            "schema":"sslocal://thread_detail?fid=6564242300&gd_ext_json=%7B%22category_id%22%3A%22%22%2C%22enter_from%22%3A%22%22%2C%22group_type%22%3A%22forum_post%22%2C%22refer%22%3A%22%22%7D&tid=1585727870572557"
        }
    },
    "ban_face":0
}
```

## 用户详情-动态-评论

- 请求方式：POST
- 请求地址：/article/v2/tab_comments/?
- 请求参数(body 体)

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
|offset|   Int  |   Y    |  | 0 |
|forum_id|   Int  |   Y    |  | 6564242300 |
|group_id|   Int  |   Y    |  | 传 thread_id 吧 |
|count|   Int  |   Y    |  | 20 |
|item_id|   Int  |   N    |  | 0 |
|group_type|   Int  |   N    |  | 2 |

- 请求方式：GET
- 请求地址：/2/comment/v1/reply_list/?  （动态 cell 如果是评论或引用则调用这个接口）

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
|offset|   Int  |   Y    |  | 0 |
|id|   Int  |   Y    |  | 6564242300 |
|count|   Int  |   Y    |  | 20 |

![header](img/dongtai/dongtai_detail_comment.png)

```
{
    "ban_face":false,
    "message":"success",
    "data":{
        "has_more":false,
        "total_count":14,
        "stick_total_number":0,
        "offset":14,
        "stick_has_more":false,
        "data":[
            {
                "content":"张总技术出身么？",
                "create_time":1513447845,
                "is_owner":false,
                "user":{
                    "is_followed":null,
                    "description":"武汉高校圈子为你提供武汉高校一手资讯学习交友尽在武汉高校圈子",
                    "screen_name":"武汉高校圈子",
                    "is_following":null,
                    "is_blocked":null,
                    "user_verified":true,
                    "user_auth_info":"{"auth_type": "0", "auth_info": "武汉校园资讯达人"}",
                    "is_blocking":null,
                    "is_pgc_author":false,
                    "user_id":5977178102,
                    "name":"武汉高校圈子",
                    "author_badge":[

                    ],
                    "user_relation":0,
                    "verified_reason":"武汉校园资讯达人",
                    "avatar_url":"http://p1.pstatp.com/thumb/78f001f66a18434af9e"
                },
                "text":"张总技术出身么？",
                "user_digg":false,
                "id":1586965088097293,
                "content_rich_span":"",
                "digg_count":3
            },
            {
                "content":"哈哈，人脸识别[送心][送心]",
                "create_time":1513343023,
                "is_owner":false,
                "user":{
                    "is_followed":null,
                    "description":"资讯、美食、旅游、心情、吃喝玩乐大小事情，一网搜罗！",
                    "screen_name":"龟话",
                    "is_following":null,
                    "is_blocked":null,
                    "user_verified":false,
                    "user_auth_info":"",
                    "is_blocking":null,
                    "is_pgc_author":false,
                    "user_id":4751518306,
                    "name":"龟话",
                    "author_badge":[

                    ],
                    "user_relation":0,
                    "verified_reason":"",
                    "avatar_url":"http://p3.pstatp.com/thumb/438900033d3b90e713d7"
                },
                "text":"哈哈，人脸识别[送心][送心]",
                "user_digg":false,
                "id":1586855174661198,
                "content_rich_span":"",
                "digg_count":1
            },
            {
                "content":"老大好[大笑]",
                "create_time":1513341603,
                "is_owner":false,
                "user":{
                    "is_followed":null,
                    "description":"分享最潮流美食，管理资讯，厨师秘籍，厨师界关注最多的自媒体！",
                    "screen_name":"名厨汇",
                    "is_following":null,
                    "is_blocked":null,
                    "user_verified":true,
                    "user_auth_info":"{"auth_type": "0", "auth_info": "美食达人"}",
                    "is_blocking":null,
                    "is_pgc_author":false,
                    "user_id":2747621738,
                    "name":"名厨汇",
                    "author_badge":[

                    ],
                    "user_relation":0,
                    "verified_reason":"美食达人",
                    "avatar_url":"http://p1.pstatp.com/thumb/36410009bb33cd43d034"
                },
                "text":"老大好[大笑]",
                "user_digg":false,
                "id":1586853684609053,
                "content_rich_span":"",
                "digg_count":1
            }
        ],
        "id":1586852090470414,
        "hot_comments":[

        ]
    },
    "stable":true
}
```

## 用户详情-文章

- 请求方式：GET
- 请求地址：/dongtai/list/v10/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| user_id |   Int  |   Y    | 用户的 ID | 53271122458 |
|   device_id    |   Int  |   Y    | 用户的 ID | 53271122458 |
|     iid   | Int    |  Y   |    | 53271122458 |

**返回数据和动态类似**

## 用户详情-视频

- 请求方式：GET
- 请求地址：/pgc/ma/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| media_id |   Int  |   Y    | 用户的 ID | 53271122458 |
|   uid    |   Int  |   Y    | 用户的 ID | 53271122458 |
|max_behot_time|   Int  |   Y    | 用户的 ID | 1510025153『秒数』 |
|     as   | Int    |  Y   |    | A1856A615F87457 |
|  output  |   String  |   Y    |  输出 | json |
|  count   |   Int  |   Y    |  输出 | 20 |
| page_type|   Int  |   Y    |  | **0(视频)** |
|   from   |   Int  |   N    | 来源 | user_profile_app |
|  version | Int    |  N   | 版本   | 2 |
|    cp    | Int    |  N   |    | 5A1F871485672E1 |

> 加载更多数据时，`max_behot_time` 的参数是获取到的数据中的最后一条数据的创建时间。

**返回数据比较多，不再展示。**

## 用户详情-问答

- 请求方式：GET
- 请求地址：/wenda/profile/wendatab/brow/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| other_id |   Int  |   Y    | 用户的 ID | 8 |
| format |   Int  |   Y    | 格式 | json |
| from_channel |   Int  |   N    | 来源 | media_channel |
| device_id       | Int    |  N   | 设备 ID   | 8800803362 |

## 用户详情-问答-加载更多

- 请求方式：GET
- 请求地址：/wenda/profile/wendatab/loadmore/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| other_id |   Int  |   Y    | 用户的 ID | 8 |
| format |   Int  |   Y    | 格式 | json |
| cursor       | Int    |  N   | 指示器   | 6241683443818692866 |
| from_channel |   Int  |   N    | 来源 | media_channel |
| device_id       | Int    |  N   | 设备 ID   | 8800803362 |
| count       | Int    |  N   | 加载条数   | 10 |
| offset       | Int    |  N   |    | undefined |

![马未都](img/user_detail/user_detail_wenda.png)

```
{
    "cursor":"6241683443818692866",
    "err_no":0,
    "answer_question":[
        {
            "answer":{
                "show_time":"2017.08.30",
                "content_abstract":{
                    "text":"知识应该分享的 我们只是鼓励创作 。一如既往 我们会覆盖长尾 从阳春白雪到下里巴人 只是要做好匹配。大家别吵了 上来答题吧。",
                    "thumb_image_list":[

                    ],
                    "large_image_list":[

                    ]
                },
                "user":{
                    "is_verify":1,
                    "uname":"张一鸣",
                    "create_time":1325225113,
                    "user_auth_info":"{"auth_type":"1","auth_info":"\u4eca\u65e5\u5934\u6761\u521b\u59cb\u4eba\u517cCEO"}",
                    "user_id":"8",
                    "avatar_url":"http://p3.pstatp.com/thumb/db40005ee1157a3aeb0",
                    "profit_amount":0,
                    "user_intro":"今日头条创始人兼CEO",
                    "profit_user":true,
                    "medals":[

                    ],
                    "schema":"sslocal://profile?uid=8&refer=wenda"
                },
                "ans_url":"https://ic.snssdk.com/wenda/v1/wapanswer/content/?ansid=6459738464865747213",
                "ansid":"6459738464865747213",
                "is_show_bury":false,
                "wap_url":"https://www.wukong.com/answer/6459738464865747213/",
                "is_buryed":false,
                "bury_count":0,
                "title":"",
                "is_delete":0,
                "digg_count":663,
                "content":"<p>知识应该分享的 我们只是鼓励创作 。一如既往 我们会覆盖长尾 从阳春白雪到下里巴人 只是要做好匹配。大家别吵了 上来答题吧。</p>",
                "brow_count":197576,
                "is_digg":false,
                "schema":"sslocal://wenda_detail?gd_ext_json=%7B%22article_type%22%3A%22wenda%22%2C%22author_id%22%3A%228%22%7D&ansid=6459738464865747213&api_param=%7B%22scope%22%3A%22toutiao_wenda%22%2C%22origin_from%22%3A%22click_headline%22%2C%22parent_enter_from%22%3A%22question%22%2C%22enter_from%22%3A%22answer_detail%22%7D"
            },
            "question":{
                "content":{
                    "text":"8月29日下午，有人在朋友圈爆料称，悟空问答签约了300多个大V，罗振宇转发后引发激烈讨论，你怎么看？",
                    "pic_uri_list":[
                        {
                            "width":498,
                            "type":"1",
                            "web_uri":"3831000589f55c3e04ce",
                            "height":263
                        }
                    ],
                    "thumb_image_list":[
                        {
                            "url":"http://p1.pstatp.com/list/r498/3831000589f55c3e04ce",
                            "url_list":[
                                {
                                    "url":"http://p1.pstatp.com/list/r498/3831000589f55c3e04ce"
                                },
                                {
                                    "url":"http://pb3.pstatp.com/list/r498/3831000589f55c3e04ce"
                                },
                                {
                                    "url":"http://pb3.pstatp.com/list/r498/3831000589f55c3e04ce"
                                }
                            ],
                            "uri":"3831000589f55c3e04ce",
                            "height":263,
                            "width":498,
                            "type":1
                        }
                    ],
                    "large_image_list":[
                        {
                            "url":"http://p1.pstatp.com/large/3831000589f55c3e04ce",
                            "url_list":[
                                {
                                    "url":"http://p1.pstatp.com/large/3831000589f55c3e04ce"
                                },
                                {
                                    "url":"http://pb3.pstatp.com/large/3831000589f55c3e04ce"
                                },
                                {
                                    "url":"http://pb3.pstatp.com/large/3831000589f55c3e04ce"
                                }
                            ],
                            "uri":"3831000589f55c3e04ce",
                            "height":263,
                            "width":498,
                            "type":1
                        }
                    ]
                },
                "tag_name":"",
                "create_time":1504001788,
                "normal_ans_count":47,
                "user":{
                    "is_verify":0,
                    "uname":"用户65146878",
                    "create_time":1433388228,
                    "user_auth_info":"",
                    "user_id":"4474648172",
                    "avatar_url":"http://s0.pstatp.com/image/avatar.png",
                    "profit_amount":78,
                    "user_intro":"",
                    "profit_user":true,
                    "medals":[

                    ],
                    "schema":"sslocal://profile?uid=4474648172&refer=wenda"
                },
                "title":"如何看悟空问答签约大V答主？",
                "qid":"6459638491356594445",
                "nice_ans_count":101,
                "tag_id":0,
                "fold_reason":{
                    "open_url":"sslocal://detail?groupid=6293724675596402946",
                    "title":"为什么折叠？"
                }
            }
        }
    ],
    "err_tips":"",
    "api_param":{
        "origin_from":"out_wenda",
        "enter_from":"out_wenda"
    },
    "has_more":false,
    "login_user":{

    },
    "total":7,
    "user_data":{
        "all_brow_cnt_str":"5238万人读过你的回答",
        "is_verify":0,
        "curretn_month_digg_cnt_str":"本月共0人点赞",
        "all_digg_cnt_str":"回答获0人点赞",
        "current_month_brow_cnt":"98万",
        "youzhi_info":[

        ],
        "laomo_info":[

        ],
        "uname":"",
        "all_brow_cnt":"5238万",
        "is_valid":1,
        "current_month_brow_cnt_str":"本月共98万人浏览",
        "user_intro":"",
        "current_month_digg_cnt":"0",
        "all_digg_cnt":"0",
        "user_profile_image_url":"",
        "ming_ren_tang":"",
        "schema":""
    },
    "can_ask":false
}
```
## 用户详情-小视频

- 请求方式：GET
- 请求地址：/user/profile/tabs/ies/?
- 请求参数

| 参数     |  类型  | 是否必须 |   描述   |     示例     |
| ------- | -----  | ------ | -------- | ----------- |
| user_id |   Int  |   Y    | 用户的 ID | 53271122458 |
| iid |   Int  |   N    | 用户的 ID | 18145386087 |
| count |   Int  |   N    |  | 15 |
| device_id       | Int    |  N   | 设备 ID   | 8800803362 |

**数据比较多，不再展示**


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



