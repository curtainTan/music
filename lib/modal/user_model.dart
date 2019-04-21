class UserModel {
  int loginType;
  int code;
  Account account;
  Profile profile;
  List<Bindings> bindings;

  UserModel(
      {this.loginType, this.code, this.account, this.profile, this.bindings});

  UserModel.fromJson(Map<String, dynamic> json) {
    loginType = json['loginType'];
    code = json['code'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['bindings'] != null) {
      bindings = new List<Bindings>();
      json['bindings'].forEach((v) {
        bindings.add(new Bindings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginType'] = this.loginType;
    data['code'] = this.code;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.bindings != null) {
      data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Account {
  int id;
  String userName;
  int type;
  int status;
  int whitelistAuthority;
  int createTime;
  String salt;
  int tokenVersion;
  int ban;
  int baoyueVersion;
  int donateVersion;
  int vipType;
  int viptypeVersion;
  bool anonimousUser;

  Account(
      {this.id,
      this.userName,
      this.type,
      this.status,
      this.whitelistAuthority,
      this.createTime,
      this.salt,
      this.tokenVersion,
      this.ban,
      this.baoyueVersion,
      this.donateVersion,
      this.vipType,
      this.viptypeVersion,
      this.anonimousUser});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    type = json['type'];
    status = json['status'];
    whitelistAuthority = json['whitelistAuthority'];
    createTime = json['createTime'];
    salt = json['salt'];
    tokenVersion = json['tokenVersion'];
    ban = json['ban'];
    baoyueVersion = json['baoyueVersion'];
    donateVersion = json['donateVersion'];
    vipType = json['vipType'];
    viptypeVersion = json['viptypeVersion'];
    anonimousUser = json['anonimousUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['type'] = this.type;
    data['status'] = this.status;
    data['whitelistAuthority'] = this.whitelistAuthority;
    data['createTime'] = this.createTime;
    data['salt'] = this.salt;
    data['tokenVersion'] = this.tokenVersion;
    data['ban'] = this.ban;
    data['baoyueVersion'] = this.baoyueVersion;
    data['donateVersion'] = this.donateVersion;
    data['vipType'] = this.vipType;
    data['viptypeVersion'] = this.viptypeVersion;
    data['anonimousUser'] = this.anonimousUser;
    return data;
  }
}

class Profile {
  String detailDescription;
  bool followed;
  int province;
  bool defaultAvatar;
  String avatarUrl;
  int djStatus;
  int backgroundImgId;
  int userType;
  bool mutual;
  Null remarkName;
  Null expertTags;
  int authStatus;
  String backgroundUrl;
  int userId;
  int vipType;
  int accountStatus;
  int gender;
  int birthday;
  String nickname;
  int avatarImgId;
  int city;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String description;
  String signature;
  int authority;
  int followeds;
  int follows;
  int eventCount;
  int playlistCount;
  int playlistBeSubscribedCount;

  Profile(
      {this.detailDescription,
      this.followed,
      this.province,
      this.defaultAvatar,
      this.avatarUrl,
      this.djStatus,
      this.backgroundImgId,
      this.userType,
      this.mutual,
      this.remarkName,
      this.expertTags,
      this.authStatus,
      this.backgroundUrl,
      this.userId,
      this.vipType,
      this.accountStatus,
      this.gender,
      this.birthday,
      this.nickname,
      this.avatarImgId,
      this.city,
      this.avatarImgIdStr,
      this.backgroundImgIdStr,
      this.description,
      this.signature,
      this.authority,
      this.followeds,
      this.follows,
      this.eventCount,
      this.playlistCount,
      this.playlistBeSubscribedCount});

  Profile.fromJson(Map<String, dynamic> json) {
    detailDescription = json['detailDescription'];
    followed = json['followed'];
    province = json['province'];
    defaultAvatar = json['defaultAvatar'];
    avatarUrl = json['avatarUrl'];
    djStatus = json['djStatus'];
    backgroundImgId = json['backgroundImgId'];
    userType = json['userType'];
    mutual = json['mutual'];
    remarkName = json['remarkName'];
    expertTags = json['expertTags'];
    authStatus = json['authStatus'];
    backgroundUrl = json['backgroundUrl'];
    userId = json['userId'];
    vipType = json['vipType'];
    accountStatus = json['accountStatus'];
    gender = json['gender'];
    birthday = json['birthday'];
    nickname = json['nickname'];
    avatarImgId = json['avatarImgId'];
    city = json['city'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    description = json['description'];
    signature = json['signature'];
    authority = json['authority'];
    followeds = json['followeds'];
    follows = json['follows'];
    eventCount = json['eventCount'];
    playlistCount = json['playlistCount'];
    playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detailDescription'] = this.detailDescription;
    data['followed'] = this.followed;
    data['province'] = this.province;
    data['defaultAvatar'] = this.defaultAvatar;
    data['avatarUrl'] = this.avatarUrl;
    data['djStatus'] = this.djStatus;
    data['backgroundImgId'] = this.backgroundImgId;
    data['userType'] = this.userType;
    data['mutual'] = this.mutual;
    data['remarkName'] = this.remarkName;
    data['expertTags'] = this.expertTags;
    data['authStatus'] = this.authStatus;
    data['backgroundUrl'] = this.backgroundUrl;
    data['userId'] = this.userId;
    data['vipType'] = this.vipType;
    data['accountStatus'] = this.accountStatus;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['nickname'] = this.nickname;
    data['avatarImgId'] = this.avatarImgId;
    data['city'] = this.city;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['description'] = this.description;
    data['signature'] = this.signature;
    data['authority'] = this.authority;
    data['followeds'] = this.followeds;
    data['follows'] = this.follows;
    data['eventCount'] = this.eventCount;
    data['playlistCount'] = this.playlistCount;
    data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
    return data;
  }
}

class Bindings {
  int refreshTime;
  String url;
  String tokenJsonStr;
  int bindingTime;
  int expiresIn;
  int userId;
  bool expired;
  int id;
  int type;

  Bindings(
      {this.refreshTime,
      this.url,
      this.tokenJsonStr,
      this.bindingTime,
      this.expiresIn,
      this.userId,
      this.expired,
      this.id,
      this.type});

  Bindings.fromJson(Map<String, dynamic> json) {
    refreshTime = json['refreshTime'];
    url = json['url'];
    tokenJsonStr = json['tokenJsonStr'];
    bindingTime = json['bindingTime'];
    expiresIn = json['expiresIn'];
    userId = json['userId'];
    expired = json['expired'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshTime'] = this.refreshTime;
    data['url'] = this.url;
    data['tokenJsonStr'] = this.tokenJsonStr;
    data['bindingTime'] = this.bindingTime;
    data['expiresIn'] = this.expiresIn;
    data['userId'] = this.userId;
    data['expired'] = this.expired;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}
