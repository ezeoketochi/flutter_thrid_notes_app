import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thrid_flutter_note/screens/sign_in.dart';
// import 'package:';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String uid = "";
  String fullname = "";

  final scaffoldkey = GlobalKey<ScaffoldState>();

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then(
      (value) {
        final snackbar = SnackBar(content: Text("Sign-Out Successful"));
        scaffoldkey.currentState!.showSnackBar(snackbar);
        Timer(const Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInPage(),
            ),
          );
        });
      },
    );
  }

  // imagepicker() async {
  //   // await ImagePicker().pickImage();
  // }

  firebaseFunction() async {
    uid = FirebaseAuth.instance.currentUser!.uid;

    final docs =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    setState(() {
      fullname = docs.data()!["fullname"];
    });
  }

  @override
  void initState() {
    firebaseFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("uid is $uid");

    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: const Color(0XFFF8EEE2),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const CircleAvatar(
                backgroundColor: Color(
                  0XFFE5D5C5,
                ),
                radius: 100,
                child: Image(
                  image: AssetImage(
                    "assets/girl.png",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                fullname,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Lucknow, India",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              // const ProfileRow(
              //   icon: Icons.workspace_premium_sharp,
              //   text: "You'v offered me the internship position right?",
              // ),
              InkWell(
                onTap: () {
                  _signOut();
                },
                child: const ProfileRow(
                  icon: Icons.abc_outlined,
                  text: "Log Out",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({required this.icon, required this.text, Key? key})
      : super(key: key);

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.white,
          ),
          child: Icon(
            icon,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        SizedBox(
          width: 100,
          child: Text(text),
        ),
        const SizedBox(
          width: 120,
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
        )
      ],
    );
  }
}
