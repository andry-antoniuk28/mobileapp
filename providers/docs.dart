import 'package:flutter/foundation.dart';

import '../classes/document.dart';
import '../helpers/db_helper.dart';

class Docs with ChangeNotifier {
  List<Document> list = [];

  void addDocs(String name, int fis, int psic, int prog, int db, int percent,
      String description) {
    final newDoc = Document(
      name: name,
      fis: fis,
      psic: psic,
      prog: prog,
      db: db,
      percent: percent,
      description: description,
    );
    list.add(newDoc);
    notifyListeners();
    DBHelper.insert('docs', {
      'name': newDoc.name,
      'percent': newDoc.percent,
      'description': newDoc.description,
      // 'fisica': newDoc.fis,
      // 'pricologia': newDoc.psic,
      // 'programa': newDoc.prog,
      // 'data_base': newDoc.db
    });
  }

  Future<void> fetchAndSet() async {
    final dataList = await DBHelper.getData('docs');
    list = dataList
        .map(
          (item) => Document(
            name: item['name'],
            percent: item['percent'],
            description: item['description'],
            // fis: item['fisica'],
            // psic: item['pricologia'],
            // prog: item['programa'],
            // db: item['data_base'],
          ),
        )
        .toList();
    notifyListeners();
  }

  Future<int> delete(String name) async {
    final db = await DBHelper.database();
    return await db.delete('docs', where: 'name = ?', whereArgs: [name]);
  }
}
