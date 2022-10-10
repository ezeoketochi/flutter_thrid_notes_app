import "package:flutter/material.dart";
import 'package:thrid_flutter_note/screens/create_account.dart';
import 'package:thrid_flutter_note/widgets/onboardingwidgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thrid_flutter_note/widgets/subscribe.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFF8EEE2),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: const [
                  onboarding1(),
                  OnBoarding2(),
                  OnBoarding3(),
                ],
              ),
            ),
            SmoothPageIndicator(
              effect: WormEffect(
                activeDotColor: Colors.red,
                dotColor: Colors.red.shade100,
                dotHeight: 10,
                dotWidth: 9,
                radius: 0,
              ),
              controller: controller,
              count: 3,
            ),
            const SizedBox(
              height: 10,
            ),
            onboardingContainer(
                text: "GET STARTED",
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const createAccount()),
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
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
            // )
          ],
        ),
      ),
    );
  }
}
