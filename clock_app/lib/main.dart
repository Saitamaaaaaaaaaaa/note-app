import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Note App",
    home: NoteApp(),
  ));
}

class NoteApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NoteAppState();
  }
}

class _NoteAppState extends State<NoteApp> {
  String addNote = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Add note",
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 50.0,
                    width: double.infinity,
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: "Enter Text",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        onSubmitted: (String userInput) {
                          setState(() {
                            addNote = userInput;
                          });

                          Container(
                            height: 100.0,
                            color: Colors.green,
                            child: getNoteListView(),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    " $addNote",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Container(
                    height: 50.0,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          addNote = addNote;
                        });
                      },
                      color: Color(0xffE85050),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Container(
                          constraints: BoxConstraints(
                              maxWidth: double.infinity, maxHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 100.0,
                    color: Colors.amber,
                    child: getNoteListView(),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

Widget getNoteListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        title: Text("Notes"),
        trailing: Icon(
          Icons.delete,
          color: Color(0xffE85050),
        ),
        onTap: () {},
      ),
    ],
  );
  return listView;
}
