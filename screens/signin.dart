import 'package:flutter/material.dart';
import 'package:laba2021/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laba2021/widgets/login_widget.dart';

class SigninScreen extends StatefulWidget {
  static const routeName = '/signin';
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitForm(
    String email,
    String password,
  ) async {
    {
      await _auth.signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => Navigator.of(context)
              .pushReplacementNamed(ProfileScreen.routeName));
      // Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogWidget(_submitForm),
    );
  }
}
