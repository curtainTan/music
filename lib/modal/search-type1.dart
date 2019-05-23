class SearchType1 {
  SearchType1Result result;
  int code;

  SearchType1({this.result, this.code});

  SearchType1.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new SearchType1Result.fromJson(json['result']) : null;
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

class SearchType1Result {
  List<SearchType1Songs> songs;
  int songCount;

  SearchType1Result({this.songs, this.songCount});

  SearchType1Result.fromJson(Map<String, dynamic> json) {
    if (json['songs'] != null) {
      songs = new List<SearchType1Songs>();
      json['songs'].forEach((v) {
        songs.add(new SearchType1Songs.fromJson(v));
      });
    }
    songCount = json['songCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songs != null) {
      data['songs'] = this.songs.map((v) => v.toJson()).toList();
    }
    data['songCount'] = this.songCount;
    return data;
  }
}

class SearchType1Songs {
  int id;
  String name;
  List<Artists> artists;
  Album album;
  int duration;
  int copyrightId;
  int status;
  int rtype;
  int ftype;
  int mvid;
  int fee;

  SearchType1Songs(
      {this.id,
      this.name,
      this.artists,
      this.album,
      this.duration,
      this.copyrightId,
      this.status,
      this.rtype,
      this.ftype,
      this.mvid,
      this.fee});

  SearchType1Songs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    duration = json['duration'];
    copyrightId = json['copyrightId'];
    status = json['status'];
    rtype = json['rtype'];
    ftype = json['ftype'];
    mvid = json['mvid'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['duration'] = this.duration;
    data['copyrightId'] = this.copyrightId;
    data['status'] = this.status;
    data['rtype'] = this.rtype;
    data['ftype'] = this.ftype;
    data['mvid'] = this.mvid;
    data['fee'] = this.fee;
    return data;
  }
}

class Artists {
  int id;
  String name;
  int albumSize;
  int picId;
  String img1v1Url;
  int img1v1;

  Artists(
      {this.id,
      this.name,
      this.albumSize,
      this.picId,
      this.img1v1Url,
      this.img1v1});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    albumSize = json['albumSize'];
    picId = json['picId'];
    img1v1Url = json['img1v1Url'];
    img1v1 = json['img1v1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['albumSize'] = this.albumSize;
    data['picId'] = this.picId;
    data['img1v1Url'] = this.img1v1Url;
    data['img1v1'] = this.img1v1;
    return data;
  }
}

class Album {
  int id;
  String name;
  SearchType1Artist artist;
  int publishTime;
  int size;
  int copyrightId;
  int status;
  int picId;

  Album(
      {this.id,
      this.name,
      this.artist,
      this.publishTime,
      this.size,
      this.copyrightId,
      this.status,
      this.picId});

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    artist =
        json['artist'] != null ? new SearchType1Artist.fromJson(json['artist']) : null;
    publishTime = json['publishTime'];
    size = json['size'];
    copyrightId = json['copyrightId'];
    status = json['status'];
    picId = json['picId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
    data['publishTime'] = this.publishTime;
    data['size'] = this.size;
    data['copyrightId'] = this.copyrightId;
    data['status'] = this.status;
    data['picId'] = this.picId;
    return data;
  }
}

class SearchType1Artist {
  int id;
  String name;
  int albumSize;
  int picId;
  String img1v1Url;
  int img1v1;

  SearchType1Artist(
      {this.id,
      this.name,
      this.albumSize,
      this.picId,
      this.img1v1Url,
      this.img1v1});

  SearchType1Artist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    albumSize = json['albumSize'];
    picId = json['picId'];
    img1v1Url = json['img1v1Url'];
    img1v1 = json['img1v1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['albumSize'] = this.albumSize;
    data['picId'] = this.picId;
    data['img1v1Url'] = this.img1v1Url;
    data['img1v1'] = this.img1v1;
    return data;
  }
}
