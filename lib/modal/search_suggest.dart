class SearchSuggestMul {
  Result result;
  int code;

  SearchSuggestMul({this.result, this.code});

  SearchSuggestMul.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class Result {
  List<Albums> albums;
  List<Artists> artists;
  List<Songs> songs;
  List<Playlists> playlists;
  List<Mvs> mvs;
  List<String> order;

  Result(
      {this.albums,
      this.artists,
      this.songs,
      this.playlists,
      this.mvs,
      this.order});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['albums'] != null) {
      albums = new List<Albums>();
      json['albums'].forEach((v) {
        albums.add(new Albums.fromJson(v));
      });
    }
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    if (json['songs'] != null) {
      songs = new List<Songs>();
      json['songs'].forEach((v) {
        songs.add(new Songs.fromJson(v));
      });
    }
    if (json['playlists'] != null) {
      playlists = new List<Playlists>();
      json['playlists'].forEach((v) {
        playlists.add(new Playlists.fromJson(v));
      });
    }
    if (json['mvs'] != null) {
      mvs = new List<Mvs>();
      json['mvs'].forEach((v) {
        mvs.add(new Mvs.fromJson(v));
      });
    }
    order = json['order'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.albums != null) {
      data['albums'] = this.albums.map((v) => v.toJson()).toList();
    }
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.songs != null) {
      data['songs'] = this.songs.map((v) => v.toJson()).toList();
    }
    if (this.playlists != null) {
      data['playlists'] = this.playlists.map((v) => v.toJson()).toList();
    }
    if (this.mvs != null) {
      data['mvs'] = this.mvs.map((v) => v.toJson()).toList();
    }
    data['order'] = this.order;
    return data;
  }
}

class Albums {
  int id;
  String name;
  SongArtist songArtist;
  int publishTime;
  int size;
  int copyrightId;
  int status;
  int picId;

  Albums(
      {this.id,
      this.name,
      this.songArtist,
      this.publishTime,
      this.size,
      this.copyrightId,
      this.status,
      this.picId});

  Albums.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    songArtist = json['songArtist'] != null
        ? new SongArtist.fromJson(json['songArtist'])
        : null;
    publishTime = json['publishTime'];
    size = json['size'];
    copyrightId = json['copyrightId'];
    status = json['status'];
    picId = json['picId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.songArtist != null) {
      data['songArtist'] = this.songArtist.toJson();
    }
    data['publishTime'] = this.publishTime;
    data['size'] = this.size;
    data['copyrightId'] = this.copyrightId;
    data['status'] = this.status;
    data['picId'] = this.picId;
    return data;
  }
}

class SongArtist {
  int id;
  String name;
  String picUrl;
  int albumSize;
  int picId;
  String img1v1Url;
  int img1v1;
  List<String> transNames;
  String trans;

  SongArtist(
      {this.id,
      this.name,
      this.picUrl,
      this.albumSize,
      this.picId,
      this.img1v1Url,
      this.img1v1,
      this.transNames,
      this.trans});

  SongArtist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    albumSize = json['albumSize'];
    picId = json['picId'];
    img1v1Url = json['img1v1Url'];
    img1v1 = json['img1v1'];
    transNames = json['transNames'].cast<String>();
    trans = json['trans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
    data['albumSize'] = this.albumSize;
    data['picId'] = this.picId;
    data['img1v1Url'] = this.img1v1Url;
    data['img1v1'] = this.img1v1;
    data['transNames'] = this.transNames;
    data['trans'] = this.trans;
    return data;
  }
}

class Artists {
  int id;
  String name;
  String picUrl;
  List<String> alias;
  int albumSize;
  int picId;
  String img1v1Url;
  int img1v1;

  Artists(
      {this.id,
      this.name,
      this.picUrl,
      this.alias,
      this.albumSize,
      this.picId,
      this.img1v1Url,
      this.img1v1});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    alias = json['alias'].cast<String>();
    albumSize = json['albumSize'];
    picId = json['picId'];
    img1v1Url = json['img1v1Url'];
    img1v1 = json['img1v1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
    data['alias'] = this.alias;
    data['albumSize'] = this.albumSize;
    data['picId'] = this.picId;
    data['img1v1Url'] = this.img1v1Url;
    data['img1v1'] = this.img1v1;
    return data;
  }
}

