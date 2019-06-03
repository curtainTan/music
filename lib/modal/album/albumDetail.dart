class AlbumDetailModal {
    List<AlbunmSongs> songs;
    int code;
    OneAlbum album;
  
    AlbumDetailModal({this.songs, this.code, this.album});
  
    AlbumDetailModal.fromJson(Map<String, dynamic> json) {
      if (json['songs'] != null) {
        songs = new List<AlbunmSongs>();
        json['songs'].forEach((v) {
          songs.add(new AlbunmSongs.fromJson(v));
        });
      }
      code = json['code'];
      album = json['album'] != null ? new OneAlbum.fromJson(json['album']) : null;
    }
  
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      if (this.songs != null) {
        data['songs'] = this.songs.map((v) => v.toJson()).toList();
      }
      data['code'] = this.code;
      if (this.album != null) {
        data['album'] = this.album.toJson();
      }
      return data;
    }
  }
  
  class AlbunmSongs {
    List<Ar> ar;
    Al al;
    int pst;
    int t;
    List<String> alia;
    int pop;
    String rt;
    int djId;
    String cd;
    String name;
    int id;
  
    AlbunmSongs(
        {this.ar,
        this.al,
        this.pst,
        this.t,
        this.alia,
        this.pop,
        this.rt,
        this.djId,
        this.cd,
        this.name,
        this.id});
  
    AlbunmSongs.fromJson(Map<String, dynamic> json) {
      if (json['ar'] != null) {
        ar = new List<Ar>();
        json['ar'].forEach((v) {
          ar.add(new Ar.fromJson(v));
        });
      }
      al = json['al'] != null ? new Al.fromJson(json['al']) : null;
      pst = json['pst'];
      t = json['t'];
      alia = json['alia'].cast<String>();
      pop = json['pop'];
      rt = json['rt'];
      djId = json['djId'];
      cd = json['cd'];
      name = json['name'];
      id = json['id'];
    }
  
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      if (this.ar != null) {
        data['ar'] = this.ar.map((v) => v.toJson()).toList();
      }
      if (this.al != null) {
        data['al'] = this.al.toJson();
      }
      data['pst'] = this.pst;
      data['t'] = this.t;
      data['alia'] = this.alia;
      data['pop'] = this.pop;
      data['rt'] = this.rt;
      data['djId'] = this.djId;
      data['cd'] = this.cd;
      data['name'] = this.name;
      data['id'] = this.id;
      return data;
    }
  }
  
  class Ar {
    int id;
    String name;
  
    Ar({this.id, this.name});
  
    Ar.fromJson(Map<String, dynamic> json) {
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
  
  class Al {
    int id;
    String name;
    String picUrl;
  
    Al({this.id, this.name, this.picUrl});
  
    Al.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      name = json['name'];
      picUrl = json['picUrl'];
    }
  
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name;
      data['picUrl'] = this.picUrl;
      return data;
    }
  }
  
  class OneAlbum {
    bool paid;
    bool onSale;
    int mark;
    int copyrightId;
    String commentThreadId;
    String briefDesc;
    int publishTime;
    AlbumArtist artist;
    int picId;
    List<String> alias;
    String picUrl;
    String tags;
    int status;
    String subType;
    String description;
    String company;
    int companyId;
    String blurPicUrl;
    int pic;
    String name;
    int id;
    String type;
    int size;
    String picIdStr;
    Info info;
  
    OneAlbum(
        {this.paid,
        this.onSale,
        this.mark,
        this.copyrightId,
        this.commentThreadId,
        this.briefDesc,
        this.publishTime,
        this.artist,
        this.picId,
        this.alias,
        this.picUrl,
        this.tags,
        this.status,
        this.subType,
        this.description,
        this.company,
        this.companyId,
        this.blurPicUrl,
        this.pic,
        this.name,
        this.id,
        this.type,
        this.size,
        this.picIdStr,
        this.info});
  
    OneAlbum.fromJson(Map<String, dynamic> json) {
      paid = json['paid'];
      onSale = json['onSale'];
      mark = json['mark'];
      copyrightId = json['copyrightId'];
      commentThreadId = json['commentThreadId'];
      briefDesc = json['briefDesc'];
      publishTime = json['publishTime'];
      artist =
          json['artist'] != null ? new AlbumArtist.fromJson(json['artist']) : null;
      picId = json['picId'];
      alias = json['alias'].cast<String>();
      picUrl = json['picUrl'];
      tags = json['tags'];
      status = json['status'];
      subType = json['subType'];
      description = json['description'];
      company = json['company'];
      companyId = json['companyId'];
      blurPicUrl = json['blurPicUrl'];
      pic = json['pic'];
      name = json['name'];
      id = json['id'];
      type = json['type'];
      size = json['size'];
      picIdStr = json['picId_str'];
      info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    }
  
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['paid'] = this.paid;
      data['onSale'] = this.onSale;
      data['mark'] = this.mark;
      data['copyrightId'] = this.copyrightId;
      data['commentThreadId'] = this.commentThreadId;
      data['briefDesc'] = this.briefDesc;
      data['publishTime'] = this.publishTime;
      if (this.artist != null) {
        data['artist'] = this.artist.toJson();
      }
      data['picId'] = this.picId;
      data['alias'] = this.alias;
      data['picUrl'] = this.picUrl;
      data['tags'] = this.tags;
      data['status'] = this.status;
      data['subType'] = this.subType;
      data['description'] = this.description;
      data['company'] = this.company;
      data['companyId'] = this.companyId;
      data['blurPicUrl'] = this.blurPicUrl;
      data['pic'] = this.pic;
      data['name'] = this.name;
      data['id'] = this.id;
      data['type'] = this.type;
      data['size'] = this.size;
      data['picId_str'] = this.picIdStr;
      if (this.info != null) {
        data['info'] = this.info.toJson();
      }
      return data;
    }
  }
  
  class AlbumArtist {
    int img1v1Id;
    int topicPerson;
    String img1v1Url;
    int albumSize;
    String briefDesc;
    int picId;
    List<String> alias;
    String picUrl;
    bool followed;
    int musicSize;
    String trans;
    String name;
    int id;
    String picIdStr;
    String img1v1IdStr;
  
    AlbumArtist(
        {this.img1v1Id,
        this.topicPerson,
        this.img1v1Url,
        this.albumSize,
        this.briefDesc,
        this.picId,
        this.alias,
        this.picUrl,
        this.followed,
        this.musicSize,
        this.trans,
        this.name,
        this.id,
        this.picIdStr,
        this.img1v1IdStr});
  
    AlbumArtist.fromJson(Map<String, dynamic> json) {
      img1v1Id = json['img1v1Id'];
      topicPerson = json['topicPerson'];
      img1v1Url = json['img1v1Url'];
      albumSize = json['albumSize'];
      briefDesc = json['briefDesc'];
      picId = json['picId'];
      alias = json['alias'].cast<String>();
      picUrl = json['picUrl'];
      followed = json['followed'];
      musicSize = json['musicSize'];
      trans = json['trans'];
      name = json['name'];
      id = json['id'];
      picIdStr = json['picId_str'];
      img1v1IdStr = json['img1v1Id_str'];
    }
  
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['img1v1Id'] = this.img1v1Id;
      data['topicPerson'] = this.topicPerson;
      data['img1v1Url'] = this.img1v1Url;
      data['albumSize'] = this.albumSize;
      data['briefDesc'] = this.briefDesc;
      data['picId'] = this.picId;
      data['alias'] = this.alias;
      data['picUrl'] = this.picUrl;
      data['followed'] = this.followed;
      data['musicSize'] = this.musicSize;
      data['trans'] = this.trans;
      data['name'] = this.name;
      data['id'] = this.id;
      data['picId_str'] = this.picIdStr;
      data['img1v1Id_str'] = this.img1v1IdStr;
      return data;
    }
  }
  
  class Info {
    CommentThread commentThread;
    bool liked;
    int resourceType;
    int resourceId;
    int commentCount;
    int likedCount;
    int shareCount;
    String threadId;
  
    Info(
        {this.commentThread,
        this.liked,
        this.resourceType,
        this.resourceId,
        this.commentCount,
        this.likedCount,
        this.shareCount,
        this.threadId});
  
    Info.fromJson(Map<String, dynamic> json) {
      commentThread = json['commentThread'] != null
          ? new CommentThread.fromJson(json['commentThread'])
          : null;
      liked = json['liked'];
      resourceType = json['resourceType'];
      resourceId = json['resourceId'];
      commentCount = json['commentCount'];
      likedCount = json['likedCount'];
      shareCount = json['shareCount'];
      threadId = json['threadId'];
    }
  
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      if (this.commentThread != null) {
        data['commentThread'] = this.commentThread.toJson();
      }
      data['liked'] = this.liked;
      data['resourceType'] = this.resourceType;
      data['resourceId'] = this.resourceId;
      data['commentCount'] = this.commentCount;
      data['likedCount'] = this.likedCount;
      data['shareCount'] = this.shareCount;
      data['threadId'] = this.threadId;
      return data;
    }
  }
  
  class CommentThread {
    String id;
    ResourceInfo resourceInfo;
    int resourceType;
    int commentCount;
    int likedCount;
    int shareCount;
    int hotCount;
    int resourceOwnerId;
    String resourceTitle;
    int resourceId;
  
    CommentThread(
        {this.id,
        this.resourceInfo,
        this.resourceType,
        this.commentCount,
        this.likedCount,
        this.shareCount,
        this.hotCount,
        this.resourceOwnerId,
        this.resourceTitle,
        this.resourceId});
  
    CommentThread.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      resourceInfo = json['resourceInfo'] != null
          ? new ResourceInfo.fromJson(json['resourceInfo'])
          : null;
      resourceType = json['resourceType'];
      commentCount = json['commentCount'];
      likedCount = json['likedCount'];
      shareCount = json['shareCount'];
      hotCount = json['hotCount'];
      resourceOwnerId = json['resourceOwnerId'];
      resourceTitle = json['resourceTitle'];
      resourceId = json['resourceId'];
    }
  
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      if (this.resourceInfo != null) {
        data['resourceInfo'] = this.resourceInfo.toJson();
      }
      data['resourceType'] = this.resourceType;
      data['commentCount'] = this.commentCount;
      data['likedCount'] = this.likedCount;
      data['shareCount'] = this.shareCount;
      data['hotCount'] = this.hotCount;
      data['resourceOwnerId'] = this.resourceOwnerId;
      data['resourceTitle'] = this.resourceTitle;
      data['resourceId'] = this.resourceId;
      return data;
    }
  }
  
  class ResourceInfo {
    int id;
    int userId;
    String name;
    String imgUrl;
  
    ResourceInfo({this.id, this.userId, this.name, this.imgUrl});
  
    ResourceInfo.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      userId = json['userId'];
      name = json['name'];
      imgUrl = json['imgUrl'];
    }
  
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['userId'] = this.userId;
      data['name'] = this.name;
      data['imgUrl'] = this.imgUrl;
      return data;
    }
  }
  