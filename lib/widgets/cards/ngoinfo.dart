import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/models/trendingcamps_models.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';
import 'package:freemorsel/widgets/volunteerpopup.dart';
import 'package:url_launcher/url_launcher.dart';

class NgoInfo extends StatefulWidget {
  final TrendingCampaning campDetail;
  const NgoInfo({super.key, required this.campDetail});

  @override
  State<NgoInfo> createState() => _NgoInfoState();
}

class _NgoInfoState extends State<NgoInfo> {
  bool loader = true;
  // final TextEditingController _campdetails = TextEditingController();
  Future<void> _launchInBrowser() async {
    final Uri url0 = Uri.parse("https://www.freemorsel.com/");

    if (!await launchUrl(
      url0,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Donation Campaign",
            style: TextStyle(
              fontSize: 20,
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
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: widget.campDetail.image.toString(),
                height: 185,
                width: width - 60,
                key: UniqueKey(),
                cacheManager: customCacheManager,
                placeholder: (context, url) => Container(
                  height: 185,
                  width: width - 60,
                  color: primary2Color,
                ),
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
            Text(
              "Campaign Details",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primary3Color),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(widget.campDetail.campdetail.toString(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Location Details",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primary3Color),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Organized By : ${widget.campDetail.organization.toString()}",
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
              "Date of Campaign : ${widget.campDetail.dateofdrive.toString()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Timing : ${widget.campDetail.time.toString()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "For More Info Call On : \n${widget.campDetail.contact.toString()}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primary3Color),
            ),
            const SizedBox(height: 20),
            Text(
              "Volunteers Required !",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primary3Color),
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              children: [
                Text("Joined - 2",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                SizedBox(width: 50),
                Text("Required -7",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Apply ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                )),
            const SizedBox(height: 20),
            Text(
              "Donate for a Cause :)",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primary3Color),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          height: 48,
          child: ElevatedButton(
              onPressed: () => _launchInBrowser(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: primary2Color,
              ),
              child: const Text(
                "Donate",
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
