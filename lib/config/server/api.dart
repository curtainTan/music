




const serviceUrl = "http://132.232.45.108:8888";


const servicePath = {
  "login" : serviceUrl + "/login/cellphone",
  "userDetail" : serviceUrl + "/user/detail",
  "userPlaylist" : serviceUrl + "/user/playlist",
  "playlistdetail" : serviceUrl + "/playlist/detail",      // 传入歌单id
  "banner": serviceUrl + "/banner",                        // 轮播图
  "personalized": serviceUrl + "/personalized",            // 推荐歌单
  "newsong": serviceUrl + "/personalized/newsong",         // 获取推荐新音乐
  "userFollows": serviceUrl + "/user/follows",             // 传入用户 id, 可以获取用户粉丝列表
  "userFolloweds": serviceUrl + "/user/followeds",         // 传入用户 id, 可以获取用户关注列表
  "userdj" : serviceUrl + "/user/dj",                      // 传入用户 id, 可以获取用户电台
  "songurl" : serviceUrl + "/song/url",                    // 传入的音乐 id 可选参数 : br: 码率 如果要 320k 则可设置为 320000,其他类推
  "checkmusic" : serviceUrl + "/check/music",              // 传入歌曲 id, 可获取音乐是否可用
  "search" : serviceUrl + "/search",                       // 必选参数 : keywords : 关键词
                                                           // 可选参数 : limit : 返回数量 , 默认为 30 offset : 偏移数量，用于分页 , 如 : 如 :( 页数 -1)*30, 其中 30 为 limit 的值 , 默认为 0
                                                           // type: 搜索类型；默认为 1 即单曲 , 取值意义 : 1: 单曲, 10: 专辑, 100: 歌手, 1000: 歌单, 1002: 用户, 1004: MV, 1006: 歌词, 1009: 电台, 1014: 视频
  "searchhot" : serviceUrl + "/search/hot",                // 获取热门搜索列表
  "lyric" : serviceUrl + "/lyric",                         // 传入音乐 id 可获得对应音乐的歌词





};



var ces = "http://132.232.45.108:8888/song/url?id=31877536&br=128000";
var id = 109496832;


