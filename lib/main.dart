import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

import 'homeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // This will run HomeScreenWrapper after firebase initializes
  runApp(InitFirebase());
}

class InitFirebase extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {

        // Check for errors
        if (snapshot.hasError) {
          // Use materialapp to avoid "No directionality widget found"
          return MaterialApp(home: Scaffold(body: Text('Unable to initialize Firebase')));
        }

        // Run HomeScreenWrapper() as before
        if (snapshot.connectionState == ConnectionState.done) {
          return HomeScreenWrapper();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // TODO: add a loading screen
        // Use materialapp to avoid "No directionality widget found"
        return MaterialApp(home: Scaffold(body: Text('Loading')));
      },
    );
  }
}