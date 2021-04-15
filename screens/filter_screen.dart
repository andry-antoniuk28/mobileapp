import 'dart:ui';

import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _fisic = false;
  bool _psic = false;
  bool _prog = false;
  bool _db = false;
  bool _pdf = false;
  bool _doc = false;
  bool _xls = false;
  bool _t30 = false;
  bool _te3080 = false;
  bool _e80 = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Філтри'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Галузь
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: const Text(
                'Галузь',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SwitchListTile(
              title: const Text('Фізика'),
              value: _fisic,
              onChanged: (bool value) {
                setState(() {
                  _fisic = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Психологія'),
              value: _psic,
              onChanged: (bool value) {
                setState(() {
                  _psic = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Програмування'),
              value: _prog,
              onChanged: (bool value) {
                setState(() {
                  _prog = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Бази данних'),
              value: _db,
              onChanged: (bool value) {
                setState(() {
                  _db = value;
                });
              },
            ),
            // Формат
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: const Text(
                'Формат',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SwitchListTile(
              title: const Text('PDF'),
              value: _pdf,
              onChanged: (bool value) {
                setState(() {
                  _pdf = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('DOC'),
              value: _doc,
              onChanged: (bool value) {
                setState(() {
                  _doc = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('XLS'),
              value: _xls,
              onChanged: (bool value) {
                setState(() {
                  _xls = value;
                });
              },
            ),
            // Унікальність
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: const Text(
                'Унікальність',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SwitchListTile(
              title: const Text('<30%'),
              value: _t30,
              onChanged: (bool value) {
                setState(() {
                  _t30 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('31-80%'),
              value: _te3080,
              onChanged: (bool value) {
                setState(() {
                  _te3080 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('80+%'),
              value: _e80,
              onChanged: (bool value) {
                setState(() {
                  _e80 = value;
                });
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Застосувати'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
