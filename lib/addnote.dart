import 'package:flutter/material.dart';

class addNote extends StatelessWidget {
  String userNote;
  // Start here
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appbar
        appBar: AppBar(title: Text('Add a note'), centerTitle: true),

        // body
        // PADDING IS A WIDGET EVERYTHING ELSE GOES INSIDE IT!!!!!
        body: Padding(

          // pad edges by 20p
          padding: EdgeInsets.all(20),


        ),
      ),
    );
  }


}