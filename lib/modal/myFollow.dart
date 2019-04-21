class MyFollower {
  List<Follow> follow;
  int touchCount;
  bool more;
  int code;

  MyFollower({this.follow, this.touchCount, this.more, this.code});

  MyFollower.fromJson(Map<String, dynamic> json) {
    if (json['follow'] != null) {
      follow = new List<Follow>();
      json['follow'].forEach((v) {
        follow.add(new Follow.fromJson(v));
      });
    }
    touchCount = json['touchCount'];
    more = json['more'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.follow != null) {
      data['follow'] = this.follow.map((v) => v.toJson()).toList();
    }
    data['touchCount'] = this.touchCount;
    data['more'] = this.more;
    data['code'] = this.code;
    return data;
  }
}

class Follow {
  String py;
  int time;
  String avatarUrl;
  int authStatus;
  int userType;
  int gender;
  int accountStatus;
  String nickname;
  int userId;
  int vipType;
  int follows;
  int followeds;
  bool mutual;
  bool followed;
  String signature;
  int eventCount;
  int playlistCount;

  Follow(
      {this.py,
      this.time,
      this.avatarUrl,
      this.authStatus,
      this.userType,
      this.gender,
      this.accountStatus,
      this.nickname,
      this.userId,
      this.vipType,
      this.follows,
      this.followeds,
      this.mutual,
      this.followed,
      this.signature,
      this.eventCount,
      this.playlistCount});

  Follow.fromJson(Map<String, dynamic> json) {
    py = json['py'];
    time = json['time'];
    avatarUrl = json['avatarUrl'];
    authStatus = json['authStatus'];
    userType = json['userType'];
    gender = json['gender'];
    accountStatus = json['accountStatus'];
    nickname = json['nickname'];
    userId = json['userId'];
    vipType = json['vipType'];
    follows = json['follows'];
    followeds = json['followeds'];
    mutual = json['mutual'];
    followed = json['followed'];
    signature = json['signature'];
    eventCount = json['eventCount'];
    playlistCount = json['playlistCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['py'] = this.py;
    data['time'] = this.time;
    data['avatarUrl'] = this.avatarUrl;
    data['authStatus'] = this.authStatus;
    data['userType'] = this.userType;
    data['gender'] = this.gender;
    data['accountStatus'] = this.accountStatus;
    data['nickname'] = this.nickname;
    data['userId'] = this.userId;
    data['vipType'] = this.vipType;
    data['follows'] = this.follows;
    data['followeds'] = this.followeds;
    data['mutual'] = this.mutual;
    data['followed'] = this.followed;
    data['signature'] = this.signature;
    data['eventCount'] = this.eventCount;
    data['playlistCount'] = this.playlistCount;
    return data;
  }
}
