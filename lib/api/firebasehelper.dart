import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freemorsel/models/trendingcamps_models.dart';

class FirebaseHelper {
  static Future<TrendingCampaning?> getCampDetailModel(
      {required String id}) async {
    TrendingCampaning? campDetail;
    DocumentSnapshot docSnap = await FirebaseFirestore.instance
        .collection("TrendingCampaigns")
        .doc(id)
        .get();
    if (docSnap.data() != null) {
      campDetail =
          TrendingCampaning.fromMap(docSnap.data() as Map<String, dynamic>);
    }
    return campDetail;
  }
}
