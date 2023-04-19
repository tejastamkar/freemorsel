class TrendingCampaning {
  String? id;
  String? image;
  String? title;
  String? organization;
  String? dateofdrive;
  String? venue;
  String? time;
  String? contact;
  String? campdetail;

  TrendingCampaning(this.id, this.image, this.title, this.organization,
      this.dateofdrive, this.venue, this.time, this.contact, this.campdetail);

  TrendingCampaning.fromMap(map) {
    id = map["id"];
    image = map["image"];
    title = map['title'];
    organization = map["organization"];
    dateofdrive = map["dateofdrive"];
    venue = map["venue"];
    time = map["time"];
    contact = map["contact"];
    campdetail = map["campdetail"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "image": image,
      "title": title,
      "organization": organization,
      "dateofdrive": dateofdrive,
      "venue": venue,
      "time": time,
      "contact": contact,
      "campdetail": campdetail,
    };
  }
}
