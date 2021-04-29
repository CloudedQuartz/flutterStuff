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

  // If a Scaffold.key is specified, the ScaffoldState can be directly
// accessed without first obtaining it from a BuildContext via
// Scaffold.of. From the key, use the GlobalKey.currentState
// getter. This was previously used to manage SnackBars.
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  // note user wants to enter
  String userNote;

  // Start here
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: Scaffold(

        // appbar
        appBar: AppBar(title: Text('Notes'), centerTitle: true),

        // body
        // PADDING IS A WIDGET EVERYTHING ELSE GOES INSIDE IT!!!!!
        body: Padding(

          // pad edges by 20p
          padding: EdgeInsets.all(20),

          // container for form
          child: Container(

            // form
            child: Form(

              // key
              key: _formKey,

              child: Column(
                // align to top left
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                // input field and buttons
                children: <Widget>[

                  // "add a note" heading
                  Text(
                    'Add a note!',
                    style: TextStyle(
                        fontSize: 24.0,
                    ),
                  ),

                  // input for note
                  // slight copypasta here also
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Your note',
                    ),
                    keyboardType: TextInputType.text,

                    // basic validation
                    validator: (String input) {
                      if (input == null || input.isEmpty) {
                        return "Please enter something";
                      }

                      return null;
                    },
                  ),

                  // button that "saves note"
                  // for now just clears text
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: <Widget>[
                      ElevatedButton(
                        child: Text('Save'),
                        onPressed: () {
                          // slight copypasta here too
                          // broken for now
                          ///*
                          if (_formKey.currentState.validate()) {
                            scaffoldMessengerKey.currentState.showSnackBar
                            (
                              const SnackBar(
                                content: Text('Saving note.')
                              )
                            );
                          }
                          //*/

                          // Clear form
                          _formKey.currentState.reset();
                        },
                      )
                    ]
                  )

                ],

              ),

            ),

          ),


        ),
      ),
    );
  }


}