class VideoDetailModal {
  int code;
  VideoData data;
  String message;

  VideoDetailModal({this.code, this.data, this.message});

  VideoDetailModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new VideoData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class VideoData {
  String vid;
  VideoCreator creator;
  String coverUrl;
  String title;
  String description;
  int durationms;
  String threadId;
  int playTime;
  int praisedCount;
  int commentCount;
  int shareCount;
  int subscribeCount;
  int publishTime;
  String avatarUrl;
  int width;
  int height;
  List<Resolutions> resolutions;
  List<VideoGroup> videoGroup;
  bool hasRelatedGameAd;
  bool advertisement;
  int authType;

  VideoData(
      {this.vid,
      this.creator,
      this.coverUrl,
      this.title,
      this.description,
      this.durationms,
      this.threadId,
      this.playTime,
      this.praisedCount,
      this.commentCount,
      this.shareCount,
      this.subscribeCount,
      this.publishTime,
      this.avatarUrl,
      this.width,
      this.height,
      this.resolutions,
      this.videoGroup,
      this.hasRelatedGameAd,
      this.advertisement,
      this.authType});

  VideoData.fromJson(Map<String, dynamic> json) {
    vid = json['vid'];
    creator =
        json['creator'] != null ? new VideoCreator.fromJson(json['creator']) : null;
    coverUrl = json['coverUrl'];
    title = json['title'];
    description = json['description'];
    durationms = json['durationms'];
    threadId = json['threadId'];
    playTime = json['playTime'];
    praisedCount = json['praisedCount'];
    commentCount = json['commentCount'];
    shareCount = json['shareCount'];
    subscribeCount = json['subscribeCount'];
    publishTime = json['publishTime'];
    avatarUrl = json['avatarUrl'];
    width = json['width'];
    height = json['height'];
    if (json['resolutions'] != null) {
      resolutions = new List<Resolutions>();
      json['resolutions'].forEach((v) {
        resolutions.add(new Resolutions.fromJson(v));
      });
    }
    if (json['videoGroup'] != null) {
      videoGroup = new List<VideoGroup>();
      json['videoGroup'].forEach((v) {
        videoGroup.add(new VideoGroup.fromJson(v));
      });
    }
    hasRelatedGameAd = json['hasRelatedGameAd'];
    advertisement = json['advertisement'];
    authType = json['authType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    data['coverUrl'] = this.coverUrl;
    data['title'] = this.title;
    data['description'] = this.description;
    data['durationms'] = this.durationms;
    data['threadId'] = this.threadId;
    data['playTime'] = this.playTime;
    data['praisedCount'] = this.praisedCount;
    data['commentCount'] = this.commentCount;
    data['shareCount'] = this.shareCount;
    data['subscribeCount'] = this.subscribeCount;
    data['publishTime'] = this.publishTime;
    data['avatarUrl'] = this.avatarUrl;
    data['width'] = this.width;
    data['height'] = this.height;
    if (this.resolutions != null) {
      data['resolutions'] = this.resolutions.map((v) => v.toJson()).toList();
    }
    if (this.videoGroup != null) {
      data['videoGroup'] = this.videoGroup.map((v) => v.toJson()).toList();
    }
    data['hasRelatedGameAd'] = this.hasRelatedGameAd;
    data['advertisement'] = this.advertisement;
    data['authType'] = this.authType;
    return data;
  }
}

class VideoCreator {
  int authStatus;
  bool followed;
  int accountStatus;
  int userId;
  int userType;
  String nickname;
  String avatarUrl;
  Experts experts;

  VideoCreator(
      {this.authStatus,
      this.followed,
      this.accountStatus,
      this.userId,
      this.userType,
      this.nickname,
      this.avatarUrl,
      this.experts});

  VideoCreator.fromJson(Map<String, dynamic> json) {
    authStatus = json['authStatus'];
    followed = json['followed'];
    accountStatus = json['accountStatus'];
    userId = json['userId'];
    userType = json['userType'];
    nickname = json['nickname'];
    avatarUrl = json['avatarUrl'];
    experts =
        json['experts'] != null ? new Experts.fromJson(json['experts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authStatus'] = this.authStatus;
    data['followed'] = this.followed;
    data['accountStatus'] = this.accountStatus;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['nickname'] = this.nickname;
    data['avatarUrl'] = this.avatarUrl;
    if (this.experts != null) {
      data['experts'] = this.experts.toJson();
    }
    return data;
  }
}

class Experts {
  String s1;

  Experts({this.s1});

  Experts.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    return data;
  }
}

class Resolutions {
  int size;
  int resolution;

  Resolutions({this.size, this.resolution});

  Resolutions.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    resolution = json['resolution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['resolution'] = this.resolution;
    return data;
  }
}

class VideoGroup {
  int id;
  String name;
  String alg;

  VideoGroup({this.id, this.name, this.alg});

  VideoGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alg'] = this.alg;
    return data;
  }
}
