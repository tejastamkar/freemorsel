import 'package:flutter/material.dart';
import 'package:freemorsel/api/firebasehelper.dart';
import 'package:freemorsel/widgets/cards/ngoinfo.dart';

class CarouselCards extends StatelessWidget {
  final double width;
  final String image, title, id;
  const CarouselCards(
      {Key? key,
      required this.width,
      required this.image,
      required this.title,
      required this.id})
      : super(key: key);

  // openCampDetail({required contex}) async {
  //   await FirebaseHelper.getUserModelById(id: id)
  //       .then((campDetail) => Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //             builder: (context) => NgoInfo(
  //                   campDetail: campDetail,
  //                 )),
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        print(id);
        await FirebaseHelper()
            .getCampDetailModel(id: id)
            .then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NgoInfo(
                            campDetail: value!,
                          )),
                ));
      },
      child: Card(
        elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: BorderSide(width: 0.4, color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    image,
                    height: width/2.5,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    width: width,
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
