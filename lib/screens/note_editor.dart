import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thrid_flutter_note/style/app_style.dart';
import 'package:intl/intl.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = DateFormat('yyyy-MM-dd : kk:mm').format(now).toString();
    int colorId = Random().nextInt(AppStyle.cardsColor.length);

    String uid = FirebaseAuth.instance.currentUser!.uid;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFF8EEE2),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: const Color(0XFFF8EEE2),
          elevation: 0,
          title: const Text(
            "Add a new Note",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note Title",
                ),
                style: AppStyle.mainTitle,
              ),
              Text(
                date,
                style: AppStyle.dateTitle,
              ),
              const SizedBox(
                height: 28,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: mainController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note Content",
                ),
                style: AppStyle.mainContent,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            FirebaseFirestore.instance.collection(uid).add({
              "note_title": titleController.text,
              "note_time": date,
              "note_content": mainController.text,
              "color_id": colorId,
            }).then((value) {
              debugPrint(value.id);
              Navigator.pop(context);
            }).catchError(
                (error) => debugPrint("Failed to add new Notes due to $error"));
          },
          backgroundColor: AppStyle.accentColor,
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
