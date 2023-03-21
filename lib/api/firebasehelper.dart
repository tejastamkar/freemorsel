import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freemorsel/models/trendingcamps_models.dart';

class FirebaseHelper {
  Future<TrendingCampaning?> getCampDetailModel({required String id}) async {
    TrendingCampaning? campDetail;
    await FirebaseFirestore.instance
        .collection("TrendingCampaigns")
        .doc(id)
        .get()
        .then((value) {
      campDetail = TrendingCampaning.fromMap(value.data());
      return campDetail;
    });

    return campDetail;
  }
}
