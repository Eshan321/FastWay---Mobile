import 'dart:async';
import 'package:Mobile_FastWay/Hospitals/Central.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class MobileCentral extends StatefulWidget {
  @override
  _MobileCentralState createState() => new _MobileCentralState();
}

final centralsReference = FirebaseDatabase.instance.reference().child('central');

class _MobileCentralState extends State<MobileCentral> {
  List<Central> items;
  StreamSubscription<Event> _onNoteAddedSubscription;
  StreamSubscription<Event> _onNoteChangedSubscription;

  @override
  void initState() {
    super.initState();

    items = new List();

    _onNoteAddedSubscription = centralsReference.onChildAdded.listen(_onNoteAdded);
    _onNoteChangedSubscription = centralsReference.onChildChanged.listen(_onNoteUpdated);
  }

  @override
  void dispose() {
    _onNoteAddedSubscription.cancel();
    _onNoteChangedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Way Database',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Admited Pation List/ Average(100)'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 15.0,
                            child: Text(
                              '${position +1}',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ],
                );
              }),
        ),

      ),
    );
  }

  void _onNoteAdded(Event event) {
    setState(() {
      items.add(new Central.fromSnapshot(event.snapshot));
    });
  }

  void _onNoteUpdated(Event event) {
    var oldNoteValue = items.singleWhere((note) => note.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldNoteValue)] = new Central.fromSnapshot(event.snapshot);
    });
  }

  
}
