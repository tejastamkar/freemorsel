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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    image,
                    height: 185,
                    width: width - 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  width: width - 60,
                  height: 20,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
