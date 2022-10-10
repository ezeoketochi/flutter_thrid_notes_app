import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thrid_flutter_note/screens/sign_in.dart';
import 'package:thrid_flutter_note/widgets/create_a_note.dart';
import 'package:thrid_flutter_note/widgets/onboardingwidgets.dart';
import 'package:thrid_flutter_note/widgets/subscribe.dart';
import 'package:firebase_auth/firebase_auth.dart';

class createAccount extends StatefulWidget {
  const createAccount({Key? key}) : super(key: key);
  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final scaffoldkey = GlobalKey<ScaffoldState>();

    firebaseFunction() async {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          fullnameController.text.isNotEmpty) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

          final String userID = FirebaseAuth.instance.currentUser!.uid;
          FirebaseFirestore.instance.collection("users").doc(userID).set(
            {
              "fullname": fullnameController.text,
              "password": passwordController.text,
            },
          );
          const snackbar = SnackBar(content: Text("Sign-Up Successful"));
          scaffoldkey.currentState!.showSnackBar(snackbar);
          // debugPrint("uid is ${userID.toString()}");

          Timer(const Duration(seconds: 2), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            );
          });

          emailController.clear();
          passwordController.clear();
          fullnameController.clear();
        } on FirebaseAuthException catch (e) {
          final alert1 = AlertDialog(
            content: Text(e.message!),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Try again"),
              ),
            ],
          );
          showDialog(context: context, builder: (x) => alert1);
        } catch (e) {
          final alert2 = AlertDialog(
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Try again"),
              ),
            ],
          );
          showDialog(context: context, builder: (x) => alert2);
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: const Color(0XFFF8EEE2),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0XFFF8EEE2),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const Text(
                    "NOTELY",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Create a free account",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Join Notely for free. Create and share unlimited notes with your friends.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  // onboardingTextFeild
                  AppTextField(
                    controller: fullnameController,
                    hinttext: "Ezeoke Tochi",
                    labeltext: "Full Name",
                    validatefunction: (value) {
                      if (value!.isEmpty) {
                        return "Cannot be Empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // onboardingTextFeild

                  AppTextField(
                    email: true,
                    controller: emailController,
                    hinttext: "tochioluebube.com",
                    labeltext: "Email Address",
                    validatefunction: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return "Enter valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // onboardingTextFeild
                  AppTextField(
                    controller: passwordController,
                    hinttext: "* * * * * * * *",
                    labeltext: "Password",
                    obt: true,
                    validatefunction: (value) {
                      if (value!.isEmpty) {
                        return "You need a password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  onboardingContainer(
                    text: "Create Account",
                    ontap: () {
                      if (formkey.currentState!.validate()
                          // ||
                          //     FirebaseAuth.instance.currentUser == null
                          ) {
                        firebaseFunction();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
