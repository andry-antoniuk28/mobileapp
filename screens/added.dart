import 'package:flutter/material.dart';
import 'package:laba2021/screens/profile_screen.dart';

class Added extends StatelessWidget {
  static const routeName = '/added';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                'Дякую за роботу. Ваш матеріал буде опубліковано після модерації',
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(ProfileScreen.routeName);
                },
                child: Text('Повернутися до профілю'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
