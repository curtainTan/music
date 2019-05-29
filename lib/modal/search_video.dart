class SearchVideoModal {
  VideoResult result;
  int code;

  SearchVideoModal({this.result, this.code});

  SearchVideoModal.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new VideoResult.fromJson(json['result']) : null;
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

class VideoResult {
  int videoCount;
  List<OnlyVideos> videos;

  VideoResult({this.videoCount, this.videos});

  VideoResult.fromJson(Map<String, dynamic> json) {
    videoCount = json['videoCount'];
    if (json['videos'] != null) {
      videos = new List<OnlyVideos>();
      json['videos'].forEach((v) {
        videos.add(new OnlyVideos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoCount'] = this.videoCount;
    if (this.videos != null) {
      data['videos'] = this.videos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnlyVideos {
  String coverUrl;
  String title;
  int durationms;
  int playTime;
  int type;
  List<Creator> creator;
  String vid;
  String alg;

  OnlyVideos(
      {this.coverUrl,
      this.title,
      this.durationms,
      this.playTime,
      this.type,
      this.creator,
      this.vid,
      this.alg});

  OnlyVideos.fromJson(Map<String, dynamic> json) {
    coverUrl = json['coverUrl'];
    title = json['title'];
    durationms = json['durationms'];
    playTime = json['playTime'];
    type = json['type'];
    if (json['creator'] != null) {
      creator = new List<Creator>();
      json['creator'].forEach((v) {
        creator.add(new Creator.fromJson(v));
      });
    }
    vid = json['vid'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coverUrl'] = this.coverUrl;
    data['title'] = this.title;
    data['durationms'] = this.durationms;
    data['playTime'] = this.playTime;
    data['type'] = this.type;
    if (this.creator != null) {
      data['creator'] = this.creator.map((v) => v.toJson()).toList();
    }
    data['vid'] = this.vid;
    data['alg'] = this.alg;
    return data;
  }
}

class Creator {
  int userId;
  String userName;

  Creator({this.userId, this.userName});

  Creator.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    return data;
  }
}
