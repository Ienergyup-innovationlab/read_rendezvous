import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Utils/router.dart';
import '../../../constant/colour.dart';





class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // final log = getLogger('Splash');
  // final _navigator = locator<NavigationService>();
  double _logoValue = 0;
  double _ballValue = -100;

  double _logoLeft = 0;
  double _ballRight = 0;

  double _height = 300;
  double _width = 100;

  @override
  void initState() {
    _animate();
    super.initState();
  }

  _animate() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _logoValue = 200;
        _ballValue = 290;
      });
    }).whenComplete(
          () {
        Future.delayed(const Duration(milliseconds: 3000), () {
          setState(() {
            // _height = 400;
            // _width = 400;
            _logoLeft = -500;
            _ballRight = -500;
          });

          // Future.delayed(const Duration(milliseconds: 100), () {
          //   Routers.replace(context, const );
          // });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.bounceOut,
              top: _ballValue,
              left: 0,
              right: _ballRight,
              child: AnimatedContainer(

                duration: const Duration(milliseconds: 500),
                height: _height,
                width: _width,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0.5.w),
                      child: Image.asset('assets/logo.png'),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
