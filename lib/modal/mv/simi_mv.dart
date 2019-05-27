class SimiMvModal {
  List<Mvs> mvs;
  int code;

  SimiMvModal({this.mvs, this.code});

  SimiMvModal.fromJson(Map<String, dynamic> json) {
    if (json['mvs'] != null) {
      mvs = new List<Mvs>();
      json['mvs'].forEach((v) {
        mvs.add(new Mvs.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mvs != null) {
      data['mvs'] = this.mvs.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Mvs {
  int id;
  String cover;
  String name;
  int playCount;
  String artistName;
  int artistId;
  int duration;
  int mark;
  List<Artists> artists;
  String alg;

  Mvs(
      {this.id,
      this.cover,
      this.name,
      this.playCount,
      this.artistName,
      this.artistId,
      this.duration,
      this.mark,
      this.artists,
      this.alg});

  Mvs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'];
    name = json['name'];
    playCount = json['playCount'];
    artistName = json['artistName'];
    artistId = json['artistId'];
    duration = json['duration'];
    mark = json['mark'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
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
    data['artistName'] = this.artistName;
    data['artistId'] = this.artistId;
    data['duration'] = this.duration;
    data['mark'] = this.mark;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['alg'] = this.alg;
    return data;
  }
}

class Artists {
  int id;
  String name;
  List<String> alias;

  Artists({this.id, this.name, this.alias});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alias'] = this.alias;
    return data;
  }
}