class Songs {
  int id;
  String name;
  List<SongArtistsss> songArtistsss;
  Album album;
  int duration;
  int copyrightId;
  int status;
  List<String> alias;
  int rtype;
  int ftype;
  int mvid;
  int fee;

  Songs(
      {this.id,
      this.name,
      this.songArtistsss,
      this.album,
      this.duration,
      this.copyrightId,
      this.status,
      this.alias,
      this.rtype,
      this.ftype,
      this.mvid,
      this.fee});

  Songs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['songArtistsss'] != null) {
      songArtistsss = new List<SongArtistsss>();
      json['songArtistsss'].forEach((v) {
        songArtistsss.add(new SongArtistsss.fromJson(v));
      });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    duration = json['duration'];
    copyrightId = json['copyrightId'];
    status = json['status'];
    alias = json['alias'].cast<String>();
    rtype = json['rtype'];
    ftype = json['ftype'];
    mvid = json['mvid'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.songArtistsss != null) {
      data['songArtistsss'] =
          this.songArtistsss.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['duration'] = this.duration;
    data['copyrightId'] = this.copyrightId;
    data['status'] = this.status;
    data['alias'] = this.alias;
    data['rtype'] = this.rtype;
    data['ftype'] = this.ftype;
    data['mvid'] = this.mvid;
    data['fee'] = this.fee;
    return data;
  }
}

class SongArtistsss {
  int id;
  String name;
  int albumSize;
  int picId;
  String img1v1Url;
  int img1v1;

  SongArtistsss(
      {this.id,
      this.name,
      this.albumSize,
      this.picId,
      this.img1v1Url,
      this.img1v1});

  SongArtistsss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    albumSize = json['albumSize'];
    picId = json['picId'];
    img1v1Url = json['img1v1Url'];
    img1v1 = json['img1v1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['albumSize'] = this.albumSize;
    data['picId'] = this.picId;
    data['img1v1Url'] = this.img1v1Url;
    data['img1v1'] = this.img1v1;
    return data;
  }
}

class Album {
  int id;
  String name;
  AlbumArtist albumArtist;
  int publishTime;
  int size;
  int copyrightId;
  int status;
  int picId;

  Album(
      {this.id,
      this.name,
      this.albumArtist,
      this.publishTime,
      this.size,
      this.copyrightId,
      this.status,
      this.picId});

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    albumArtist = json['albumArtist'] != null
        ? new AlbumArtist.fromJson(json['albumArtist'])
        : null;
    publishTime = json['publishTime'];
    size = json['size'];
    copyrightId = json['copyrightId'];
    status = json['status'];
    picId = json['picId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.albumArtist != null) {
      data['albumArtist'] = this.albumArtist.toJson();
    }
    data['publishTime'] = this.publishTime;
    data['size'] = this.size;
    data['copyrightId'] = this.copyrightId;
    data['status'] = this.status;
    data['picId'] = this.picId;
    return data;
  }
}

class AlbumArtist {
  int id;
  String name;
  int albumSize;
  int picId;
  String img1v1Url;
  int img1v1;

  AlbumArtist(
      {this.id,
      this.name,
      this.albumSize,
      this.picId,
      this.img1v1Url,
      this.img1v1});

  AlbumArtist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    albumSize = json['albumSize'];
    picId = json['picId'];
    img1v1Url = json['img1v1Url'];
    img1v1 = json['img1v1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['albumSize'] = this.albumSize;
    data['picId'] = this.picId;
    data['img1v1Url'] = this.img1v1Url;
    data['img1v1'] = this.img1v1;
    return data;
  }
}

class Playlists {
  int id;
  String name;
  String coverImgUrl;
  bool subscribed;
  int trackCount;
  int userId;
  int playCount;
  int bookCount;
  String description;
  bool highQuality;

  Playlists(
      {this.id,
      this.name,
      this.coverImgUrl,
      this.subscribed,
      this.trackCount,
      this.userId,
      this.playCount,
      this.bookCount,
      this.description,
      this.highQuality});

