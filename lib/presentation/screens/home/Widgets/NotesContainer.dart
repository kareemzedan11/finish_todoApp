import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/core/utiles/colors_Manager.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotesContainer extends StatelessWidget {
  final String title;
  final String time;
  final bool isDone;
  final VoidCallback? onComplete;

  const NotesContainer({
    required this.title,
    required this.time,
    required this.isDone,
    this.onComplete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      height: 115,
      width: double.infinity,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              child: VerticalDivider(
                thickness: 5,
                color:     isDone?Colors.green: ColorsManager.BlueColor,
                width: 30,
                endIndent: 10,
                indent: 10,
              ),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color:  isDone?Colors.green: ColorsManager.BlueColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
            Spacer(),
            isDone
                ? Text(
            "${   AppLocalizations.of(context)!.doneButton}!",
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
                : ElevatedButton(
              style: ButtonStyle(

              ),
              onPressed: onComplete,
              child: Icon(
                Icons.check,
                size: 30,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
