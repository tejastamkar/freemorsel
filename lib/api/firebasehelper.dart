import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freemorsel/models/trendingcamps_models.dart';

class FirebaseHelper {
  Future<TrendingCampaning?> getCampDetailModel({required String id}) async {
    TrendingCampaning? campDetail;
    DocumentSnapshot docSnap = await FirebaseFirestore.instance
        .collection("TrendingCampaigns")
        .doc(id)
        .get();
    if (docSnap.data() != null) {
      List temp = [];
      temp.add(docSnap.data());
      for (var tempData in temp) {
        campDetail = TrendingCampaning.fromMap(tempData);
      }
    }
    return campDetail;
  }
}
