




const serviceUrl = "http://132.232.45.108:8888";


const servicePath = {
  "login" : serviceUrl + "/login/cellphone",               // /login/cellphone?phone=xxx&password=yyy
  "userDetail" : serviceUrl + "/user/detail",              // 必选参数 : uid : 用户 id
  "userPlaylist" : serviceUrl + "/user/playlist",
  "playlistdetail" : serviceUrl + "/playlist/detail",      // 传入歌单id
  "banner": serviceUrl + "/banner",                        // 轮播图
  "personalized": serviceUrl + "/personalized",            // 推荐歌单
  "newsong": serviceUrl + "/personalized/newsong",         // 获取推荐新音乐
  "userFollows": serviceUrl + "/user/follows",             // 传入用户 id, 可以获取用户关注列表
  "userFolloweds": serviceUrl + "/user/followeds",         // 传入用户 id, 可以获取用户粉丝列表
  "userdj" : serviceUrl + "/user/dj",                      // 传入用户 id, 可以获取用户电台
  "songurl" : serviceUrl + "/song/url",                    // 传入的音乐 id 可选参数 : br: 码率 如果要 320k 则可设置为 320000,其他类推
  "checkmusic" : serviceUrl + "/check/music",              // 传入歌曲 id, 可获取音乐是否可用
  "songdetail" : serviceUrl + "/song/detail",              // 获取歌曲详情   ids: 音乐 id, 如 ids=347230

  
  // 搜索
  "search" : serviceUrl + "/search",                       // 必选参数 : keywords : 关键词
                                                           // 可选参数 : limit : 返回数量 , 默认为 30 offset : 偏移数量，用于分页 , 如 : 如 :( 页数 -1)*30, 其中 30 为 limit 的值 , 默认为 0
                                                           // type: 搜索类型；默认为 1 即单曲 , 取值意义 : 1: 单曲, 10: 专辑, 100: 歌手, 1000: 歌单, 1002: 用户, 1004: MV, 1006: 歌词, 1009: 电台, 1014: 视频
  "searchhot" : serviceUrl + "/search/hot",                // 获取热门搜索列表
  "searchsuggest" : serviceUrl + "/search/suggest",        // 搜索建议  必选参数 : keywords : 关键词  可选参数 : type : 如果传 'mobile' 则返回移动端数据
  "searchmultimatch" : serviceUrl + "/search/multimatch",  // 搜索多重匹配 必选参数 : keywords : 关键词  调用此接口 , 传入搜索关键词可获得搜索结果
  
  "lyric" : serviceUrl + "/lyric",                         // 传入音乐 id 可获得对应音乐的歌词

  // Mv相关
  "mvDetail" : serviceUrl + "/mv/detail",                  // 获取 mv 数据   必选参数 : mvid: mv 的 id
  "mvUrl" : serviceUrl + "/mv/url",                        // 说明 : 调用此接口 , 传入 mv id,可获取 mv 播放地址     /mv/url?id=5436712
  "relatedAllvideo" : serviceUrl + "/related/allvideo",    // 必选参数 : id: 视频 的 id     调用此接口 , 可获取相关视频
  "videoDetail" : serviceUrl + "/video/detail",            // 视频详情    id: 视频 的 id
  "videoUrl" : serviceUrl + "/video/url",                  // 调用此接口 , 传入视频 id,可获取视频播放地址      必选参数 : id: 视频 的 id
  "commentMv" : serviceUrl + "/comment/mv",                // 调用此接口 , 传入音乐 id 和 limit 参数 , 可获得该 mv 的所有评论 ( 不需要 登录 )
                                                           // limit: 取出评论数量 , 默认为 20   offset: 偏移数量 , 用于分页 , 如 :( 评论页数 -1)*20, 其中 20 为 limit 的值
  "simiMv" : serviceUrl + "/simi/mv",                      // 相似 mv    ~说明 : 调用此接口 , 传入 mvid 可获取相似 mv   ~必选参数 : mvid: mv id   ~/simi/mv?mvid=5436712
 


};



var ces = "http://132.232.45.108:8888/login/cellphone?id=32977771&br=128000";
var id = 109496832;



