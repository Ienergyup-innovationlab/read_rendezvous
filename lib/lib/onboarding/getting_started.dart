import 'package:book_app/constant/colour.dart';
import 'package:flutter/material.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColor.navyBlue,
        child: Column(
          children: [
            const Spacer(),
            GestureDetector(
              child: Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.20),
                    border: Border.all(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'Do you want to access Books?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.20),
                    border: Border.all(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Do you want to access Language?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: Container(
                width: 350,
                height: 50,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Login');
              },
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(child: Text('Get Started')),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
