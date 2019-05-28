class MvComment {
  bool isMusician;
  int userId;
  bool moreHot;
  List<HotComments> hotComments;
  int code;
  List<Comments> comments;
  int total;
  bool more;

  MvComment(
      {this.isMusician,
      this.userId,
      this.moreHot,
      this.hotComments,
      this.code,
      this.comments,
      this.total,
      this.more});

  MvComment.fromJson(Map<String, dynamic> json) {
    isMusician = json['isMusician'];
    userId = json['userId'];
    moreHot = json['moreHot'];
    if (json['hotComments'] != null) {
      hotComments = new List<HotComments>();
      json['hotComments'].forEach((v) {
        hotComments.add(new HotComments.fromJson(v));
      });
    }
    code = json['code'];
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    total = json['total'];
    more = json['more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMusician'] = this.isMusician;
    data['userId'] = this.userId;
    data['moreHot'] = this.moreHot;
    if (this.hotComments != null) {
      data['hotComments'] = this.hotComments.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['more'] = this.more;
    return data;
  }
}

class HotComments {
  User user;
  List<BeReplied> beReplied;
  int status;
  int commentLocationType;
  int parentCommentId;
  bool repliedMark;
  bool liked;
  int commentId;
  int time;
  int likedCount;
  String content;

  HotComments(
      {this.user,
      this.beReplied,
      this.status,
      this.commentLocationType,
      this.parentCommentId,
      this.repliedMark,
      this.liked,
      this.commentId,
      this.time,
      this.likedCount,
      this.content});

  HotComments.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['beReplied'] != null) {
      beReplied = new List<BeReplied>();
      json['beReplied'].forEach((v) {
        beReplied.add(new BeReplied.fromJson(v));
      });
    }
    status = json['status'];
    commentLocationType = json['commentLocationType'];
    parentCommentId = json['parentCommentId'];
    repliedMark = json['repliedMark'];
    liked = json['liked'];
    commentId = json['commentId'];
    time = json['time'];
    likedCount = json['likedCount'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.beReplied != null) {
      data['beReplied'] = this.beReplied.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['commentLocationType'] = this.commentLocationType;
    data['parentCommentId'] = this.parentCommentId;
    data['repliedMark'] = this.repliedMark;
    data['liked'] = this.liked;
    data['commentId'] = this.commentId;
    data['time'] = this.time;
    data['likedCount'] = this.likedCount;
    data['content'] = this.content;
    return data;
  }
}

class User {
  int userType;
  String nickname;
  VipRights vipRights;
  int vipType;
  int authStatus;
  String avatarUrl;
  int userId;

  User(
      {this.userType,
      this.nickname,
      this.vipRights,
      this.vipType,
      this.authStatus,
      this.avatarUrl,
      this.userId});

  User.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    nickname = json['nickname'];
    vipRights = json['vipRights'] != null
        ? new VipRights.fromJson(json['vipRights'])
        : null;
    vipType = json['vipType'];
    authStatus = json['authStatus'];
    avatarUrl = json['avatarUrl'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userType'] = this.userType;
    data['nickname'] = this.nickname;
    if (this.vipRights != null) {
      data['vipRights'] = this.vipRights.toJson();
    }
    data['vipType'] = this.vipType;
    data['authStatus'] = this.authStatus;
    data['avatarUrl'] = this.avatarUrl;
    data['userId'] = this.userId;
    return data;
  }
}

class VipRights {
  Associator associator;
  int redVipAnnualCount;

  VipRights({this.associator, this.redVipAnnualCount});

  VipRights.fromJson(Map<String, dynamic> json) {
    associator = json['associator'] != null
        ? new Associator.fromJson(json['associator'])
        : null;
    redVipAnnualCount = json['redVipAnnualCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.associator != null) {
      data['associator'] = this.associator.toJson();
    }
    data['redVipAnnualCount'] = this.redVipAnnualCount;
    return data;
  }
}

class Associator {
  int vipCode;
  bool rights;

  Associator({this.vipCode, this.rights});

  Associator.fromJson(Map<String, dynamic> json) {
    vipCode = json['vipCode'];
    rights = json['rights'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vipCode'] = this.vipCode;
    data['rights'] = this.rights;
    return data;
  }
}

class BeReplied {
  User user;
  int beRepliedCommentId;
  String content;
  int status;

  BeReplied({this.user, this.beRepliedCommentId, this.content, this.status});

  BeReplied.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    beRepliedCommentId = json['beRepliedCommentId'];
    content = json['content'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['beRepliedCommentId'] = this.beRepliedCommentId;
    data['content'] = this.content;
    data['status'] = this.status;
    return data;
  }
}

class Comments {
  User user;
  List<BeReplied> beReplied;
  int status;
  int commentLocationType;
  int parentCommentId;
  bool repliedMark;
  bool liked;
  int commentId;
  int time;
  int likedCount;
  String content;
  bool isRemoveHotComment;

  Comments(
      {this.user,
      this.beReplied,
      this.status,
      this.commentLocationType,
      this.parentCommentId,
      this.repliedMark,
      this.liked,
      this.commentId,
      this.time,
      this.likedCount,
      this.content,
      this.isRemoveHotComment});

  Comments.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['beReplied'] != null) {
      beReplied = new List<BeReplied>();
      json['beReplied'].forEach((v) {
        beReplied.add(new BeReplied.fromJson(v));
      });
    }
    status = json['status'];
    commentLocationType = json['commentLocationType'];
    parentCommentId = json['parentCommentId'];
    repliedMark = json['repliedMark'];
    liked = json['liked'];
    commentId = json['commentId'];
    time = json['time'];
    likedCount = json['likedCount'];
    content = json['content'];
    isRemoveHotComment = json['isRemoveHotComment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.beReplied != null) {
      data['beReplied'] = this.beReplied.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['commentLocationType'] = this.commentLocationType;
    data['parentCommentId'] = this.parentCommentId;
    data['repliedMark'] = this.repliedMark;
    data['liked'] = this.liked;
    data['commentId'] = this.commentId;
    data['time'] = this.time;
    data['likedCount'] = this.likedCount;
    data['content'] = this.content;
    data['isRemoveHotComment'] = this.isRemoveHotComment;
    return data;
  }
}
