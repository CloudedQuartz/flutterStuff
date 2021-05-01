import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate extends StatefulWidget {
  @override
  Auth createState() => Auth();
}

class Auth extends State<Authenticate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  // Create firebase auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;
  String userEmail, userPassword;

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
        scaffoldMessengerKey: scaffoldMessengerKey,
        home: Scaffold(
            appBar: AppBar(title: Text('Authentication'), centerTitle: true,),
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: <Widget>[
                      Text(
                        'Authenticate',
                        style: TextStyle(
                            fontSize: 24.0,
                        ),
                      ),


                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (String email) {

                          // Use regex to validate email
                          bool emailValid = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email);

                          if (!emailValid) {
                            return "Please enter your email";
                          }

                          return null;
                        },

                        onSaved: (String email) {
                          userEmail = email;
                        },
                      ),


                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (String password) {
                          if (password == null || password.isEmpty) {
                            return "Please enter your password";
                          }

                          return null;
                        },

                        onSaved: (String password) {
                          userPassword = password;
                        },
                      ),


                      SizedBox(height: 16.0),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Login'),
                            onPressed: () async {
                              // First validate form
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();

                                // log in
                                try {
                                  UserCredential userCredential = await auth.signInWithEmailAndPassword(
                                      email: userEmail,
                                      password: userPassword
                                  );
                                }
                                on FirebaseAuthException catch (e) {
                                  scaffoldMessengerKey.currentState.showSnackBar(SnackBar(content: Text(e.message)));
                                  return 0;
                                }



                                // continue if no exception
                                scaffoldMessengerKey.currentState.showSnackBar(SnackBar(content: Text('Logging-in user.')));
                                _formKey.currentState.reset();
                              }

                            },
                          ),


                          SizedBox(width: 10.0),
                          ElevatedButton(
                            child: Text('Register'),
                            onPressed: () async {
                              // first validate form
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                try {
                                  UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                                      email: userEmail,
                                      password: userPassword
                                  );
                                } on FirebaseAuthException catch (e) {
                                  scaffoldMessengerKey.currentState.showSnackBar(SnackBar(content: Text(e.message)));
                                  return 0;
                                }

                                // Continue
                                scaffoldMessengerKey.currentState.showSnackBar(SnackBar(content: Text('Registering user.')));
                                _formKey.currentState.reset();
                              }
                            },
                          ),
                          SizedBox(width: 10.0),
                          ElevatedButton(
                            child: Text('Logout'),
                            onPressed: () {
                              auth.signOut();
                              scaffoldMessengerKey.currentState.showSnackBar(SnackBar(content: Text('Logging Out.')));
                            },
                          )

                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}
