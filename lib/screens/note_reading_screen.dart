import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thrid_flutter_note/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);

  QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc["color_id"];

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFF8EEE2),
        appBar: AppBar(
          backgroundColor: const Color(0XFFF8EEE2),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.doc["note_title"],
                style: AppStyle.mainTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.doc["note_time"],
                style: AppStyle.dateTitle,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.doc["note_content"],
                style: AppStyle.mainContent,
                // overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
