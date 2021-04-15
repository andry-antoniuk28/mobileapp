import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laba2021/screens/profile_screen.dart';
import 'package:laba2021/widgets/reg_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitForm(
    String email,
    String password,
    String name,
    String group,
  ) async {
    await _auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((_) {
      User usercredential = FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance
          .collection('users')
          .doc(usercredential.uid)
          .set({
        'name': name,
        'group': group,
        'id': usercredential.uid,
      }).then((_) => Navigator.of(context)
              .pushReplacementNamed(ProfileScreen.routeName));
    });
    // Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegWidget(_submitForm),
    );
  }
}
