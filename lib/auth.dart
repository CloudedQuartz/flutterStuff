import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  Auth createState() => Auth();
}

class Auth extends State<Authenticate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  String userEmail, userPassword;

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
        scaffoldMessengerKey: scaffoldMessengerKey,
        home: Scaffold(
            appBar: AppBar(title: Text('Authentication')),
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(


                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: <Widget>[
                      Text(
                        'Authentication',
                        style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold
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
                      ),


                      SizedBox(height: 16.0),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Login'),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                scaffoldMessengerKey.currentState.showSnackBar(SnackBar(content: Text('Logging-in user.')));
                              }
                            },
                          ),


                          SizedBox(width: 10.0),
                          ElevatedButton(
                            child: Text('Register'),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                scaffoldMessengerKey.currentState.showSnackBar(SnackBar(content: Text('Registering user.')));
                              }
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
