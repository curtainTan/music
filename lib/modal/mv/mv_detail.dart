class MvDetailModal {
  String loadingPic;
  String bufferPic;
  String loadingPicFS;
  String bufferPicFS;
  bool subed;
  Data data;
  int code;

  MvDetailModal(
      {this.loadingPic,
      this.bufferPic,
      this.loadingPicFS,
      this.bufferPicFS,
      this.subed,
      this.data,
      this.code});

  MvDetailModal.fromJson(Map<String, dynamic> json) {
    loadingPic = json['loadingPic'];
    bufferPic = json['bufferPic'];
    loadingPicFS = json['loadingPicFS'];
    bufferPicFS = json['bufferPicFS'];
    subed = json['subed'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loadingPic'] = this.loadingPic;
    data['bufferPic'] = this.bufferPic;
    data['loadingPicFS'] = this.loadingPicFS;
    data['bufferPicFS'] = this.bufferPicFS;
    data['subed'] = this.subed;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int id;
  String name;
  int artistId;
  String artistName;
  String briefDesc;
  String cover;
  int coverId;
  int playCount;
  int subCount;
  int shareCount;
  int likeCount;
  int commentCount;
  int duration;
  int nType;
  String publishTime;
  Brs brs;
  List<Artists> artists;
  bool isReward;
  String commentThreadId;

  Data(
      {this.id,
      this.name,
      this.artistId,
      this.artistName,
      this.briefDesc,
      this.cover,
      this.coverId,
      this.playCount,
      this.subCount,
      this.shareCount,
      this.likeCount,
      this.commentCount,
      this.duration,
      this.nType,
      this.publishTime,
      this.brs,
      this.artists,
      this.isReward,
      this.commentThreadId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    artistId = json['artistId'];
    artistName = json['artistName'];
    briefDesc = json['briefDesc'];
    cover = json['cover'];
    coverId = json['coverId'];
    playCount = json['playCount'];
    subCount = json['subCount'];
    shareCount = json['shareCount'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    duration = json['duration'];
    nType = json['nType'];
    publishTime = json['publishTime'];
    brs = json['brs'] != null ? new Brs.fromJson(json['brs']) : null;
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    isReward = json['isReward'];
    commentThreadId = json['commentThreadId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['artistId'] = this.artistId;
    data['artistName'] = this.artistName;
    data['briefDesc'] = this.briefDesc;
    data['cover'] = this.cover;
    data['coverId'] = this.coverId;
    data['playCount'] = this.playCount;
    data['subCount'] = this.subCount;
    data['shareCount'] = this.shareCount;
    data['likeCount'] = this.likeCount;
    data['commentCount'] = this.commentCount;
    data['duration'] = this.duration;
    data['nType'] = this.nType;
    data['publishTime'] = this.publishTime;
    if (this.brs != null) {
      data['brs'] = this.brs.toJson();
    }
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['isReward'] = this.isReward;
    data['commentThreadId'] = this.commentThreadId;
    return data;
  }
}

class Brs {
  String s240;
  String s480;

  Brs({this.s240, this.s480});

  Brs.fromJson(Map<String, dynamic> json) {
    s240 = json['240'];
    s480 = json['480'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['240'] = this.s240;
    data['480'] = this.s480;
    return data;
  }
}

class Artists {
  int id;
  String name;

  Artists({this.id, this.name});

  Artists.fromJson(Map<String, dynamic> json) {
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
