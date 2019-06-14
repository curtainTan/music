# music
    前言：我想把代码写得像诗一般优美，
    每个函数都恰到好处


## 当前项目已经完成的功能：

- splah页面
- 登录
- 播放音乐
- 显示歌词
- 歌词跟随
- 上一曲/下一曲
- 搜索
- 搜索提示
- 播放mv/video
- 用户中心
- 评论页(歌单和歌曲)--歌单页点击播放相似歌曲，播放当前评论歌曲
- 在歌单中指定下一曲播放歌曲

## 接下来要完成的功能

- 评论（带emoji表情的）(写不了了，数据传输搞不定，CSRF不会---)
- 设置皮肤
- 动态展示

### 体验方式：
    由于没有ios手机，暂时只支持安卓。
<a href="https://www.curtaintan.club/music.apk" target="_blank" >点我下载</a>

扫码下载：<a><img src="./asset/picture/some/musicApp.png" width="100" ></a>

---

## 嘤嘤嘤

项目写了有接近一个月了，进度很慢，很多东西都是在实践中学习，一点一点来的.....

好可惜啊，界面还没有写完，网易的界面就更新了

---

下面放上截图：
## 6.4更新  添加showModalBottomSheet,并把部分函数抽离，上图：
<a><img src="./asset/picture/modal.png" width="200" ></a>
<a><img src="./asset/picture/modal1.png" width="200" ></a>

## 6.2更新  歌曲评论和歌单评论
<a><img src="./asset/picture/comment.png" width="200" ></a>
<a><img src="./asset/picture/comment1.png" width="200" ></a>

## 5.30更新
<a><img src="./asset/picture/gif/mvPage.gif" width="200" ></a>
<a><img src="./asset/picture/search.png" width="200" ></a>
<a><img src="./asset/picture/search1.png" width="200" ></a>

## 5.15更新
### 增加了搜索的数据管理结构，界面还没开始写，手写了搜索推荐的局部dialog，上图吧，
<a><img src="./asset/picture/gif/search_modal.gif" width="200" ></a>

    局部dialog，嘿嘿，我觉得写得蛮不错的，

## 5.4更新
### 动图来了，这次更新了很多
### 进入app时的splash屏闪页、进入登录页面的动画，登录提示
<a><img src="./asset/picture/gif/splash.gif" width="200" ></a>
<a><img src="./asset/picture/gif/login.gif" width="200" ></a>

### Home页相关：歌单点击动画、drawer、二级导航联动
<span><img src="./asset/picture/gif/twoNav.gif" width="200" ></span>

### 歌单和用户中心：歌单展示和歌单Header折叠
<span><img src="./asset/picture/gif/songListHeader.gif" width="200" ></span>
<span><img src="./asset/picture/gif/userData.gif" width="200" ></span>

### 歌曲播放页面：点歌、在播放页面点下一曲和上一曲、播放和暂停
<span><img src="./asset/picture/gif/changeSong.gif" width="200" ></span>
<span><img src="./asset/picture/gif/nextSong.gif" width="200" ></span>
<span><img src="./asset/picture/gif/playandstop.gif" width="200" ></span>

### 歌词跟随，歌词可以跟随进度条改动而调整，可以拉动查看歌词
<span><img src="./asset/picture/gif/lyric.gif" width="200" ></span>

### 第一屏   登录 home页面 Drower页面、第二个页面
<span><img src="./asset/picture/1.png" width="200" ></span>
<span><img src="./asset/picture/3.png" width="200" ></span>
<span><img src="./asset/picture/4.png" width="200" ></span>
<span><img src="./asset/picture/5.png" width="200" ></span>

    这里使用了extended_tabs插件，来解决二级导航滑动的问题，，，，，
    相信写过的小伙伴知道我说的二级导航滑动的问题，这里当初自己写写了好久，我哭了.......


### 一级导航的第二页 一级导航的第二页中的第二页 个人中心
<span><img src="./asset/picture/6.png" width="200" ></span>
<span><img src="./asset/picture/7.png" width="200" ></span>
<span><img src="./asset/picture/8.png" width="200" ></span>


### 项目难点与问题解决

#### 1.首当其冲的是后台数据：
    后台使用Binaryify写的NeteaseCloudMusicApi项目提供的api，真的非常感谢!
<a href="https://github.com/Binaryify/NeteaseCloudMusicApi" target="_blank" >NeteaseCloudMusicApi的github地址</a>

