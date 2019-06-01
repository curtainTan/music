class Autogenerated {
  int lasttime;
  bool more;
  int size;
  List<Events> events;
  int code;

  Autogenerated({this.lasttime, this.more, this.size, this.events, this.code});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    lasttime = json['lasttime'];
    more = json['more'];
    size = json['size'];
    if (json['events'] != null) {
      events = new List<Events>();
      json['events'].forEach((v) {
        events.add(new Events.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lasttime'] = this.lasttime;
    data['more'] = this.more;
    data['size'] = this.size;
    if (this.events != null) {
      data['events'] = this.events.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Events {
  String actName;
  int forwardCount;
  int showTime;
  int id;
  int type;
  int eventTime;
  User user;
  String uuid;
  String json;
  int tmplId;
  List<Pics> pics;
  int expireTime;
  int actId;
  bool topEvent;
  int insiteForwardCount;
  Info info;

  Events(
      {this.actName,
      this.forwardCount,
      this.showTime,
      this.id,
      this.type,
      this.eventTime,
      this.user,
      this.uuid,
      this.json,
      this.tmplId,
      this.pics,
      this.expireTime,
      this.actId,
      this.topEvent,
      this.insiteForwardCount,
      this.info});

  Events.fromJson(Map<String, dynamic> json) {
    actName = json['actName'];
    forwardCount = json['forwardCount'];
    showTime = json['showTime'];
    id = json['id'];
    type = json['type'];
    eventTime = json['eventTime'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    uuid = json['uuid'];
    json = json['json'];
    tmplId = json['tmplId'];
    if (json['pics'] != null) {
      pics = new List<Pics>();
      json['pics'].forEach((v) {
        pics.add(new Pics.fromJson(v));
      });
    }
    expireTime = json['expireTime'];
    actId = json['actId'];
    topEvent = json['topEvent'];
    insiteForwardCount = json['insiteForwardCount'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actName'] = this.actName;
    data['forwardCount'] = this.forwardCount;
    data['showTime'] = this.showTime;
    data['id'] = this.id;
    data['type'] = this.type;
    data['eventTime'] = this.eventTime;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['uuid'] = this.uuid;
    data['json'] = this.json;
    data['tmplId'] = this.tmplId;
    if (this.pics != null) {
      data['pics'] = this.pics.map((v) => v.toJson()).toList();
    }
    data['expireTime'] = this.expireTime;
    data['actId'] = this.actId;
    data['topEvent'] = this.topEvent;
    data['insiteForwardCount'] = this.insiteForwardCount;
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    return data;
  }
}

class User {
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
  bool urlAnalyze;
  int followeds;

  User(
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
      this.backgroundImgIdStr,
      this.urlAnalyze,
      this.followeds});

  User.fromJson(Map<String, dynamic> json) {
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
    urlAnalyze = json['urlAnalyze'];
    followeds = json['followeds'];
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
    data['urlAnalyze'] = this.urlAnalyze;
    data['followeds'] = this.followeds;
    return data;
  }
}

class Pics {
  String originUrl;
  String squareUrl;
  String rectangleUrl;
  String pcSquareUrl;
  String pcRectangleUrl;
  String format;
  int width;
  int height;

  Pics(
      {this.originUrl,
      this.squareUrl,
      this.rectangleUrl,
      this.pcSquareUrl,
      this.pcRectangleUrl,
      this.format,
      this.width,
      this.height});

  Pics.fromJson(Map<String, dynamic> json) {
    originUrl = json['originUrl'];
    squareUrl = json['squareUrl'];
    rectangleUrl = json['rectangleUrl'];
    pcSquareUrl = json['pcSquareUrl'];
    pcRectangleUrl = json['pcRectangleUrl'];
    format = json['format'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['originUrl'] = this.originUrl;
    data['squareUrl'] = this.squareUrl;
    data['rectangleUrl'] = this.rectangleUrl;
    data['pcSquareUrl'] = this.pcSquareUrl;
    data['pcRectangleUrl'] = this.pcRectangleUrl;
    data['format'] = this.format;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class Info {
  CommentThread commentThread;
  bool liked;
  int resourceType;
  int resourceId;
  int shareCount;
  String threadId;
  int commentCount;
  int likedCount;

  Info(
      {this.commentThread,
      this.liked,
      this.resourceType,
      this.resourceId,
      this.shareCount,
      this.threadId,
      this.commentCount,
      this.likedCount});

  Info.fromJson(Map<String, dynamic> json) {
    commentThread = json['commentThread'] != null
        ? new CommentThread.fromJson(json['commentThread'])
        : null;
    liked = json['liked'];
    resourceType = json['resourceType'];
    resourceId = json['resourceId'];
    shareCount = json['shareCount'];
    threadId = json['threadId'];
    commentCount = json['commentCount'];
    likedCount = json['likedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.commentThread != null) {
      data['commentThread'] = this.commentThread.toJson();
    }
    data['liked'] = this.liked;
    data['resourceType'] = this.resourceType;
    data['resourceId'] = this.resourceId;
    data['shareCount'] = this.shareCount;
    data['threadId'] = this.threadId;
    data['commentCount'] = this.commentCount;
    data['likedCount'] = this.likedCount;
    return data;
  }
}

class CommentThread {
  String id;
  ResourceInfo resourceInfo;
  int resourceType;
  int commentCount;
  int likedCount;
  int shareCount;
  int hotCount;
  List<LatestLikedUsers> latestLikedUsers;
  int resourceId;
  int resourceOwnerId;
  String resourceTitle;

  CommentThread(
      {this.id,
      this.resourceInfo,
      this.resourceType,
      this.commentCount,
      this.likedCount,
      this.shareCount,
      this.hotCount,
      this.latestLikedUsers,
      this.resourceId,
      this.resourceOwnerId,
      this.resourceTitle});

  CommentThread.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resourceInfo = json['resourceInfo'] != null
        ? new ResourceInfo.fromJson(json['resourceInfo'])
        : null;
    resourceType = json['resourceType'];
    commentCount = json['commentCount'];
    likedCount = json['likedCount'];
    shareCount = json['shareCount'];
    hotCount = json['hotCount'];
    if (json['latestLikedUsers'] != null) {
      latestLikedUsers = new List<LatestLikedUsers>();
      json['latestLikedUsers'].forEach((v) {
        latestLikedUsers.add(new LatestLikedUsers.fromJson(v));
      });
    }
    resourceId = json['resourceId'];
    resourceOwnerId = json['resourceOwnerId'];
    resourceTitle = json['resourceTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.resourceInfo != null) {
      data['resourceInfo'] = this.resourceInfo.toJson();
    }
    data['resourceType'] = this.resourceType;
    data['commentCount'] = this.commentCount;
    data['likedCount'] = this.likedCount;
    data['shareCount'] = this.shareCount;
    data['hotCount'] = this.hotCount;
    if (this.latestLikedUsers != null) {
      data['latestLikedUsers'] =
          this.latestLikedUsers.map((v) => v.toJson()).toList();
    }
    data['resourceId'] = this.resourceId;
    data['resourceOwnerId'] = this.resourceOwnerId;
    data['resourceTitle'] = this.resourceTitle;
    return data;
  }
}

class ResourceInfo {
  int id;
  int userId;
  String name;
  String imgUrl;
  String creator;
  int eventType;

  ResourceInfo(
      {this.id,
      this.userId,
      this.name,
      this.imgUrl,
      this.creator,
      this.eventType});

  ResourceInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    imgUrl = json['imgUrl'];
    creator = json['creator'];
    eventType = json['eventType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['imgUrl'] = this.imgUrl;
    data['creator'] = this.creator;
    data['eventType'] = this.eventType;
    return data;
  }
}

class LatestLikedUsers {
  int s;
  int t;

  LatestLikedUsers({this.s, this.t});

  LatestLikedUsers.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    t = json['t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['t'] = this.t;
    return data;
  }
}
