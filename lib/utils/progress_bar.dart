import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(left: 70, right: 70),
      child:  Center(
        child: SpinKitSpinningLines(
          color: color,
          size: 50,
        ),
      ),
    );
  }
}