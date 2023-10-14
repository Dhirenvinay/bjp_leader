class PersonData {
  String? sId;
  String? name;
  String? urlSlug;
  List<AgendaHeads>? agendaHeads;
  FeatureCard? featureCard;
  FeatureCard2? featureCard2;
  List<FeatureVideos>? featureVideos;
  String? heroBanner;
  List<Updates>? updates;
  Bio? bio;
  WorkStats? workStats;
  List<Works>? works;
  List<PoliticalHistory>? politicalHistory;
  Present? present;

  PersonData(
      {this.sId,
      this.name,
      this.urlSlug,
      this.agendaHeads,
      this.featureCard,
      this.featureCard2,
      this.featureVideos,
      this.heroBanner,
      this.updates,
      this.bio,
      this.workStats,
      this.works,
      this.politicalHistory,
      this.present});

  PersonData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    urlSlug = json['urlSlug'];
    if (json['agendaHeads'] != null) {
      agendaHeads = <AgendaHeads>[];
      json['agendaHeads'].forEach((v) {
        agendaHeads!.add(new AgendaHeads.fromJson(v));
      });
    }
    featureCard = json['featureCard'] != null
        ? new FeatureCard.fromJson(json['featureCard'])
        : null;
    featureCard2 = json['featureCard2'] != null
        ? new FeatureCard2.fromJson(json['featureCard2'])
        : null;
    if (json['featureVideos'] != null) {
      featureVideos = <FeatureVideos>[];
      json['featureVideos'].forEach((v) {
        featureVideos!.add(new FeatureVideos.fromJson(v));
      });
    }
    heroBanner = json['heroBanner'];
    if (json['updates'] != null) {
      updates = <Updates>[];
      json['updates'].forEach((v) {
        updates!.add(new Updates.fromJson(v));
      });
    }
    bio = json['bio'] != null ? new Bio.fromJson(json['bio']) : null;
    workStats = json['workStats'] != null
        ? new WorkStats.fromJson(json['workStats'])
        : null;
    if (json['works'] != null) {
      works = <Works>[];
      json['works'].forEach((v) {
        works!.add(new Works.fromJson(v));
      });
    }
    if (json['politicalHistory'] != null) {
      politicalHistory = <PoliticalHistory>[];
      json['politicalHistory'].forEach((v) {
        politicalHistory!.add(new PoliticalHistory.fromJson(v));
      });
    }
    present =
        json['present'] != null ? new Present.fromJson(json['present']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['urlSlug'] = this.urlSlug;
    if (this.agendaHeads != null) {
      data['agendaHeads'] = this.agendaHeads!.map((v) => v.toJson()).toList();
    }
    if (this.featureCard != null) {
      data['featureCard'] = this.featureCard!.toJson();
    }
    if (this.featureCard2 != null) {
      data['featureCard2'] = this.featureCard2!.toJson();
    }
    if (this.featureVideos != null) {
      data['featureVideos'] =
          this.featureVideos!.map((v) => v.toJson()).toList();
    }
    data['heroBanner'] = this.heroBanner;
    if (this.updates != null) {
      data['updates'] = this.updates!.map((v) => v.toJson()).toList();
    }
    if (this.bio != null) {
      data['bio'] = this.bio!.toJson();
    }
    if (this.workStats != null) {
      data['workStats'] = this.workStats!.toJson();
    }
    if (this.works != null) {
      data['works'] = this.works!.map((v) => v.toJson()).toList();
    }
    if (this.politicalHistory != null) {
      data['politicalHistory'] =
          this.politicalHistory!.map((v) => v.toJson()).toList();
    }
    if (this.present != null) {
      data['present'] = this.present!.toJson();
    }
    return data;
  }
}
// class AgendaHead {
//   final String icon;
//   final String heading;
//   final String color;

//   AgendaHead(this.icon, this.heading, this.color);

//   factory AgendaHead.fromJson(Map<String, dynamic> json) {
//     return AgendaHead(
//       json["icon"] as String,
//       json["heading"] as String,
//       json["color"] as String,
//     );
//   }
// }

class AgendaHeads {
  String? icon;
  String? heading;
  String? color;

  AgendaHeads({this.icon, this.heading, this.color});

  AgendaHeads.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    heading = json['heading'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['heading'] = this.heading;
    data['color'] = this.color;
    return data;
  }
}

class FeatureCard {
  String? heading;
  String? subHeading;
  String? actionLabel;
  String? actionType;
  String? action;
  String? img;

  FeatureCard(
      {this.heading,
      this.subHeading,
      this.actionLabel,
      this.actionType,
      this.action,
      this.img});

