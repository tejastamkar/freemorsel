class PostCardModel {
  String? address, donationId, iteamName, name, userId, status, typeofDonation;
  int? serves, size, level;
  List images = [];
  DateTime time = DateTime.now();
  PostCardModel(
      this.level,
      this.serves,
      this.address,
      this.donationId,
      this.status,
      this.iteamName,
      this.name,
      this.typeofDonation,
      this.userId,
      this.time,
      this.size);

  PostCardModel.fromMap(Map<String, dynamic> map) {
    level = map["Level"];
    serves = map["Serves"];
    size = map["SizeOfGood"];
    status = map["Status"];
    time = map["Time"].toDate();
    typeofDonation = map["TypeOfDonation"];
    address = map['address'];
    donationId = map["donationId"];
    iteamName = map["foodName"];
    images = map["images"];
    name = map["name"];
    userId = map["userid"];
  }

  Map<String, dynamic> toMap() {
    return {
      "level": level,
      "serves": serves,
      "size": size,
      "status": status,
      "time": time,
      "typeofDonation": typeofDonation,
      "address": address,
      "donationId": donationId,
      "iteamName": iteamName,
      "images": images,
      "userId": userId,
      "userName": name,
    };
  }
}
