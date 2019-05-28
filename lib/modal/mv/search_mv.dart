class SearchMvModal {
  MvResult result;
  int code;

  SearchMvModal({this.result, this.code});

  SearchMvModal.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new MvResult.fromJson(json['result']) : null;
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

class MvResult {
  int mvCount;
  List<OnlyMvs> mvs;

  MvResult({this.mvCount, this.mvs});

  MvResult.fromJson(Map<String, dynamic> json) {
    mvCount = json['mvCount'];
    if (json['mvs'] != null) {
      mvs = new List<OnlyMvs>();
      json['mvs'].forEach((v) {
        mvs.add(new OnlyMvs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mvCount'] = this.mvCount;
    if (this.mvs != null) {
      data['mvs'] = this.mvs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnlyMvs {
  int id;
  String cover;
  String name;
  int playCount;
  String briefDesc;
  String artistName;
  int artistId;
  int duration;
  int mark;
  String arTransName;
  List<MvArtists> artists;
  String alg;

  OnlyMvs(
      {this.id,
      this.cover,
      this.name,
      this.playCount,
      this.briefDesc,
      this.artistName,
      this.artistId,
      this.duration,
      this.mark,
      this.arTransName,
      this.artists,
      this.alg});

  OnlyMvs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'];
    name = json['name'];
    playCount = json['playCount'];
    briefDesc = json['briefDesc'];
    artistName = json['artistName'];
    artistId = json['artistId'];
    duration = json['duration'];
    mark = json['mark'];
    arTransName = json['arTransName'];
    if (json['artists'] != null) {
      artists = new List<MvArtists>();
      json['artists'].forEach((v) {
        artists.add(new MvArtists.fromJson(v));
      });
    }
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cover'] = this.cover;
    data['name'] = this.name;
    data['playCount'] = this.playCount;
    data['briefDesc'] = this.briefDesc;
    data['artistName'] = this.artistName;
    data['artistId'] = this.artistId;
    data['duration'] = this.duration;
    data['mark'] = this.mark;
    data['arTransName'] = this.arTransName;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['alg'] = this.alg;
    return data;
  }
}

class MvArtists {
  int id;
  String name;

  MvArtists({this.id, this.name});

  MvArtists.fromJson(Map<String, dynamic> json) {
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
