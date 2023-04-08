import 'package:flutter/material.dart';
import 'package:freemorsel/provider/datepicker.dart';
import 'package:freemorsel/provider/locationprovider.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';

class OrganizeCamp extends StatefulWidget {
  const OrganizeCamp({super.key});

  @override
  State<OrganizeCamp> createState() => _OrganizeCampState();
}

class _OrganizeCampState extends State<OrganizeCamp> {
  final TextEditingController _campname = TextEditingController();
  final TextEditingController _campdetails = TextEditingController();
  final TextEditingController _campdate = TextEditingController();
  final TextEditingController _campaddress = TextEditingController();
  final TextEditingController _camptimings = TextEditingController();
  final TextEditingController _campphonenno = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Campaign Details",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: "Overpass"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Campaign Name",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Overpass",
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(
                          0x3f000000,
                        ), //New
                        blurRadius: 1.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextField(
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  controller: _campname,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Description",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Overpass",
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(
                          0x3f000000,
                        ), //New
                        blurRadius: 1.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextField(
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  controller: _campdetails,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Date of Campaign",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Overpass",
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(
                          0x3f000000,
                        ), //New
                        blurRadius: 1.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextField(
                  readOnly: true,
                  onTap: () => DatePicker().getDate(
                      context: context,
                      setDate: (date) => setState(
                            () => _campdate.text = date,
                          ),
                      before: false),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  controller: _campdate,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Venue",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Overpass",
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(
                          0x3f000000,
                        ), //New
                        blurRadius: 1.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: InkWell(
                      onTap: () async {
                        _campaddress.clear();
                        _campaddress.text = await getLoction(context: context);
                      },
                      child: Icon(
                        Icons.my_location,
                        color: primary2Color,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  controller: _campaddress,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Timing",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Overpass",
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(
                          0x3f000000,
                        ), //New
                        blurRadius: 1.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextField(
                  readOnly: true,
                  onTap: () => DatePicker().getTime(
                    context: context,
                    setDate: (time) => setState(
                      () => _camptimings.text = time,
                    ),
                  ),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  controller: _camptimings,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Contact",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Overpass",
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(
                          0x3f000000,
                        ), //New
                        blurRadius: 1.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  controller: _campphonenno,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Images of venue",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Overpass",
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(
                          0x3f000000,
                        ), //New
                        blurRadius: 1.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextField(
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            backgroundColor: primary3Color,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          ),
          child: const Text(
            'Add Campaign',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