  Playlists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coverImgUrl = json['coverImgUrl'];
    subscribed = json['subscribed'];
    trackCount = json['trackCount'];
    userId = json['userId'];
    playCount = json['playCount'];
    bookCount = json['bookCount'];
    description = json['description'];
    highQuality = json['highQuality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['coverImgUrl'] = this.coverImgUrl;
    data['subscribed'] = this.subscribed;
    data['trackCount'] = this.trackCount;
    data['userId'] = this.userId;
    data['playCount'] = this.playCount;
    data['bookCount'] = this.bookCount;
    data['description'] = this.description;
    data['highQuality'] = this.highQuality;
    return data;
  }
}

class Mvs {
  int id;
  String cover;
  String name;
  int playCount;
  String briefDesc;
  String artistName;
  int artistId;
  int duration;
  int mark;
  List<MvArtists> mvArtists;
  bool subed;
  Mv mv;

  Mvs(
      {this.id,
      this.cover,
      this.name,
      this.playCount,
      this.briefDesc,
      this.artistName,
      this.artistId,
      this.duration,
      this.mark,
      this.mvArtists,
      this.subed,
      this.mv});

  Mvs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'];
    name = json['name'];
    playCount = json['playCount'];
    briefDesc = json['briefDesc'];
    artistName = json['artistName'];
    artistId = json['artistId'];
    duration = json['duration'];
    mark = json['mark'];
    if (json['mvArtists'] != null) {
      mvArtists = new List<MvArtists>();
      json['mvArtists'].forEach((v) {
        mvArtists.add(new MvArtists.fromJson(v));
      });
    }
    subed = json['subed'];
    mv = json['mv'] != null ? new Mv.fromJson(json['mv']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cover'] = this.cover;
    data['name'] = this.name;
    data['playCount'] = this.playCount;
    data['briefDesc'] = this.briefDesc;
    data['artistName'] = this.artistName;
    data['artistId'] = this.artistId;
    data['duration'] = this.duration;
    data['mark'] = this.mark;
    if (this.mvArtists != null) {
      data['mvArtists'] = this.mvArtists.map((v) => v.toJson()).toList();
    }
    data['subed'] = this.subed;
    if (this.mv != null) {
      data['mv'] = this.mv.toJson();
    }
    return data;
  }
}

class MvArtists {
  int id;
  String name;
  List<String> alias;

  MvArtists({this.id, this.name, this.alias});

  MvArtists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alias'] = this.alias;
    return data;
  }
}

class Mv {
  int authId;
  int status;
  int id;
  String title;
  String subTitle;
  String appTitle;
  String aliaName;
  String transName;
  int pic4v3;
  int pic16v9;
  int caption;
  String captionLanguage;
  String style;
  String mottos;
  String oneword;
  String appword;
  String stars;
  String desc;
  String area;
  String type;
  String subType;
  int neteaseonly;
  int upban;
  String topWeeks;
  String publishTime;
  int online;
  int score;
  int plays;
  int monthplays;
  int weekplays;
  int dayplays;
  int fee;
  List<InMvArtists> inMvArtists;
  List<Videos> videos;

  Mv(
      {this.authId,
      this.status,
      this.id,
      this.title,
      this.subTitle,
      this.appTitle,
      this.aliaName,
      this.transName,
      this.pic4v3,
      this.pic16v9,
      this.caption,
      this.captionLanguage,
      this.style,
      this.mottos,
      this.oneword,
      this.appword,
      this.stars,
      this.desc,
      this.area,
      this.type,
      this.subType,
      this.neteaseonly,
      this.upban,
      this.topWeeks,
      this.publishTime,
      this.online,
      this.score,
      this.plays,
      this.monthplays,
      this.weekplays,
      this.dayplays,
      this.fee,
      this.inMvArtists,
      this.videos});

