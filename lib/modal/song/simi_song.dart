class SimiSongModal {
  List<SimiSongs> songs;
  int code;

  SimiSongModal({this.songs, this.code});

  SimiSongModal.fromJson(Map<String, dynamic> json) {
    if (json['songs'] != null) {
      songs = new List<SimiSongs>();
      json['songs'].forEach((v) {
        songs.add(new SimiSongs.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songs != null) {
      data['songs'] = this.songs.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class SimiSongs {
  String commentThreadId;
  int no;
  int mvid;
  List<SimiArtists> artists;
  int copyrightId;
  int score;
  int position;
  int duration;
  int status;
  String disc;
  String name;
  int id;
  String recommendReason;
  String alg;

  SimiSongs(
      {this.commentThreadId,
      this.no,
      this.mvid,
      this.artists,
      this.copyrightId,
      this.score,
      this.position,
      this.duration,
      this.status,
      this.disc,
      this.name,
      this.id,
      this.recommendReason,
      this.alg});

  SimiSongs.fromJson(Map<String, dynamic> json) {
    commentThreadId = json['commentThreadId'];
    no = json['no'];
    mvid = json['mvid'];
    if (json['artists'] != null) {
      artists = new List<SimiArtists>();
      json['artists'].forEach((v) {
        artists.add(new SimiArtists.fromJson(v));
      });
    }
    copyrightId = json['copyrightId'];
    score = json['score'];
    position = json['position'];
    duration = json['duration'];
    status = json['status'];
    disc = json['disc'];
    name = json['name'];
    id = json['id'];
    recommendReason = json['recommendReason'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentThreadId'] = this.commentThreadId;
    data['no'] = this.no;
    data['mvid'] = this.mvid;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['copyrightId'] = this.copyrightId;
    data['score'] = this.score;
    data['position'] = this.position;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['disc'] = this.disc;
    data['name'] = this.name;
    data['id'] = this.id;
    data['recommendReason'] = this.recommendReason;
    data['alg'] = this.alg;
    return data;
  }
}

class SimiArtists {
  int img1v1Id;
  String briefDesc;
  int albumSize;
  String img1v1Url;
  int musicSize;
  String picUrl;
  int picId;
  String trans;
  bool followed;
  String name;
  int id;
  String img1v1IdStr;

  SimiArtists(
      {this.img1v1Id,
      this.briefDesc,
      this.albumSize,
      this.img1v1Url,
      this.musicSize,
      this.picUrl,
      this.picId,
      this.trans,
      this.followed,
      this.name,
      this.id,
      this.img1v1IdStr});

  SimiArtists.fromJson(Map<String, dynamic> json) {
    img1v1Id = json['img1v1Id'];
    briefDesc = json['briefDesc'];
    albumSize = json['albumSize'];
    img1v1Url = json['img1v1Url'];
    musicSize = json['musicSize'];
    picUrl = json['picUrl'];
    picId = json['picId'];
    trans = json['trans'];
    followed = json['followed'];
    name = json['name'];
    id = json['id'];
    img1v1IdStr = json['img1v1Id_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img1v1Id'] = this.img1v1Id;
    data['briefDesc'] = this.briefDesc;
    data['albumSize'] = this.albumSize;
    data['img1v1Url'] = this.img1v1Url;
    data['musicSize'] = this.musicSize;
    data['picUrl'] = this.picUrl;
    data['picId'] = this.picId;
    data['trans'] = this.trans;
    data['followed'] = this.followed;
    data['name'] = this.name;
    data['id'] = this.id;
    data['img1v1Id_str'] = this.img1v1IdStr;
    return data;
  }
}
