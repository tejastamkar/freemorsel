import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemorsel/api/userdetails.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/widgets/profileselector.dart';

class EditProfile extends StatefulWidget {
  final Function refresh;
  const EditProfile({Key? key, required this.refresh}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _userName = TextEditingController(),
      _email = TextEditingController(),
      _phoneNo = TextEditingController();

  @override
  void initState() {
    setState(() {
      _userName.text = username;
      _phoneNo.text = phoneNum;
      _email.text = email;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Edit Profile",
            style: TextStyle(
              fontSize: 25,
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
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (context) => ProfileSelector(
                        goback: () {
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
              child: SvgPicture.asset(
                "assets/profileavatar/avatar-$profilePicSelector.svg",
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.shade500),
                      left: BorderSide(color: Colors.grey.shade500),
                      right: BorderSide(color: Colors.grey.shade500),
                      top: BorderSide(color: Colors.grey.shade500)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'User Name',
                        style: TextStyle(
                            color: Color.fromRGBO(1, 1, 1, 0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      TextField(
                        scrollPadding: const EdgeInsets.all(1),
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        controller: _userName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.shade500),
                      left: BorderSide(color: Colors.grey.shade500),
                      right: BorderSide(color: Colors.grey.shade500),
                      top: BorderSide(color: Colors.grey.shade500)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mobile No',
                        style: TextStyle(
                            color: Color.fromRGBO(1, 1, 1, 0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      TextField(
                        scrollPadding: const EdgeInsets.all(1),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        controller: _phoneNo,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.shade500),
                      left: BorderSide(color: Colors.grey.shade500),
                      right: BorderSide(color: Colors.grey.shade500),
                      top: BorderSide(color: Colors.grey.shade500)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email Id',
                        style: TextStyle(
                            color: Color.fromRGBO(1, 1, 1, 0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      TextField(
                        scrollPadding: const EdgeInsets.all(1),
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        controller: _email,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          ),
          child: const Text(
            'Save',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          onPressed: () async {
            await UserDetails()
                .updateUerDetails(
                    context: context,
                    profileSelector: profilePicSelector,
                    userName: _userName.text,
                    email: _email.text)
                .then((value) async {
              await UserDetails().getUserDetails(context: context);
            });
            widget.refresh();
          },
        ),
      ),
    );
  }
}
