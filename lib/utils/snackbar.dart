import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarPopUp extends StatelessWidget {
  SnackBarPopUp({Key? key, required this.message} ) : super(key: key);
  final String message;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      padding: EdgeInsets.all(10.0),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
