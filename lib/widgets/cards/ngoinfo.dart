import 'package:flutter/material.dart';
import 'package:freemorsel/api/userdetails.dart';
import 'package:freemorsel/theme/deftheme.dart';
import 'package:freemorsel/widgets/volunteerpopup.dart';

class NgoInfo extends StatefulWidget {
  final TrendingCampaning campDetail;
  const NgoInfo({super.key, required this.campDetail});

  @override
  State<NgoInfo> createState() => _NgoInfoState();
}

class _NgoInfoState extends State<NgoInfo> {
  bool loader = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Donation Drive",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                widget.campDetail.image.toString(),
                height: 185,
                width: width - 60,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                widget.campDetail.title.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const Text(
              "Your Help Means A Lot To Them",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Organized By : ${widget.campDetail.organization.toString()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Date of Drive : ${widget.campDetail.dateofdrive.toString()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Venue : ${widget.campDetail.venue.toString()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Between : ${widget.campDetail.time.toString()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "For More Info Call On : \n${widget.campDetail.contact.toString()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SizedBox(
          height: 48,
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const Volunteer(),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: primary2Color,
              ),
              child: const Text(
                "Apply For Volunteer",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              )),
        ),
      ),
    );
  }
}
