

class UserPlayList {
  Playlist playlist;
  int code;
  List<Privileges> privileges;

  UserPlayList({this.playlist, this.code, this.privileges});

  UserPlayList.fromJson(Map<String, dynamic> json) {
    playlist = json['playlist'] != null
        ? new Playlist.fromJson(json['playlist'])
        : null;
    code = json['code'];
    if (json['privileges'] != null) {
      privileges = new List<Privileges>();
      json['privileges'].forEach((v) {
        privileges.add(new Privileges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.playlist != null) {
      data['playlist'] = this.playlist.toJson();
    }
    data['code'] = this.code;
    if (this.privileges != null) {
      data['privileges'] = this.privileges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Playlist {
  bool subscribed;
  Creator creator;
  List<Tracks> tracks;
  List<TrackIds> trackIds;
  bool ordered;
  int status;
  int cloudTrackCount;
  int subscribedCount;
  int adType;
  int trackNumberUpdateTime;
  int coverImgId;
  int updateTime;
  int privacy;
  bool newImported;
  int specialType;
  String commentThreadId;
  bool highQuality;
  int createTime;
  int trackUpdateTime;
  int trackCount;
  int playCount;
  String coverImgUrl;
  String description;
  List<String> tags;
  int userId;
  String name;
  int id;
  int shareCount;
  int commentCount;

  Playlist(
      {this.subscribed,
      this.creator,
      this.tracks,
      this.trackIds,
      this.ordered,
      this.status,
      this.cloudTrackCount,
      this.subscribedCount,
      this.adType,
      this.trackNumberUpdateTime,
      this.coverImgId,
      this.updateTime,
      this.privacy,
      this.newImported,
      this.specialType,
      this.commentThreadId,
      this.highQuality,
      this.createTime,
      this.trackUpdateTime,
      this.trackCount,
      this.playCount,
      this.coverImgUrl,
      this.description,
      this.tags,
      this.userId,
      this.name,
      this.id,
      this.shareCount,
      this.commentCount});

  Playlist.fromJson(Map<String, dynamic> json) {
    subscribed = json['subscribed'];
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    if (json['tracks'] != null) {
      tracks = new List<Tracks>();
      json['tracks'].forEach((v) {
        tracks.add(new Tracks.fromJson(v));
      });
    }
    if (json['trackIds'] != null) {
      trackIds = new List<TrackIds>();
      json['trackIds'].forEach((v) {
        trackIds.add(new TrackIds.fromJson(v));
      });
    }
    ordered = json['ordered'];
    status = json['status'];
    cloudTrackCount = json['cloudTrackCount'];
    subscribedCount = json['subscribedCount'];
    adType = json['adType'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    coverImgId = json['coverImgId'];
    updateTime = json['updateTime'];
    privacy = json['privacy'];
    newImported = json['newImported'];
    specialType = json['specialType'];
    commentThreadId = json['commentThreadId'];
    highQuality = json['highQuality'];
    createTime = json['createTime'];
    trackUpdateTime = json['trackUpdateTime'];
    trackCount = json['trackCount'];
    playCount = json['playCount'];
    coverImgUrl = json['coverImgUrl'];
    description = json['description'];
    tags = json['tags'].cast<String>();
    userId = json['userId'];
    name = json['name'];
    id = json['id'];
    shareCount = json['shareCount'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscribed'] = this.subscribed;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    if (this.tracks != null) {
      data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
    }
    if (this.trackIds != null) {
      data['trackIds'] = this.trackIds.map((v) => v.toJson()).toList();
    }
    data['ordered'] = this.ordered;
    data['status'] = this.status;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['subscribedCount'] = this.subscribedCount;
    data['adType'] = this.adType;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['coverImgId'] = this.coverImgId;
    data['updateTime'] = this.updateTime;
    data['privacy'] = this.privacy;
    data['newImported'] = this.newImported;
    data['specialType'] = this.specialType;
    data['commentThreadId'] = this.commentThreadId;
    data['highQuality'] = this.highQuality;
    data['createTime'] = this.createTime;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['trackCount'] = this.trackCount;
    data['playCount'] = this.playCount;
    data['coverImgUrl'] = this.coverImgUrl;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['id'] = this.id;
    data['shareCount'] = this.shareCount;
    data['commentCount'] = this.commentCount;
    return data;
  }
}

class Creator {
  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  String detailDescription;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  int djStatus;
  int vipType;
  String avatarImgIdStr;
  String backgroundImgIdStr;

  Creator(
      {this.defaultAvatar,
      this.province,
      this.authStatus,
      this.followed,
      this.avatarUrl,
      this.accountStatus,
      this.gender,
      this.city,
      this.birthday,
      this.userId,
      this.userType,
      this.nickname,
      this.signature,
      this.description,
      this.detailDescription,
      this.avatarImgId,
      this.backgroundImgId,
      this.backgroundUrl,
      this.authority,
      this.mutual,
      this.djStatus,
      this.vipType,
      this.avatarImgIdStr,
      this.backgroundImgIdStr});

  Creator.fromJson(Map<String, dynamic> json) {
    defaultAvatar = json['defaultAvatar'];
    province = json['province'];
    authStatus = json['authStatus'];
    followed = json['followed'];
    avatarUrl = json['avatarUrl'];
    accountStatus = json['accountStatus'];
    gender = json['gender'];
    city = json['city'];
    birthday = json['birthday'];
    userId = json['userId'];
    userType = json['userType'];
    nickname = json['nickname'];
    signature = json['signature'];
    description = json['description'];
    detailDescription = json['detailDescription'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    backgroundUrl = json['backgroundUrl'];
    authority = json['authority'];
    mutual = json['mutual'];
    djStatus = json['djStatus'];
    vipType = json['vipType'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defaultAvatar'] = this.defaultAvatar;
    data['province'] = this.province;
    data['authStatus'] = this.authStatus;
    data['followed'] = this.followed;
    data['avatarUrl'] = this.avatarUrl;
    data['accountStatus'] = this.accountStatus;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['birthday'] = this.birthday;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['nickname'] = this.nickname;
    data['signature'] = this.signature;
    data['description'] = this.description;
    data['detailDescription'] = this.detailDescription;
    data['avatarImgId'] = this.avatarImgId;
    data['backgroundImgId'] = this.backgroundImgId;
    data['backgroundUrl'] = this.backgroundUrl;
    data['authority'] = this.authority;
    data['mutual'] = this.mutual;
    data['djStatus'] = this.djStatus;
    data['vipType'] = this.vipType;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    return data;
  }
}

class Tracks {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  int pop;
  int st;
  int fee;
  int v;
  String cf;
  Al al;
  int dt;
  String cd;
  int no;
  int ftype;
  int djId;
  int copyright;
  int sId;
  int rtype;
  int mst;
  int cp;
  int mv;
  int publishTime;

  Tracks(
      {this.name,
      this.id,
      this.pst,
      this.t,
      this.ar,
      this.pop,
      this.st,
      this.fee,
      this.v,
      this.cf,
      this.al,
      this.dt,
      this.cd,
      this.no,
      this.ftype,
      this.djId,
      this.copyright,
      this.sId,
      this.rtype,
      this.mst,
      this.cp,
      this.mv,
      this.publishTime});

  Tracks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    pst = json['pst'];
    t = json['t'];
    if (json['ar'] != null) {
      ar = new List<Ar>();
      json['ar'].forEach((v) {
        ar.add(new Ar.fromJson(v));
      });
    }
    pop = json['pop'];
    st = json['st'];
    fee = json['fee'];
    v = json['v'];
    cf = json['cf'];
    al = json['al'] != null ? new Al.fromJson(json['al']) : null;
    dt = json['dt'];
    cd = json['cd'];
    no = json['no'];
    ftype = json['ftype'];
    djId = json['djId'];
    copyright = json['copyright'];
    sId = json['s_id'];
    rtype = json['rtype'];
    mst = json['mst'];
    cp = json['cp'];
    mv = json['mv'];
    publishTime = json['publishTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['pst'] = this.pst;
    data['t'] = this.t;
    if (this.ar != null) {
      data['ar'] = this.ar.map((v) => v.toJson()).toList();
    }
    data['pop'] = this.pop;
    data['st'] = this.st;
    data['fee'] = this.fee;
    data['v'] = this.v;
    data['cf'] = this.cf;
    if (this.al != null) {
      data['al'] = this.al.toJson();
    }
    data['dt'] = this.dt;
    data['cd'] = this.cd;
    data['no'] = this.no;
    data['ftype'] = this.ftype;
    data['djId'] = this.djId;
    data['copyright'] = this.copyright;
    data['s_id'] = this.sId;
    data['rtype'] = this.rtype;
    data['mst'] = this.mst;
    data['cp'] = this.cp;
    data['mv'] = this.mv;
    data['publishTime'] = this.publishTime;
    return data;
  }
}

class Ar {
  int id;
  String name;

  Ar({this.id, this.name});

  Ar.fromJson(Map<String, dynamic> json) {
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

class Al {
  int id;
  String name;
  String picUrl;
  int pic;

  Al({this.id, this.name, this.picUrl, this.pic});

  Al.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
    data['pic'] = this.pic;
    return data;
  }
}

class TrackIds {
  int id;
  int v;

  TrackIds({this.id, this.v});

  TrackIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['v'] = this.v;
    return data;
  }
}

class Privileges {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;

  Privileges(
      {this.id,
      this.fee,
      this.payed,
      this.st,
      this.pl,
      this.dl,
      this.sp,
      this.cp,
      this.subp,
      this.cs,
      this.maxbr,
      this.fl,
      this.toast,
      this.flag,
      this.preSell});

  Privileges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fee = json['fee'];
    payed = json['payed'];
    st = json['st'];
    pl = json['pl'];
    dl = json['dl'];
    sp = json['sp'];
    cp = json['cp'];
    subp = json['subp'];
    cs = json['cs'];
    maxbr = json['maxbr'];
    fl = json['fl'];
    toast = json['toast'];
    flag = json['flag'];
    preSell = json['preSell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fee'] = this.fee;
    data['payed'] = this.payed;
    data['st'] = this.st;
    data['pl'] = this.pl;
    data['dl'] = this.dl;
    data['sp'] = this.sp;
    data['cp'] = this.cp;
    data['subp'] = this.subp;
    data['cs'] = this.cs;
    data['maxbr'] = this.maxbr;
    data['fl'] = this.fl;
    data['toast'] = this.toast;
    data['flag'] = this.flag;
    data['preSell'] = this.preSell;
    return data;
  }
}
