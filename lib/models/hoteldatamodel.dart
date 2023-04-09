class HotelDatamodel {
  String hotelName = "", owner = "", cover = "", id = "";
  DateTime timming = DateTime.now();
  List donationImage = [], hotelImage = [];

  HotelDatamodel(
      {required this.cover,
      required this.hotelImage,
      required this.id,
      required this.hotelName,
      required this.owner,
      required this.donationImage,
      required this.timming});

  HotelDatamodel.fromMap(Map<String, dynamic> map) {
    hotelImage.addAll(map["hotelImages"]);
    hotelName = map['hotelName'];
    owner = map["owner"];
    id = map["id"];
    donationImage = map["donation"];
    cover = map["cover"];
    timming = map["timing"].toDate();
  }
  Map<String, dynamic> toMap() {
    return {
      "hotelImage": hotelImage,
      "hotelName": hotelName,
      "id": id,
      "owner": owner,
      "donationImage": donationImage,
      "cover": cover,
      "timming": timming
    };
  }
}
