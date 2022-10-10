import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thrid_flutter_note/main.dart';
import 'package:thrid_flutter_note/screens/note_reading_screen.dart';
import 'package:thrid_flutter_note/widgets/profile.dart';

class onboarding1 extends StatefulWidget {
  const onboarding1({Key? key}) : super(key: key);

  @override
  State<onboarding1> createState() => _onboarding1State();
}

class _onboarding1State extends State<onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8EEE2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                "NOTELY",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Image(
                height: 300,
                image: AssetImage(
                  "assets/Group1.png",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "World's Safest And Largest Digital Notebook",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Notely is the world's safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely.",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget onBoarding3Row(
  IconData icon,
  String text,
) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(text),
      ],
    ),
  );
}

// Widget onboardingTextFeild({
//   String hinttext = "",
//   String labeltext = "",
//   bool obt = false,
//   required TextEditingController controller,
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Text(labeltext),
//       ),
//       const SizedBox(height: 10),
//       TextField(
//         showCursor: !obt,
//         obscureText: obt,
//         textAlignVertical: TextAlignVertical.top,
//         decoration: InputDecoration(
//           // labelText: labeltext,
//           filled: true,
//           fillColor: Colors.white,
//           border: InputBorder.none,
//           hintText: hinttext,
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     ],
//   );
// }

InkWell onboardingContainer({
  required String text,
  Function()? ontap,
}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      width: double.infinity,
      height: 80,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
      ),
    ),
  );
}

class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  State<OnBoarding2> createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8EEE2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                "NOTELY",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Image(
                height: 300,
                image: AssetImage(
                  "assets/firebase.png",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "This app stores your notes in Google Firebase.",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Firebase is a development platform known originally for its realtime database that's still at its core a multi-node, key-value database .",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8EEE2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                "NOTELY",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Image(
                height: 300,
                image: AssetImage("assets/fb_auth.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "This app authenticates users with Firebase.",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Firebase is a development platform known originally for its realtime database that's still at its core a multi-node, key-value database .",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  AppTextField(
      {required this.hinttext,
      this.validatefunction,
      this.labeltext = "",
      this.obt = false,
      this.email = false,
      required this.controller,
      Key? key})
      : super(key: key);
  String? Function(String?)? validatefunction;
  String hinttext;
  String labeltext;
  bool obt;
  bool email;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(labeltext),
        ),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: email
              ? TextInputType.emailAddress
              : obt
                  ? TextInputType.number
                  : TextInputType.text,
          validator: validatefunction,
          controller: controller,
          showCursor: true,
          obscureText: obt,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            // labelText: labeltext,
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: hinttext,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
