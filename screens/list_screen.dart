import 'package:flutter/material.dart';
import 'package:laba2021/screens/filter_screen.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 55),
              child: Text(
                'Каталог',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed(FilterScreen.routeName);
                  },
                  label: Text('Фільтри'),
                  icon: Icon(Icons.filter_alt),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('За ім\'ям'),
                  icon: Icon(Icons.arrow_downward),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: 9,
                itemBuilder: (ctx, i) => Container(
                  child: Card(
                    elevation: 2,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Фільтрування води у обмеженому просторі',
                                softWrap: true,
                              ),
                              Text(
                                '№458230',
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.black,
                        ),
                        Container(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Іванов І.І',
                                softWrap: true,
                              ),
                              Text(
                                'Фізика',
                                softWrap: true,
                              ),
                              Text(
                                '54%',
                                softWrap: true,
                              ),
                              Text(
                                'PDF',
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
