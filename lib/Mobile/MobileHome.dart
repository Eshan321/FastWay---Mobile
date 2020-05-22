import 'package:Mobile_FastWay/Mobile/MobileCentral.dart';
import 'package:Mobile_FastWay/Mobile/MobileKalubovila.dart';
import 'package:flutter/material.dart';

class MobileHome extends StatefulWidget {
  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Way Home',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fast Way Home'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
                color: Colors.blue[700],
                onPressed: navigateToKalubovila,
                child: Text('Kalubovila Hospital', style: TextStyle(fontSize: 20.0, color: Colors.white)),
           ),
           SizedBox(height: 10.0),
           RaisedButton(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
                color: Colors.blue[700],
                onPressed: navigateToCentral,
                child: Text('Central Hospital', style: TextStyle(fontSize: 20.0, color: Colors.white)),
           ),
           SizedBox(height: 10.0),
           RaisedButton(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
                color: Colors.blue[700],
                onPressed: (){},
                child: Text('Jayawardanapura Hospital', style: TextStyle(fontSize: 20.0, color: Colors.white)),
           ),
           SizedBox(height: 10.0),
           RaisedButton(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
                color: Colors.blue[700],
                onPressed: (){},
                child: Text('Homagama Hospital', style: TextStyle(fontSize: 20.0, color: Colors.white)),
           ),
          ],
        ),
      )
    );
  }
  void navigateToKalubovila(){
     Navigator.push(context,MaterialPageRoute(builder: (context) => MobileKalubovila(),fullscreenDialog: false));
   }

   void navigateToCentral(){
     Navigator.push(context,MaterialPageRoute(builder: (context) => MobileCentral(),fullscreenDialog: false));
   }
}