
const serviceUrl = "http://132.232.45.108:8888";


const servicePath = {
  "login" : serviceUrl + "/login/cellphone",                  // /login/cellphone?phone=xxx&password=yyy
  "userDetail" : serviceUrl + "/user/detail",                 // 必选参数 : uid : 用户 id
  "userPlaylist" : serviceUrl + "/user/playlist",
  "playlistdetail" : serviceUrl + "/playlist/detail",         // 传入歌单id
  "userFollows": serviceUrl + "/user/follows",                // 传入用户 id, 可以获取用户关注列表
  "userFolloweds": serviceUrl + "/user/followeds",            // 传入用户 id, 可以获取用户粉丝列表
  "userdj" : serviceUrl + "/user/dj",                         // 传入用户 id, 可以获取用户电台

  // home
  "banner": serviceUrl + "/banner",                           // 轮播图
  "personalized": serviceUrl + "/personalized",               // 推荐歌单
  "newsong": serviceUrl + "/personalized/newsong",            // 获取推荐新音乐

  // 音乐
  "simiSong" : serviceUrl + "/simi/song",                     // 调用此接口 , 传入歌曲 id, 可获得相似歌曲  必选参数 : id: 歌曲 id
  "songurl" : serviceUrl + "/song/url",                       // 传入的音乐 id 可选参数 : br: 码率 如果要 320k 则可设置为 320000,其他类推
  "checkmusic" : serviceUrl + "/check/music",                 // 传入歌曲 id, 可获取音乐是否可用
  "songdetail" : serviceUrl + "/song/detail",                 // 获取歌曲详情   ids: 音乐 id, 如 ids=347230

  // 签到
  "daily_signin" : serviceUrl + "/daily_signin",              // 签到

  
  // 搜索
  "search" : serviceUrl + "/search",                          // 必选参数 : keywords : 关键词
                                                              // 可选参数 : limit : 返回数量 , 默认为 30 offset : 偏移数量，用于分页 , 如 : 如 :( 页数 -1)*30, 其中 30 为 limit 的值 , 默认为 0
                                                              // type: 搜索类型；默认为 1 即单曲 , 
                                                              // 取值意义 : 1: 单曲, 10: 专辑, 100: 歌手, 1000: 歌单, 1002: 用户, 1004: MV, 1006: 歌词, 1009: 电台, 1014: 视频
  "searchhot" : serviceUrl + "/search/hot",                   // 获取热门搜索列表
  "searchsuggest" : serviceUrl + "/search/suggest",           // 搜索建议  必选参数 : keywords : 关键词  可选参数 : type : 如果传 'mobile' 则返回移动端数据
  "searchmultimatch" : serviceUrl + "/search/multimatch",     // 搜索多重匹配 必选参数 : keywords : 关键词  调用此接口 , 传入搜索关键词可获得搜索结果
  
  "lyric" : serviceUrl + "/lyric",                            // 传入音乐 id 可获得对应音乐的歌词

  // Mv相关
  "mvDetail" : serviceUrl + "/mv/detail",                     // 获取 mv 数据   必选参数 : mvid: mv 的 id
  "mvUrl" : serviceUrl + "/mv/url",                           // 说明 : 调用此接口 , 传入 mv id,可获取 mv 播放地址     /mv/url?id=5436712
  "commentMv" : serviceUrl + "/comment/mv",                   // 调用此接口 , 传入音乐 id 和 limit 参数 , 可获得该 mv 的所有评论 ( 不需要 登录 )
                                                              // limit: 取出评论数量 , 默认为 20   offset: 偏移数量 , 用于分页 , 如 :( 评论页数 -1)*20, 其中 20 为 limit 的值
  "commentHot" : serviceUrl + "/comment/hot",                 // 说明 : 调用此接口 , 传入 type, 资源 id 可获得对应资源热门评论 
                                                              // id : 资源 idtpye: 数字 , 资源类型 , 对应歌曲 , mv, 专辑 , 歌单 , 电台, 视频对应以下类型
                                                              // 0: 歌曲   1: mv 2: 歌单 3: 专辑 4: 电台 5: 视频
  "simiMv" : serviceUrl + "/simi/mv",                         // 相似 mv    ~说明 : 调用此接口 , 传入 mvid 可获取相似 mv   ~必选参数 : mvid: mv id   ~/simi/mv?mvid=5436712

  // 视频
  "commentVideo" : serviceUrl + "/comment/video",             // 必选参数 : id: 视频的 id  可选参数 : limit: 取出评论数量 , 默认为 20  offset: 偏移数量 , 用于分页 ,
  "relatedAllvideo" : serviceUrl + "/related/allvideo",       // 必选参数 : id: 视频 的 id     调用此接口 , 可获取相关视频
  "videoDetail" : serviceUrl + "/video/detail",               // 视频详情    id: 视频 的 id
  "videoUrl" : serviceUrl + "/video/url",                     // 调用此接口 , 传入视频 id,可获取视频播放地址      必选参数 : id: 视频 的 id
  "videoGroup" : serviceUrl + "/video/group",                 // 说明 : 调用此接口 , 传入videoGroupId,可获取到相关的视频。 传入videoGroupId: videoGroup 的 id  /video/group?id=9104

  // 动态
  "event" : serviceUrl + "/event",                            // 调用此接口 , 可获取各种动态 , 对应网页版网易云，朋友界面里的各种动态消息
                                                              // 必选参数 :  pagesize : 每页数据,默认20  lasttime : 返回数据的 lasttime ,默认-1,传入上一次返回结果的 lasttime,将会返回下一页的数据
  "userEvent" : serviceUrl + "/user/event",                   // 传入用户 id, 可以获取用户动态  必选参数 : uid : 用户 id limit : 返回数量 , 
                                                              // lasttime : 返回数据的 lasttime ,默认-1,传入上一次返回结果的 lasttime,将会返回下一页的数据
                                                              
  // 评论 
  "commentEvent" : serviceUrl + "/comment/event",             // 可以获取动态下评论  threadId : 动态 id，
  "commentPlaylist" : serviceUrl + "/comment/playlist",       // 传入音乐 id 和 limit 参数 , 可获得该歌单的所有评论  必选参数 : id: 歌单 id  limit  offset: 偏移数量
  "commentMusic" : serviceUrl + "/comment/music",             // 传入音乐 id 和 limit 参数 , 可获得该音乐的所有评论  可选参数 : limit: 取出评论数量 , 默认为 20 offset: 偏移数量 
  "commentLike" : serviceUrl + "comment/like",                // 给评论点赞    必选参数 : id : 资源 id, 如歌曲 id,mv id
                                                              // cid : 评论 id
                                                              // t : 是否点赞 ,1 为点赞 ,0 为取消点赞
                                                              // tpye: 数字 , 资源类型 , 对应歌曲 , mv, 专辑 , 歌单 , 电台, 视频对应以下类型
  "commentAlbum" : serviceUrl + "/comment/album",             // 该专辑的所有评论   id: 专辑 id  limit: 取出评论数量 , 默认为 20
  // 专辑
  "album" : serviceUrl + "/album",                            // 调用此接口 , 传入专辑 id, 可获得专辑内容
                                                            


};



var ces = "http://132.232.45.108:8888/mv/url?id=5436712/login/cellphone?id=32977771&br=128000";
var id = 109496832;



