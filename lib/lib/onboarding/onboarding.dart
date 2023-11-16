import 'package:book_app/constant/colour.dart';
import 'package:book_app/lib/onboarding/getting_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller1 = PageController();
  final controller2 = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller1.dispose;
    controller2.dispose;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String onboardingText =
        'Language is what makes us human. It is how\npeople communicate. By learning a language,\nit means you have mastered a complex system\nof words, structure, and grammar to effectively\ncommunicate with others. To most people,\nlanguage comes naturally.';
    return Scaffold(
      body: Container(
        color: AppColor.navyBlue,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: double.infinity,
            height: 580,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 1;
                  });
                },
                controller: controller1,
                children: [
                  Image.asset('assets/translation_img.png'),
                  Image.asset('assets/onboarding_img2.png'),
                ]),
          ),
          SizedBox(
            width: 370,
            height: 180,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 1;
                });
              },
              controller: controller2,
              children: const [
                Column(
                  children: [
                    SizedBox(height: 50),
                    SizedBox(
                      width: 370,
                      child: Text(
                        onboardingText,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            height: 1.4,
                            fontSize: 15,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Text('Book Enthusiasts!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                          'A world of book enthusiasts with\ncommon qualities to share',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 45),
          SizedBox(
            width: 370,
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: controller1,
                  count: 2,
                  effect: WormEffect(
                      dotWidth: 11,
                      dotHeight: 11,
                      dotColor: Colors.white.withOpacity(0.30),
                      activeDotColor: Colors.white,
                      spacing: 10),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      isLastPage
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GettingStarted()))
                          : controller1.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                      controller2.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn);
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
