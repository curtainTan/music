class VideoUrlModal {
  List<Urls> urls;
  int code;

  VideoUrlModal({this.urls, this.code});

  VideoUrlModal.fromJson(Map<String, dynamic> json) {
    if (json['urls'] != null) {
      urls = new List<Urls>();
      json['urls'].forEach((v) {
        urls.add(new Urls.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.urls != null) {
      data['urls'] = this.urls.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Urls {
  String id;
  String url;
  int size;
  int validityTime;
  bool needPay;
  int r;

  Urls({this.id, this.url, this.size, this.validityTime, this.needPay, this.r});

  Urls.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    size = json['size'];
    validityTime = json['validityTime'];
    needPay = json['needPay'];
    r = json['r'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['size'] = this.size;
    data['validityTime'] = this.validityTime;
    data['needPay'] = this.needPay;
    data['r'] = this.r;
    return data;
  }
}
