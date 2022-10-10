import 'package:flutter/material.dart';
import 'package:thrid_flutter_note/widgets/create_a_note.dart';
import 'package:thrid_flutter_note/widgets/onboardingwidgets.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({Key? key}) : super(key: key);

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  double width = 1;

  @override
  Widget build(BuildContext context) {
    InkWell onboarding3Container({
      required Function()? ontap,
      required String text1,
      required String text2,
      required String text3,
      required BoxBorder border,
    }) {
      return InkWell(
        onTap: ontap,
        child: Container(
          // margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: border,
            // : Border.all(color: Colors.transparent),
          ),
          child: Column(
            children: [
              Text(
                text1,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                text2,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(text3),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFF8EEE2),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Notely Premium",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Image(
                    image: AssetImage(
                      "assets/Group.png",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Start Using Notely with Premium Benefits",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  onBoarding3Row(
                    Icons.check,
                    "Save unlimited notes to a single project",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  onBoarding3Row(
                    Icons.check,
                    "Create unlimited projects and teams",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  onBoarding3Row(
                    Icons.check,
                    "Daily backups to keep your data safe",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: onboarding3Container(
                            border: width == 1
                                ? Border.all(
                                    color: Colors.red,
                                    width: 5,
                                  )
                                : Border.all(
                                    color: Colors.transparent,
                                  ),
                            text1: "Annual",
                            text2: "\$79.99",
                            text3: "Per year",
                            ontap: () {
                              setState(() {
                                width = 1;
                              });
                            }),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: onboarding3Container(
                          border: width == 5
                              ? Border.all(
                                  color: Colors.red,
                                  width: width,
                                )
                              : Border.all(
                                  color: Colors.transparent,
                                ),
                          text1: "Monthly",
                          text2: "\$7.99",
                          text3: "Per month",
                          ontap: () {
                            setState(() {
                              width = 5;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  onboardingContainer(
                    text: "SUBSCRIBE",
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const CreateANote()),
                        ),
                      );
                    },
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Center(
                  //     child: Text(
                  //       "Already have an account?",
                  //       style: TextStyle(
                  //         color: Colors.red,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
