class MyBanner {
  List<Banners> banners;
  int code;

  MyBanner({this.banners, this.code});

  MyBanner.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Banners {
  String imageUrl;
  int targetId;
  int targetType;
  String titleColor;
  String typeTitle;
  String url;
  bool exclusive;
  String encodeId;

  Banners(
      {this.imageUrl,
      this.targetId,
      this.targetType,
      this.titleColor,
      this.typeTitle,
      this.url,
      this.exclusive,
      this.encodeId});

  Banners.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    targetId = json['targetId'];
    targetType = json['targetType'];
    titleColor = json['titleColor'];
    typeTitle = json['typeTitle'];
    url = json['url'];
    exclusive = json['exclusive'];
    encodeId = json['encodeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['targetId'] = this.targetId;
    data['targetType'] = this.targetType;
    data['titleColor'] = this.titleColor;
    data['typeTitle'] = this.typeTitle;
    data['url'] = this.url;
    data['exclusive'] = this.exclusive;
    data['encodeId'] = this.encodeId;
    return data;
  }
}