  FeatureCard.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    subHeading = json['subHeading'];
    actionLabel = json['actionLabel'];
    actionType = json['actionType'];
    action = json['action'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heading'] = this.heading;
    data['subHeading'] = this.subHeading;
    data['actionLabel'] = this.actionLabel;
    data['actionType'] = this.actionType;
    data['action'] = this.action;
    data['img'] = this.img;
    return data;
  }
}

class FeatureCard2 {
  String? img;
  String? actionType;
  String? action;

  FeatureCard2({this.img, this.actionType, this.action});

  FeatureCard2.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    actionType = json['actionType'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['actionType'] = this.actionType;
    data['action'] = this.action;
    return data;
  }
}

class FeatureVideos {
  String? type;
  String? src;

  FeatureVideos({this.type, this.src});

  FeatureVideos.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['src'] = this.src;
    return data;
  }
}

class Updates {
  String? thumb;
  String? heading;
  String? createdAt;
  String? category;
  List<String>? tags;

  Updates({this.thumb, this.heading, this.createdAt, this.category, this.tags});

  Updates.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    heading = json['heading'];
    createdAt = json['createdAt'];
    category = json['category'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumb'] = this.thumb;
    data['heading'] = this.heading;
    data['createdAt'] = this.createdAt;
    data['category'] = this.category;
    data['tags'] = this.tags;
    return data;
  }
}

class Bio {
  String? name;
  String? gender;
  String? dob;
  String? profession;
  String? education;

  Bio({this.name, this.gender, this.dob, this.profession, this.education});

  Bio.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    dob = json['dob'];
    profession = json['profession'];
    education = json['education'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['profession'] = this.profession;
    data['education'] = this.education;
    return data;
  }
}

class WorkStats {
  int? total;
  int? done;
  int? underWork;
  int? workStartSoon;

  WorkStats({this.total, this.done, this.underWork, this.workStartSoon});

  WorkStats.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    done = json['done'];
    underWork = json['underWork'];
    workStartSoon = json['workStartSoon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['done'] = this.done;
    data['underWork'] = this.underWork;
    data['workStartSoon'] = this.workStartSoon;
    return data;
  }
}

class Works {
  String? title;
  String? startDate;
  String? endDate;
  int? budget;
  String? status;
  String? thumb;
  String? desc;
  String? link;

  Works(
      {this.title,
      this.startDate,
      this.endDate,
      this.budget,
      this.status,
      this.thumb,
      this.desc,
      this.link});

  Works.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    budget = json['budget'];
    status = json['status'];
    thumb = json['thumb'];
    desc = json['desc'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['budget'] = this.budget;
    data['status'] = this.status;
    data['thumb'] = this.thumb;
    data['desc'] = this.desc;
    data['link'] = this.link;
    return data;
  }
}

class PoliticalHistory {
  String? result;
  String? time;
  int? voteMargin;
  String? area;
  String? type;
  String? post;
  String? party;

  PoliticalHistory(
      {this.result,
      this.time,
      this.voteMargin,
      this.area,
      this.type,
      this.post,
      this.party});

  PoliticalHistory.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    time = json['time'];
    voteMargin = json['voteMargin'];
    area = json['area'];
    type = json['type'];
    post = json['post'];
    party = json['party'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['time'] = this.time;
    data['voteMargin'] = this.voteMargin;
    data['area'] = this.area;
    data['type'] = this.type;
    data['post'] = this.post;
    data['party'] = this.party;
    return data;
  }
}

class Present {
  String? party;
  String? area;
  Null? partyPost;
  bool? candidate;
  String? electionType;
  String? state;
  String? district;
  String? profilePhoto;
  String? status;
  String? electionDate;
  String? resultDate;
  String? voteMargin;

  Present(
      {this.party,
      this.area,
      this.partyPost,
      this.candidate,
      this.electionType,
      this.state,
      this.district,
      this.profilePhoto,
      this.status,
      this.electionDate,
      this.resultDate,
      this.voteMargin});

  Present.fromJson(Map<String, dynamic> json) {
    party = json['party'];
    area = json['area'];
    partyPost = json['partyPost'];
    candidate = json['candidate'];
    electionType = json['electionType'];
    state = json['state'];
    district = json['district'];
    profilePhoto = json['profilePhoto'];
    status = json['status'];
    electionDate = json['electionDate'];
    resultDate = json['resultDate'];
    voteMargin = json['voteMargin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['party'] = this.party;
    data['area'] = this.area;
    data['partyPost'] = this.partyPost;
    data['candidate'] = this.candidate;
    data['electionType'] = this.electionType;
    data['state'] = this.state;
    data['district'] = this.district;
    data['profilePhoto'] = this.profilePhoto;
    data['status'] = this.status;
    data['electionDate'] = this.electionDate;
    data['resultDate'] = this.resultDate;
    data['voteMargin'] = this.voteMargin;
    return data;
  }
}
