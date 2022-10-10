import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thrid_flutter_note/screens/note_reading_screen.dart';
import 'package:thrid_flutter_note/screens/note_editor.dart';
import 'package:thrid_flutter_note/screens/onboardingscreen.dart';
import 'package:thrid_flutter_note/style/app_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrid_flutter_note/widgets/note_card.dart';
// import 'package:thrid_flutter_note/widgets/onboardingwidgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterbase_notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnBoardingScreen(),
    );
  }
}

class NotesDisplay extends StatefulWidget {
  const NotesDisplay({Key? key}) : super(key: key);

  @override
  State<NotesDisplay> createState() => _NotesDisplayState();
}

class _NotesDisplayState extends State<NotesDisplay> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  final scaffoldkey = GlobalKey<ScaffoldState>();

  dynamic Function()? delete(QueryDocumentSnapshot not) {
    (showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Log-out"),
        content: const Text("LOG OUT and go to login screen"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("NO"),
          ),
          TextButton(
            onPressed: () async {
              (FirebaseAuth.instance.currentUser != null)
                  ? () {
                      String noteid = not.id;
                      FirebaseFirestore.instance
                          .collection(uid)
                          .doc(noteid)
                          .delete();
                    }
                  : null;
            },
            child: const Text("YES"),
          ),
        ],
      ),
    ));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: const Color(0XFFF8EEE2),
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          title: const Text(
            "Recent Notes",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          // actions: const [
          //   Icon(
          //     Icons.search,
          //     color: Colors.black,
          //   ),
          // ],
          centerTitle: true,
          backgroundColor: const Color(0XFFF8EEE2),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("Long Press any note to delete"),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection(uid).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Text("No data");
                  }

                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: snapshot.data!.docs
                          .map(
                            (not) => noteCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) =>
                                        NoteReaderScreen(not)),
                                  ),
                                );
                              },
                              doc: not,
                              onLongPress: () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Delete Selected Note?"),
                                    content: const Text("Are you sure?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: const Text("NO"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          String noteid = not.id;
                                          FirebaseFirestore.instance
                                              .collection(uid)
                                              .doc(noteid)
                                              .delete();
                                          Navigator.of(context).pop(true);

                                          final snackbar = SnackBar(
                                              content:
                                                  Text("Deleted Successfully"));
                                          scaffoldkey.currentState!
                                              .showSnackBar(snackbar);
                                        },
                                        child: const Text("YES"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),
                    );
                  }
                  return Text(
                    "No notes",
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                    ),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const NoteEditorScreen()),
              ),
            );
          },
          tooltip: "click to add new note",
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
