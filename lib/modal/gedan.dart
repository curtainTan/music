class GedanModel {
  bool more;
  List<PlaylistAbout> playlist;
  int code;

  GedanModel({this.more, this.playlist, this.code});

  GedanModel.fromJson(Map<String, dynamic> json) {
    more = json['more'];
    if (json['playlist'] != null) {
      playlist = new List<PlaylistAbout>();
      json['playlist'].forEach((v) {
        playlist.add(new PlaylistAbout.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['more'] = this.more;
    if (this.playlist != null) {
      data['playlist'] = this.playlist.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class PlaylistAbout {
  bool subscribed;
  GedanCreator creator;
  bool highQuality;
  int createTime;
  int userId;
  int subscribedCount;
  int updateTime;
  int specialType;
  bool anonimous;
  int privacy;
  bool newImported;
  int trackUpdateTime;
  int trackCount;
  int totalDuration;
  String commentThreadId;
  int playCount;
  String coverImgUrl;
  int coverImgId;
  int cloudTrackCount;
  String description;
  List<String> tags;
  bool ordered;
  int status;
  int trackNumberUpdateTime;
  int adType;
  String name;
  int id;

  PlaylistAbout(
      {this.subscribed,
      this.creator,
      this.highQuality,
      this.createTime,
      this.userId,
      this.subscribedCount,
      this.updateTime,
      this.specialType,
      this.anonimous,
      this.privacy,
      this.newImported,
      this.trackUpdateTime,
      this.trackCount,
      this.totalDuration,
      this.commentThreadId,
      this.playCount,
      this.coverImgUrl,
      this.coverImgId,
      this.cloudTrackCount,
      this.description,
      this.tags,
      this.ordered,
      this.status,
      this.trackNumberUpdateTime,
      this.adType,
      this.name,
      this.id});

  PlaylistAbout.fromJson(Map<String, dynamic> json) {
    subscribed = json['subscribed'];
    creator =
        json['creator'] != null ? new GedanCreator.fromJson(json['creator']) : null;
    highQuality = json['highQuality'];
    createTime = json['createTime'];
    userId = json['userId'];
    subscribedCount = json['subscribedCount'];
    updateTime = json['updateTime'];
    specialType = json['specialType'];
    anonimous = json['anonimous'];
    privacy = json['privacy'];
    newImported = json['newImported'];
    trackUpdateTime = json['trackUpdateTime'];
    trackCount = json['trackCount'];
    totalDuration = json['totalDuration'];
    commentThreadId = json['commentThreadId'];
    playCount = json['playCount'];
    coverImgUrl = json['coverImgUrl'];
    coverImgId = json['coverImgId'];
    cloudTrackCount = json['cloudTrackCount'];
    description = json['description'];
    tags = json['tags'].cast<String>();
    ordered = json['ordered'];
    status = json['status'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    adType = json['adType'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscribed'] = this.subscribed;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    data['highQuality'] = this.highQuality;
    data['createTime'] = this.createTime;
    data['userId'] = this.userId;
    data['subscribedCount'] = this.subscribedCount;
    data['updateTime'] = this.updateTime;
    data['specialType'] = this.specialType;
    data['anonimous'] = this.anonimous;
    data['privacy'] = this.privacy;
    data['newImported'] = this.newImported;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['trackCount'] = this.trackCount;
    data['totalDuration'] = this.totalDuration;
    data['commentThreadId'] = this.commentThreadId;
    data['playCount'] = this.playCount;
    data['coverImgUrl'] = this.coverImgUrl;
    data['coverImgId'] = this.coverImgId;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['ordered'] = this.ordered;
    data['status'] = this.status;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['adType'] = this.adType;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class GedanCreator {
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

  GedanCreator(
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

  GedanCreator.fromJson(Map<String, dynamic> json) {
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
