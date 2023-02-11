class PostCardModel {
  String? level, address, donationId, iteamName, name, userId, time;
  int? serves;
  List images = [];
  PostCardModel(this.level, this.serves, this.address, this.donationId,
      this.iteamName, this.name, this.userId, this.time);

  PostCardModel.fromMap(Map<String, dynamic> map) {
    level = map["Level"];
    serves = map["Serves"];
    address = map['address'];
    donationId = map["donationId"];
    userId = map["userid"];
    images = map["imgaes"];
    name = map["name"];
    iteamName = map["iteamName"];
    time = map["time"].toDate();
  }

  Map<String, dynamic> toMap() {
    return {
      "level": level,
      "serves": serves,
      "images": images,
      "address": address,
      "donationId": donationId,
      "userId": userId,
      "iteamName": iteamName,
      "userName": name,
      "time": time,
    };
  }
}
