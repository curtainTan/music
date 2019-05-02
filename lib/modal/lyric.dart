class LyricModel {
  bool sgc;
  bool sfy;
  bool qfy;
  bool nolyric;
  bool needDesc;
  LyricUser lyricUser;
  Lrc lrc;
  Klyric klyric;
  Tlyric tlyric;
  int code;

  LyricModel(
      {this.sgc,
      this.sfy,
      this.qfy,
      this.nolyric,
      this.needDesc,
      this.lyricUser,
      this.lrc,
      this.klyric,
      this.tlyric,
      this.code});

  LyricModel.fromJson(Map<String, dynamic> json) {
    sgc = json['sgc'];
    sfy = json['sfy'];
    qfy = json['qfy'];
    nolyric = json['nolyric'];
    needDesc = json['needDesc'];
    lyricUser = json['lyricUser'] != null
        ? new LyricUser.fromJson(json['lyricUser'])
        : null;
    lrc = json['lrc'] != null ? new Lrc.fromJson(json['lrc']) : null;
    klyric =
        json['klyric'] != null ? new Klyric.fromJson(json['klyric']) : null;
    tlyric =
        json['tlyric'] != null ? new Tlyric.fromJson(json['tlyric']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sgc'] = this.sgc;
    data['sfy'] = this.sfy;
    data['qfy'] = this.qfy;
    data['nolyric'] = this.nolyric;
    data['needDesc'] = this.needDesc;
    if (this.lyricUser != null) {
      data['lyricUser'] = this.lyricUser.toJson();
    }
    if (this.lrc != null) {
      data['lrc'] = this.lrc.toJson();
    }
    if (this.klyric != null) {
      data['klyric'] = this.klyric.toJson();
    }
    if (this.tlyric != null) {
      data['tlyric'] = this.tlyric.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class LyricUser {
  int id;
  int status;
  int demand;
  int userid;
  String nickname;
  int uptime;

  LyricUser(
      {this.id,
      this.status,
      this.demand,
      this.userid,
      this.nickname,
      this.uptime});

  LyricUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    demand = json['demand'];
    userid = json['userid'];
    nickname = json['nickname'];
    uptime = json['uptime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['demand'] = this.demand;
    data['userid'] = this.userid;
    data['nickname'] = this.nickname;
    data['uptime'] = this.uptime;
    return data;
  }
}

class Lrc {
  int version;
  String lyric;

  Lrc({this.version, this.lyric});

  Lrc.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    lyric = json['lyric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['lyric'] = this.lyric;
    return data;
  }
}

class Klyric {
  int version;
  String lyric;

  Klyric({this.version, this.lyric});

  Klyric.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    lyric = json['lyric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['lyric'] = this.lyric;
    return data;
  }
}

class Tlyric {
  int version;
  String lyric;

  Tlyric({this.version, this.lyric});

  Tlyric.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    lyric = json['lyric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['lyric'] = this.lyric;
    return data;
  }
}
