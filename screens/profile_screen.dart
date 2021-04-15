import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laba2021/screens/change_pwd.dart';
import 'package:laba2021/screens/my_materials.dart';
import 'package:laba2021/screens/tabs_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  // final name = FirebaseFirestore.instance
     // .collection('users')
      //.doc(FirebaseAuth.instance.currentUser.uid)
      //.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      //FutureBuilder(
        //future: name,
        //builder: (ctx, snapshot) {
      //    return
      Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, bottom: 20, left: 20),
                child: const Text(
                  'Особистий кабінет',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30, top: 10, left: 20),
                child: Text(
                  'Вітаємо!',
                  // ${snapshot.data['name']}
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Змінити пароль',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(ChangePassword.routeName);
                },
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Мої матеріали',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(MyMaterials.routeName);
                },
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Завантажити новий файл',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                onTap: () {},
              ),
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .popAndPushNamed(TabsScreen.routeName);
                    },
                    child: Text('На головну'),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
       // },
     // ),
    );
  }
}
