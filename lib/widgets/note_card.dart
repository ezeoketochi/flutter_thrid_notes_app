import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thrid_flutter_note/style/app_style.dart';

Widget noteCard(
    {Function()? onTap,
    Function()? onLongPress,
    required QueryDocumentSnapshot doc}) {
  int colornumber = doc["color_id"];
  return Expanded(
    child: InkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: BoxDecoration(color: AppStyle.cardsColor[colornumber]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              doc["note_title"],
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              doc["note_time"],
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              doc["note_content"],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ),
  );
}
