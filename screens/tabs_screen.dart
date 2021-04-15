import 'package:flutter/material.dart';
//
import 'package:laba2021/screens/list_screen.dart';
import 'package:laba2021/screens/profile_screen.dart';
import 'package:laba2021/screens/register.dart';
import 'package:laba2021/screens/signin.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': ListScreen(),
      },
      {
        'page': SigninScreen(),
      },
      {
        'page': RegisterScreen(),
      },
      {
        'page': ProfileScreen(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 5,
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.storage_rounded),
            label: 'Матеріли',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Особистий кабінет',
          ),
        ],
      ),
    );
  }
}
