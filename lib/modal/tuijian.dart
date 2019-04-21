class Tuijian {
  bool hasTaste;
  int code;
  int category;
  List<GedanList> result;

  Tuijian({this.hasTaste, this.code, this.category, this.result});

  Tuijian.fromJson(Map<String, dynamic> json) {
    hasTaste = json['hasTaste'];
    code = json['code'];
    category = json['category'];
    if (json['result'] != null) {
      result = new List<GedanList>();
      json['result'].forEach((v) {
        result.add(new GedanList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasTaste'] = this.hasTaste;
    data['code'] = this.code;
    data['category'] = this.category;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GedanList {
  int id;
  int type;
  String name;
  String copywriter;
  String picUrl;
  bool canDislike;
  num playCount;
  int trackCount;
  bool highQuality;
  String alg;

  GedanList(
      {this.id,
      this.type,
      this.name,
      this.copywriter,
      this.picUrl,
      this.canDislike,
      this.playCount,
      this.trackCount,
      this.highQuality,
      this.alg});

  GedanList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    copywriter = json['copywriter'];
    picUrl = json['picUrl'];
    canDislike = json['canDislike'];
    playCount = json['playCount'];
    trackCount = json['trackCount'];
    highQuality = json['highQuality'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['copywriter'] = this.copywriter;
    data['picUrl'] = this.picUrl;
    data['canDislike'] = this.canDislike;
    data['playCount'] = this.playCount;
    data['trackCount'] = this.trackCount;
    data['highQuality'] = this.highQuality;
    data['alg'] = this.alg;
    return data;
  }
}
