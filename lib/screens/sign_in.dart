import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thrid_flutter_note/screens/create_account.dart';
import 'package:thrid_flutter_note/widgets/create_a_note.dart';
import 'package:thrid_flutter_note/widgets/onboardingwidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final scaffoldkey = GlobalKey<ScaffoldState>();

    firebaseSignIn() async {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        try {
          final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
          final snackbar = SnackBar(content: Text("Login Successful"));
          scaffoldkey.currentState!.showSnackBar(snackbar);

          Timer(const Duration(seconds: 1), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateANote(),
              ),
            );
          });

          debugPrint("user id is ${FirebaseAuth.instance.currentUser?.uid}");

          emailController.clear();
          passwordController.clear();
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
                  child: const Text("Try again"))
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
                    "Login to your Notely Account",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    email: true,
                    controller: emailController,
                    hinttext: "tochioluebube.com",
                    labeltext: "Email Address",
                    validatefunction: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return "Invalid Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    controller: passwordController,
                    hinttext: "* * * * * * * *",
                    labeltext: "Password",
                    obt: true,
                    validatefunction: (value) {
                      if (value!.isEmpty) {
                        return "password cannot be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    color: const Color(0XFFF8EEE2),
                    height: 180,
                    child: Column(
                      children: [
                        onboardingContainer(
                          text: "Sign In",
                          ontap: () {
                            debugPrint(
                                "user id is ${FirebaseAuth.instance.currentUser?.uid}");
                            if (formkey.currentState!.validate()
                                // &&
                                //     FirebaseAuth.instance.currentUser?.uid ==
                                //         null

                                ) {
                              firebaseSignIn();
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
                                    builder: (context) => const createAccount(),
                                  ),
                                );
                              },
                              child: const Text(
                                "New to Notely?",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

// class AppTextField extends StatelessWidget {
//   AppTextField(
//       {required this.hinttext,
//       this.labeltext = "",
//       this.obt = false,
//       required this.controller,
//       Key? key})
//       : super(key: key);

//   String hinttext;
//   String labeltext = "";
//   bool obt = false;
//   TextEditingController controller;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Text(labeltext),
//         ),
//         const SizedBox(height: 5),
//         TextField(
//           controller: controller,
//           showCursor: !obt,
//           obscureText: obt,
//           textAlignVertical: TextAlignVertical.top,
//           decoration: InputDecoration(
//             // labelText: labeltext,
//             filled: true,
//             fillColor: Colors.white,
//             border: InputBorder.none,
//             hintText: hinttext,
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide.none,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide.none,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
