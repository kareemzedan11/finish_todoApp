import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextAppbar extends StatelessWidget {
    TextAppbar({super.key,required this.text});
String text ;
  @override
  Widget build(BuildContext context) {
    return  Text(
text ,
    style: TextStyle(

    fontSize: 30,
    fontWeight: FontWeight.bold,
    ),
    );
  }
}
