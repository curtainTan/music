class UserDetailModal {
  int level;
  int listenSongs;
  UserPoint userPoint;
  bool mobileSign;
  bool pcSign;
  Profile profile;
  bool peopleCanSeeMyPlayRecord;
  List<Bindings> bindings;
  bool adValid;
  int code;
  int createTime;
  int createDays;

  UserDetailModal(
      {this.level,
      this.listenSongs,
      this.userPoint,
      this.mobileSign,
      this.pcSign,
      this.profile,
      this.peopleCanSeeMyPlayRecord,
      this.bindings,
      this.adValid,
      this.code,
      this.createTime,
      this.createDays});

  UserDetailModal.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    listenSongs = json['listenSongs'];
    userPoint = json['userPoint'] != null
        ? new UserPoint.fromJson(json['userPoint'])
        : null;
    mobileSign = json['mobileSign'];
    pcSign = json['pcSign'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    peopleCanSeeMyPlayRecord = json['peopleCanSeeMyPlayRecord'];
    if (json['bindings'] != null) {
      bindings = new List<Bindings>();
      json['bindings'].forEach((v) {
        bindings.add(new Bindings.fromJson(v));
      });
    }
    adValid = json['adValid'];
    code = json['code'];
    createTime = json['createTime'];
    createDays = json['createDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['listenSongs'] = this.listenSongs;
    if (this.userPoint != null) {
      data['userPoint'] = this.userPoint.toJson();
    }
    data['mobileSign'] = this.mobileSign;
    data['pcSign'] = this.pcSign;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    data['peopleCanSeeMyPlayRecord'] = this.peopleCanSeeMyPlayRecord;
    if (this.bindings != null) {
      data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
    }
    data['adValid'] = this.adValid;
    data['code'] = this.code;
    data['createTime'] = this.createTime;
    data['createDays'] = this.createDays;
    return data;
  }
}

class UserPoint {
  int userId;
  int balance;
  int updateTime;
  int version;
  int status;
  int blockBalance;

  UserPoint(
      {this.userId,
      this.balance,
      this.updateTime,
      this.version,
      this.status,
      this.blockBalance});

  UserPoint.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    balance = json['balance'];
    updateTime = json['updateTime'];
    version = json['version'];
    status = json['status'];
    blockBalance = json['blockBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['balance'] = this.balance;
    data['updateTime'] = this.updateTime;
    data['version'] = this.version;
    data['status'] = this.status;
    data['blockBalance'] = this.blockBalance;
    return data;
  }
}

class Profile {
  String backgroundUrl;
  int birthday;
  int accountStatus;
  int vipType;
  int gender;
  int avatarImgId;
  String nickname;
  int city;
  bool defaultAvatar;
  String avatarUrl;
  int province;
  int userId;
  String description;
  int djStatus;
  int backgroundImgId;
  int userType;
  bool mutual;
  int authStatus;
  String detailDescription;
  bool followed;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String signature;
  int authority;
  int followeds;
  int follows;
  int cCount;
  bool blacklist;
  int eventCount;
  int sDJPCount;
  int allSubscribedCount;
  int playlistCount;
  int playlistBeSubscribedCount;
  int sCount;

  Profile(
      {this.backgroundUrl,
      this.birthday,
      this.accountStatus,
      this.vipType,
      this.gender,
      this.avatarImgId,
      this.nickname,
      this.city,
      this.defaultAvatar,
      this.avatarUrl,
      this.province,
      this.userId,
      this.description,
      this.djStatus,
      this.backgroundImgId,
      this.userType,
      this.mutual,
      this.authStatus,
      this.detailDescription,
      this.followed,
      this.avatarImgIdStr,
      this.backgroundImgIdStr,
      this.signature,
      this.authority,
      this.followeds,
      this.follows,
      this.cCount,
      this.blacklist,
      this.eventCount,
      this.sDJPCount,
      this.allSubscribedCount,
      this.playlistCount,
      this.playlistBeSubscribedCount,
      this.sCount});

  Profile.fromJson(Map<String, dynamic> json) {
    backgroundUrl = json['backgroundUrl'];
    birthday = json['birthday'];
    accountStatus = json['accountStatus'];
    vipType = json['vipType'];
    gender = json['gender'];
    avatarImgId = json['avatarImgId'];
    nickname = json['nickname'];
    city = json['city'];
    defaultAvatar = json['defaultAvatar'];
    avatarUrl = json['avatarUrl'];
    province = json['province'];
    userId = json['userId'];
    description = json['description'];
    djStatus = json['djStatus'];
    backgroundImgId = json['backgroundImgId'];
    userType = json['userType'];
    mutual = json['mutual'];
    authStatus = json['authStatus'];
    detailDescription = json['detailDescription'];
    followed = json['followed'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    signature = json['signature'];
    authority = json['authority'];
    followeds = json['followeds'];
    follows = json['follows'];
    cCount = json['cCount'];
    blacklist = json['blacklist'];
    eventCount = json['eventCount'];
    sDJPCount = json['sDJPCount'];
    allSubscribedCount = json['allSubscribedCount'];
    playlistCount = json['playlistCount'];
    playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
    sCount = json['sCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backgroundUrl'] = this.backgroundUrl;
    data['birthday'] = this.birthday;
    data['accountStatus'] = this.accountStatus;
    data['vipType'] = this.vipType;
    data['gender'] = this.gender;
    data['avatarImgId'] = this.avatarImgId;
    data['nickname'] = this.nickname;
    data['city'] = this.city;
    data['defaultAvatar'] = this.defaultAvatar;
    data['avatarUrl'] = this.avatarUrl;
    data['province'] = this.province;
    data['userId'] = this.userId;
    data['description'] = this.description;
    data['djStatus'] = this.djStatus;
    data['backgroundImgId'] = this.backgroundImgId;
    data['userType'] = this.userType;
    data['mutual'] = this.mutual;
    data['authStatus'] = this.authStatus;
    data['detailDescription'] = this.detailDescription;
    data['followed'] = this.followed;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['signature'] = this.signature;
    data['authority'] = this.authority;
    data['followeds'] = this.followeds;
    data['follows'] = this.follows;
    data['cCount'] = this.cCount;
    data['blacklist'] = this.blacklist;
    data['eventCount'] = this.eventCount;
    data['sDJPCount'] = this.sDJPCount;
    data['allSubscribedCount'] = this.allSubscribedCount;
    data['playlistCount'] = this.playlistCount;
    data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
    data['sCount'] = this.sCount;
    return data;
  }
}

class Bindings {
  int expiresIn;
  String url;
  int bindingTime;
  bool expired;
  Null tokenJsonStr;
  int userId;
  int refreshTime;
  int id;
  int type;

  Bindings(
      {this.expiresIn,
      this.url,
      this.bindingTime,
      this.expired,
      this.tokenJsonStr,
      this.userId,
      this.refreshTime,
      this.id,
      this.type});

  Bindings.fromJson(Map<String, dynamic> json) {
    expiresIn = json['expiresIn'];
    url = json['url'];
    bindingTime = json['bindingTime'];
    expired = json['expired'];
    tokenJsonStr = json['tokenJsonStr'];
    userId = json['userId'];
    refreshTime = json['refreshTime'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expiresIn'] = this.expiresIn;
    data['url'] = this.url;
    data['bindingTime'] = this.bindingTime;
    data['expired'] = this.expired;
    data['tokenJsonStr'] = this.tokenJsonStr;
    data['userId'] = this.userId;
    data['refreshTime'] = this.refreshTime;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}
