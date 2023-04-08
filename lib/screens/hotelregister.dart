import 'package:flutter/material.dart';
import 'package:freemorsel/provider/datepicker.dart';
import 'package:freemorsel/provider/locationprovider.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';

class RegisterHotel extends StatefulWidget {
  const RegisterHotel({super.key});

  @override
  State<RegisterHotel> createState() => _RegisterHotelState();
}

class _RegisterHotelState extends State<RegisterHotel> {
  final TextEditingController _hotelname = TextEditingController();
  final TextEditingController _ownername = TextEditingController();
  final TextEditingController _hotelphoneno = TextEditingController();
  final TextEditingController _hoteladdress = TextEditingController();
  final TextEditingController _hoteltimings = TextEditingController();
  final TextEditingController _hotelgstnno = TextEditingController();
  final TextEditingController _hotelfssaino = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        // automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Register your Hotel/Restaurant",
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
                "Name of Hotel/Restaurant",
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
                height: 45,
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
                  controller: _hotelname,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Name of Owner",
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
                height: 45,
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
                  controller: _ownername,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Contact no.",
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
                height: 45,
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
                  controller: _hotelphoneno,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Address",
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
                // height: 45,
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
                        _hoteladdress.clear();
                        _hoteladdress.text = await getLoction(context: context);
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
                  controller: _hoteladdress,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Timings",
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
                // height: 45,
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
                    setDate: (date) => setState(
                      () => _hoteltimings.text = date,
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
                  controller: _hoteltimings,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "GSTN no.",
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
                // height: 45,
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
                  keyboardType: TextInputType.number,
                  controller: _hotelgstnno,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "FSSAI no.",
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
                // height: 45,
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
                  controller: _hotelfssaino,
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
            'Register',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
