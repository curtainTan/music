class SearchSugMobile {
  SearchSugMobileResult result;
  int code;

  SearchSugMobile({this.result, this.code});

  SearchSugMobile.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new SearchSugMobileResult.fromJson(json['result']) : null;
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

class SearchSugMobileResult {
  List<AllMatch> allMatch;

  SearchSugMobileResult({this.allMatch});

  SearchSugMobileResult.fromJson(Map<String, dynamic> json) {
    if (json['allMatch'] != null) {
      allMatch = new List<AllMatch>();
      json['allMatch'].forEach((v) {
        allMatch.add(new AllMatch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allMatch != null) {
      data['allMatch'] = this.allMatch.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllMatch {
  String keyword;
  int type;
  String alg;
  String lastKeyword;

  AllMatch({this.keyword, this.type, this.alg, this.lastKeyword});

  AllMatch.fromJson(Map<String, dynamic> json) {
    keyword = json['keyword'];
    type = json['type'];
    alg = json['alg'];
    lastKeyword = json['lastKeyword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyword'] = this.keyword;
    data['type'] = this.type;
    data['alg'] = this.alg;
    data['lastKeyword'] = this.lastKeyword;
    return data;
  }
}
