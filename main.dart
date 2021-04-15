import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laba2021/providers/docs.dart';
import 'package:provider/provider.dart';
// screens
import 'package:laba2021/screens/added.dart';
import 'package:laba2021/screens/change_pwd.dart';
import 'package:laba2021/screens/filter_screen.dart';
import 'package:laba2021/screens/my_materials.dart';
import 'package:laba2021/screens/profile_screen.dart';
import 'package:laba2021/screens/register.dart';
import 'package:laba2021/screens/signin.dart';
import 'package:laba2021/screens/add_material.dart';
import 'package:laba2021/screens/tabs_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return ChangeNotifierProvider.value(
          value: Docs(),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            home: TabsScreen(),
            routes: {
              TabsScreen.routeName: (ctx) => TabsScreen(),
              FilterScreen.routeName: (ctx) => FilterScreen(),
              SigninScreen.routeName: (ctx) => SigninScreen(),
              RegisterScreen.routeName: (ctx) => RegisterScreen(),
              ProfileScreen.routeName: (ctx) => ProfileScreen(),
              MyMaterials.routeName: (ctx) => MyMaterials(),
              AddMaterial.routeName: (ctx) => AddMaterial(),
              Added.routeName: (ctx) => Added(),
              ChangePassword.routeName: (ctx) => ChangePassword(),
            },
          ),
        );
      },
    );
  }
}
