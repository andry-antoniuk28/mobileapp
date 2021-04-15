import 'package:flutter/material.dart';
import 'package:laba2021/providers/docs.dart';
import 'package:laba2021/screens/add_material.dart';
import 'package:provider/provider.dart';

class MyMaterials extends StatefulWidget {
  static const routeName = '/materials';

  @override
  _MyMaterialsState createState() => _MyMaterialsState();
}

class _MyMaterialsState extends State<MyMaterials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Provider.of<Docs>(context, listen: false).fetchAndSet(),
        builder: (ctx, snap) => snap.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Docs>(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Мої матеріали',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AddMaterial.routeName);
                            },
                            child: const Text('Дотати новий'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: Center(
                        child: const Text('У вас немає матераілів'),
                      ),
                    ),
                  ],
                ),
                builder: (ctx, docs, ch) => docs.list.length <= 0
                    ? ch
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    'Мої матеріали',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(AddMaterial.routeName);
                                    },
                                    child: const Text('Дотати новий'),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: ListView.builder(
                                itemCount: docs.list.length,
                                itemBuilder: (ctx, index) => Card(
                                  child: ListTile(
                                    title: Text(
                                      docs.list[index].name.toString(),
                                      softWrap: true,
                                      overflow: TextOverflow.clip,
                                    ),
                                    trailing: Container(
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(Icons.edit),
                                          IconButton(
                                            icon: Icon(Icons.cancel_outlined),
                                            onPressed: () {
                                              Provider.of<Docs>(context)
                                                  .delete(
                                                      docs.list[index].name);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
      ),
    );
  }
}
