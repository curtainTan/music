class FollowedModel {
  int code;
  bool more;
  List<Followeds> followeds;

  FollowedModel({this.code, this.more, this.followeds});

  FollowedModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    more = json['more'];
    if (json['followeds'] != null) {
      followeds = new List<Followeds>();
      json['followeds'].forEach((v) {
        followeds.add(new Followeds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['more'] = this.more;
    if (this.followeds != null) {
      data['followeds'] = this.followeds.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Followeds {
  String py;
  int time;
  int accountStatus;
  String avatarUrl;
  int authStatus;
  int userType;
  int gender;
  int vipType;
  String nickname;
  int userId;
  bool followed;
  bool mutual;
  int follows;
  int followeds;
  String signature;
  int eventCount;
  int playlistCount;

  Followeds(
      {this.py,
      this.time,
      this.accountStatus,
      this.avatarUrl,
      this.authStatus,
      this.userType,
      this.gender,
      this.vipType,
      this.nickname,
      this.userId,
      this.followed,
      this.mutual,
      this.follows,
      this.followeds,
      this.signature,
      this.eventCount,
      this.playlistCount});

  Followeds.fromJson(Map<String, dynamic> json) {
    py = json['py'];
    time = json['time'];
    accountStatus = json['accountStatus'];
    avatarUrl = json['avatarUrl'];
    authStatus = json['authStatus'];
    userType = json['userType'];
    gender = json['gender'];
    vipType = json['vipType'];
    nickname = json['nickname'];
    userId = json['userId'];
    followed = json['followed'];
    mutual = json['mutual'];
    follows = json['follows'];
    followeds = json['followeds'];
    signature = json['signature'];
    eventCount = json['eventCount'];
    playlistCount = json['playlistCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['py'] = this.py;
    data['time'] = this.time;
    data['accountStatus'] = this.accountStatus;
    data['avatarUrl'] = this.avatarUrl;
    data['authStatus'] = this.authStatus;
    data['userType'] = this.userType;
    data['gender'] = this.gender;
    data['vipType'] = this.vipType;
    data['nickname'] = this.nickname;
    data['userId'] = this.userId;
    data['followed'] = this.followed;
    data['mutual'] = this.mutual;
    data['follows'] = this.follows;
    data['followeds'] = this.followeds;
    data['signature'] = this.signature;
    data['eventCount'] = this.eventCount;
    data['playlistCount'] = this.playlistCount;
    return data;
  }
}