  Mv.fromJson(Map<String, dynamic> json) {
    authId = json['authId'];
    status = json['status'];
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    appTitle = json['appTitle'];
    aliaName = json['aliaName'];
    transName = json['transName'];
    pic4v3 = json['pic4v3'];
    pic16v9 = json['pic16v9'];
    caption = json['caption'];
    captionLanguage = json['captionLanguage'];
    style = json['style'];
    mottos = json['mottos'];
    oneword = json['oneword'];
    appword = json['appword'];
    stars = json['stars'];
    desc = json['desc'];
    area = json['area'];
    type = json['type'];
    subType = json['subType'];
    neteaseonly = json['neteaseonly'];
    upban = json['upban'];
    topWeeks = json['topWeeks'];
    publishTime = json['publishTime'];
    online = json['online'];
    score = json['score'];
    plays = json['plays'];
    monthplays = json['monthplays'];
    weekplays = json['weekplays'];
    dayplays = json['dayplays'];
    fee = json['fee'];
    if (json['inMvArtists'] != null) {
      inMvArtists = new List<InMvArtists>();
      json['inMvArtists'].forEach((v) {
        inMvArtists.add(new InMvArtists.fromJson(v));
      });
    }
    if (json['videos'] != null) {
      videos = new List<Videos>();
      json['videos'].forEach((v) {
        videos.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authId'] = this.authId;
    data['status'] = this.status;
    data['id'] = this.id;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['appTitle'] = this.appTitle;
    data['aliaName'] = this.aliaName;
    data['transName'] = this.transName;
    data['pic4v3'] = this.pic4v3;
    data['pic16v9'] = this.pic16v9;
    data['caption'] = this.caption;
    data['captionLanguage'] = this.captionLanguage;
    data['style'] = this.style;
    data['mottos'] = this.mottos;
    data['oneword'] = this.oneword;
    data['appword'] = this.appword;
    data['stars'] = this.stars;
    data['desc'] = this.desc;
    data['area'] = this.area;
    data['type'] = this.type;
    data['subType'] = this.subType;
    data['neteaseonly'] = this.neteaseonly;
    data['upban'] = this.upban;
    data['topWeeks'] = this.topWeeks;
    data['publishTime'] = this.publishTime;
    data['online'] = this.online;
    data['score'] = this.score;
    data['plays'] = this.plays;
    data['monthplays'] = this.monthplays;
    data['weekplays'] = this.weekplays;
    data['dayplays'] = this.dayplays;
    data['fee'] = this.fee;
    if (this.inMvArtists != null) {
      data['inMvArtists'] = this.inMvArtists.map((v) => v.toJson()).toList();
    }
    if (this.videos != null) {
      data['videos'] = this.videos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InMvArtists {
  int id;
  String name;

  InMvArtists({this.id, this.name});

  InMvArtists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Videos {
  TagSign tagSign;
  String tag;
  String url;
  int duration;
  int size;
  int width;
  int height;
  String container;
  String md5;
  bool check;

  Videos(
      {this.tagSign,
      this.tag,
      this.url,
      this.duration,
      this.size,
      this.width,
      this.height,
      this.container,
      this.md5,
      this.check});

  Videos.fromJson(Map<String, dynamic> json) {
    tagSign =
        json['tagSign'] != null ? new TagSign.fromJson(json['tagSign']) : null;
    tag = json['tag'];
    url = json['url'];
    duration = json['duration'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    container = json['container'];
    md5 = json['md5'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tagSign != null) {
      data['tagSign'] = this.tagSign.toJson();
    }
    data['tag'] = this.tag;
    data['url'] = this.url;
    data['duration'] = this.duration;
    data['size'] = this.size;
    data['width'] = this.width;
    data['height'] = this.height;
    data['container'] = this.container;
    data['md5'] = this.md5;
    data['check'] = this.check;
    return data;
  }
}

class TagSign {
  int br;
  String type;
  String tagSign;
  String mvtype;
  int resolution;

  TagSign({this.br, this.type, this.tagSign, this.mvtype, this.resolution});

  TagSign.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    type = json['type'];
    tagSign = json['tagSign'];
    mvtype = json['mvtype'];
    resolution = json['resolution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['type'] = this.type;
    data['tagSign'] = this.tagSign;
    data['mvtype'] = this.mvtype;
    data['resolution'] = this.resolution;
    return data;
  }
}
