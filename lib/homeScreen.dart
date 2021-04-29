import 'package:flutter/material.dart';

import 'addnote.dart';
import 'auth.dart';

void homeScreen() {

  // run empty homescreen for now
  runApp(HomeScreenRoute());

}

class HomeScreenRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(),
        'auth' : (context) => Authenticate(),
        'notes' : (context) => StartNotes(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(

        // title
        appBar: AppBar(title: Text('Home'), centerTitle: true),

        // body
        body: Padding(

          padding: EdgeInsets.all(20),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ElevatedButton(
                    child: Text('Authentication'),
                    onPressed: () {
                      Navigator.pushNamed(context, 'auth');
                    },
                  ),


                  SizedBox(height: 16.0),


                  ElevatedButton(
                    //pad edge
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 43)),
                    child: Text('Notes'),
                    onPressed: () {
                      Navigator.pushNamed(context, 'notes');
                    },
                  )
                ],

              )
            ]
          ),



        ),
      ),
    );

  }
}