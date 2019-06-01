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
  bool starred;
  int popularity;
  String mp3Url;
  int mvid;
  int no;
  String ringtone;
  String disc;
  int score;
  int copyrightId;
  SimiAlbum album;
  int position;
  int duration;
  String commentThreadId;
  int fee;
  String name;
  int id;
  String recommendReason;
  String alg;

  SimiSongs(
      {this.starred,
      this.popularity,
      this.mp3Url,
      this.mvid,
      this.no,
      this.ringtone,
      this.disc,
      this.score,
      this.copyrightId,
      this.album,
      this.position,
      this.duration,
      this.commentThreadId,
      this.fee,
      this.name,
      this.id,
      this.recommendReason,
      this.alg});

  SimiSongs.fromJson(Map<String, dynamic> json) {
    starred = json['starred'];
    popularity = json['popularity'];
    mp3Url = json['mp3Url'];
    mvid = json['mvid'];
    no = json['no'];
    ringtone = json['ringtone'];
    disc = json['disc'];
    score = json['score'];
    copyrightId = json['copyrightId'];
    album = json['album'] != null ? new SimiAlbum.fromJson(json['album']) : null;
    position = json['position'];
    duration = json['duration'];
    commentThreadId = json['commentThreadId'];
    fee = json['fee'];
    name = json['name'];
    id = json['id'];
    recommendReason = json['recommendReason'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['starred'] = this.starred;
    data['popularity'] = this.popularity;
    data['mp3Url'] = this.mp3Url;
    data['mvid'] = this.mvid;
    data['no'] = this.no;
    data['ringtone'] = this.ringtone;
    data['disc'] = this.disc;
    data['score'] = this.score;
    data['copyrightId'] = this.copyrightId;
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['position'] = this.position;
    data['duration'] = this.duration;
    data['commentThreadId'] = this.commentThreadId;
    data['fee'] = this.fee;
    data['name'] = this.name;
    data['id'] = this.id;
    data['recommendReason'] = this.recommendReason;
    data['alg'] = this.alg;
    return data;
  }
}

class SimiAlbum {
  String briefDesc;
  String blurPicUrl;
  int companyId;
  int pic;
  String picUrl;
  String company;
  int copyrightId;
  int picId;
  List<SimiArtists> artists;
  String subType;
  String description;
  String commentThreadId;
  String name;
  int id;
  String type;
  int size;

  SimiAlbum(
      {this.briefDesc,
      this.blurPicUrl,
      this.companyId,
      this.pic,
      this.picUrl,
      this.company,
      this.copyrightId,
      this.picId,
      this.artists,
      this.subType,
      this.description,
      this.commentThreadId,
      this.name,
      this.id,
      this.type,
      this.size});

  SimiAlbum.fromJson(Map<String, dynamic> json) {
    briefDesc = json['briefDesc'];
    blurPicUrl = json['blurPicUrl'];
    companyId = json['companyId'];
    pic = json['pic'];
    picUrl = json['picUrl'];
    company = json['company'];
    copyrightId = json['copyrightId'];
    picId = json['picId'];
    if (json['artists'] != null) {
      artists = new List<SimiArtists>();
      json['artists'].forEach((v) {
        artists.add(new SimiArtists.fromJson(v));
      });
    }
    subType = json['subType'];
    description = json['description'];
    commentThreadId = json['commentThreadId'];
    name = json['name'];
    id = json['id'];
    type = json['type'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['briefDesc'] = this.briefDesc;
    data['blurPicUrl'] = this.blurPicUrl;
    data['companyId'] = this.companyId;
    data['pic'] = this.pic;
    data['picUrl'] = this.picUrl;
    data['company'] = this.company;
    data['copyrightId'] = this.copyrightId;
    data['picId'] = this.picId;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['subType'] = this.subType;
    data['description'] = this.description;
    data['commentThreadId'] = this.commentThreadId;
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['size'] = this.size;
    return data;
  }
}

class SimiArtists {
  int img1v1Id;
  String briefDesc;
  bool followed;
  String picUrl;
  int albumSize;
  int musicSize;
  int picId;
  String trans;
  String img1v1Url;
  String name;
  int id;
  String img1v1IdStr;

  SimiArtists(
      {this.img1v1Id,
      this.briefDesc,
      this.followed,
      this.picUrl,
      this.albumSize,
      this.musicSize,
      this.picId,
      this.trans,
      this.img1v1Url,
      this.name,
      this.id,
      this.img1v1IdStr});

  SimiArtists.fromJson(Map<String, dynamic> json) {
    img1v1Id = json['img1v1Id'];
    briefDesc = json['briefDesc'];
    followed = json['followed'];
    picUrl = json['picUrl'];
    albumSize = json['albumSize'];
    musicSize = json['musicSize'];
    picId = json['picId'];
    trans = json['trans'];
    img1v1Url = json['img1v1Url'];
    name = json['name'];
    id = json['id'];
    img1v1IdStr = json['img1v1Id_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img1v1Id'] = this.img1v1Id;
    data['briefDesc'] = this.briefDesc;
    data['followed'] = this.followed;
    data['picUrl'] = this.picUrl;
    data['albumSize'] = this.albumSize;
    data['musicSize'] = this.musicSize;
    data['picId'] = this.picId;
    data['trans'] = this.trans;
    data['img1v1Url'] = this.img1v1Url;
    data['name'] = this.name;
    data['id'] = this.id;
    data['img1v1Id_str'] = this.img1v1IdStr;
    return data;
  }
}
