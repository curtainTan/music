class RelatedRideoModal {
  int code;
  String message;
  List<OneData> data;

  RelatedRideoModal({this.code, this.message, this.data});

  RelatedRideoModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<OneData>();
      json['data'].forEach((v) {
        data.add(new OneData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OneData {
  int type;
  String title;
  int durationms;
  List<VideoCreator> creator;
  int playTime;
  String coverUrl;
  String vid;
  String alg;

  OneData(
      {this.type,
      this.title,
      this.durationms,
      this.creator,
      this.playTime,
      this.coverUrl,
      this.vid,
      this.alg});

  OneData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    durationms = json['durationms'];
    if (json['creator'] != null) {
      creator = new List<VideoCreator>();
      json['creator'].forEach((v) {
        creator.add(new VideoCreator.fromJson(v));
      });
    }
    playTime = json['playTime'];
    coverUrl = json['coverUrl'];
    vid = json['vid'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['durationms'] = this.durationms;
    if (this.creator != null) {
      data['creator'] = this.creator.map((v) => v.toJson()).toList();
    }
    data['playTime'] = this.playTime;
    data['coverUrl'] = this.coverUrl;
    data['vid'] = this.vid;
    data['alg'] = this.alg;
    return data;
  }
}

class VideoCreator {
  int userId;
  String userName;

  VideoCreator({this.userId, this.userName});

  VideoCreator.fromJson(Map<String, dynamic> json) {
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
