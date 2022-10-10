import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thrid_flutter_note/main.dart';
import 'package:thrid_flutter_note/screens/sign_in.dart';
import 'package:thrid_flutter_note/widgets/onboardingwidgets.dart';
import 'package:thrid_flutter_note/widgets/profile.dart';

class CreateANote extends StatefulWidget {
  const CreateANote({Key? key}) : super(key: key);

  @override
  State<CreateANote> createState() => _CreateANoteState();
}

class _CreateANoteState extends State<CreateANote> {
  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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

    Future<bool> willpopscope() async {
      return await (showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Log-out"),
          content: const Text("LOG OUT and go to login screen"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("NO"),
            ),
            TextButton(
              onPressed: () async {
                (FirebaseAuth.instance.currentUser != null)
                    ? await FirebaseAuth.instance.signOut().then(
                        (value) {
                          final snackbar =
                              SnackBar(content: Text("Sign-Out Successful"));
                          scaffoldkey.currentState!.showSnackBar(snackbar);
                          Timer(const Duration(seconds: 1), () {
                            Navigator.of(context).pop(true);
                          });
                        },
                      )
                    : null;
              },
              child: const Text("YES"),
            ),
          ],
        ),
      ));
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: willpopscope,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const Profile()),
                          ),
                        );
                      },
                    ),
                    const Text(
                      "All Notes",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _signOut();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Image(
                  image: AssetImage(
                    "assets/Group2.png",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Create Your First Note",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Add a note about anything (your thoughts on climate change, or your history essay) and share it with the world.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                onboardingContainer(
                  text: "Create A Note",
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const NotesDisplay()),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
