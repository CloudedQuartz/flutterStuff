import 'package:flutter/material.dart';


class StartNotes extends StatefulWidget {
  @override
  AddNote createState() => AddNote();
}
class AddNote extends State<StartNotes> {
  // Copypasta form from flutter docs
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  // note user wants to enter
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