<a href="https://binaryify.github.io/NeteaseCloudMusicApi" target="_blank" >NeteaseCloudMusicApi api文档</a>

#### 2.安卓9无法播放音乐的问题：
    无法在Android 9上播放远程文件：Android 9已经更改了一些网络安全默认值，
    因此默认情况下它可能会阻止您播放https以外的文件，此stackoverflow问题是解决此问题的良好来源。
解决方法：
    在android/app/src/main/AndroidManifest.xml文件中添加：android:usesCleartextTraffic="true"

    <manifest ...>
        <uses-permission android:name="android.permission.INTERNET" />
        <application
            ...
            android:usesCleartextTraffic="true"
            ...>
            ...
        </application>
    </manifest>

#### 3.使用高斯模糊：
    使用高斯模糊时，背景层全屏模糊
    解决办法：
        在BackdropFilter组件的外层包裹ClipRect，
        详细使用请参考文件：lib/views/songList/header.dart

#### 4.二级导航栏联动：
    到tabview中嵌套tabBar-tabview时，二级目录是不能滑动到一级目录去的，
此时就要借助插件：<a href="https://pub.flutter-io.cn/packages?q=extended_tabs"  target="_blank" >extended_tabs</a>
    使用文档：[文档](https://juejin.im/post/5c34b87ef265da61553b01a8)

#### 5.修改启动白屏为想要的图片：
    修改文件android/app/srrc/main/res/drawable/launch_background.xml
    添加：
        <item>
            <bitmap
                android:gravity="center"
                android:src="@mipmap/sp" />
        </item>
    添加完后的代码：
        <layer-list xmlns:android="http://schemas.android.com/apk/res/android">
            <item>
                <bitmap
                    android:gravity="center"
                    android:src="@mipmap/sp" />
            </item>
        </layer-list>
    再在下面的目录下添加名称为sp的png图片，
    这里必须使用png格式的图片，安卓默认的图片格式
<a><img src="./asset/picture//some/path.png" width="200" ></a>

#### 6.状态管理：
    状态管理使用的provide，现在谷歌已经公开宣布放弃了，并推荐使用provider，
    由于项目已经写差不多了，我就不打算再进行更改了，

#### 7.josn序列化：
    数据请求，获取到json后，我们直接使用json数据很不方便，这里我们就要把json数据转为dart对象，这里我使用下面的网站将json数据转为dart对象的，
    在进行转换时，我们要对json数据进行处理，
    josn中不要有空对象，空数组，null值
网址：<a href="https://javiercbk.github.io/json_to_dart/" target="_blank" >JSON to Dart</a>


### 对页面布局和组件选用的思考：
    flutter的组件是真的多，只有你想不到的，没有它不存在的，
    不同的组件有不同是属性，构造方法也五花八门，
    这里我列出几个比较常见的页面的布局和组件选用时的思考。
1. Sliver大家族是个不错的选择--

### 目录结构

```
    |-- android                                  // 安卓配置目录
    |-- asset                                    // 项目静态资源目录
    |   |-- font                                 // 字体和图标文件
    |   |-- image                                // 静态图片文件
    |-- ios                                      // ios配置目录
    |-- lib                                      // 源码目录
    |   |-- commonFunc                           // 通用方法文件
    |   |-- component                            // 组件
    |   |-- config                               
    |       |-- json                             // 请求接口获取的json文件
    |       |-- server                           // api接口文件
    |   |-- modal                                // json转成dart对象后的模型
    |   |-- provider                             // provide状态管理目录
    |   |-- routers                              // 路由文件
    |   |-- service                              // 封装dio请求方法
    |   |-- view                                 // 页面目录
    |   main.dart                                // 程序入口文件
    |-- .gitignore                               // 配置git忽略的文件
    |-- pubspec.lock                             // 记录当前项目依赖的包和版本  
    |-- pubspec.yaml                             // 包管理文件
```

### 开发的感悟与总结
    首先，对组件式开发和函数式编程有了更深的见解：
    样式差不多的组件，一定要封装，用起来会非常爽的，
    对常用的组件：加载中，加载完成，showModal---,图片，一定要封装.....

    
    写了dart之后，才深深的了解到自己之前写代码时眼界的浅短,
    此后，写代码时我会考虑的更多。
    尽力写出优雅的代码。


# 写下此片文章，希望对你有帮助，与君共勉.....


