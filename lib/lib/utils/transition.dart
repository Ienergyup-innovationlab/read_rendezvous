import 'package:flutter/cupertino.dart';

Route createRoute(
  Widget pageRoute,
) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => pageRoute,
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.bounceInOut;

      // var tween =
      //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

Route slideTransition(
  Widget pageRoute,
) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => pageRoute,
    transitionDuration: const Duration(milliseconds: 700),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeOutQuad;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route slideRight(
  Widget pageRoute,
) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => pageRoute,
    transitionDuration: const Duration(milliseconds: 700),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset(0.0, 0.0);
      const curve = Curves.easeOutQuad;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
