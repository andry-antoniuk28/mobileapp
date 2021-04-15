import 'package:flutter/material.dart';
import 'package:laba2021/screens/added.dart';
import 'package:laba2021/widgets/document_picker.dart';
import '../providers/docs.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class AddMaterial extends StatefulWidget {
  static const routeName = '/add';
  @override
  _AddMaterialState createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {
  final nameController = TextEditingController();
  final perController = TextEditingController();
  final desController = TextEditingController();
  final _key = GlobalKey<FormState>();
  String _name;
  File doc;
  bool value = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  int _fisic = 0;
  int _psic = 0;
  int _prog = 0;
  int _db = 0;
  int _percent;
  String description;

  void _addMaterial() {
    final isValid = _key.currentState.validate();
    if (isValid) {
      Provider.of<Docs>(context, listen: false).addDocs(
          _name, _fisic, _psic, _prog, _db, _percent, description);
      Navigator.of(context).pushNamed(Added.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  'Додати матеріал',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Назва',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Заповніть це поле';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value;
                  },
                  controller: nameController,
                  onChanged: (text) {
                    setState(() {
                      _name = text;
                    });
                  },
                ),
              ),
              // Download Document
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(top: 30),
                child: DocumentPicker(),
              ),
              // Галузь
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                ),
                child: const Text(
                  'Оберіть галузь',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SwitchListTile(
                title: const Text('Фізика'),
                value: value,
                onChanged: (bool _) {
                  setState(() {
                    // _fisic = 1;
                    value = !value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Психологія'),
                value: value1,
                onChanged: (bool _) {
                  setState(() {
                    // _psic = 1;
                    value1 = !value1;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Програмування'),
                value: value2,
                onChanged: (bool _) {
                  setState(() {
                    // _prog = 1;
                    value2 = _;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Бази данних'),
                value: value3,
                onChanged: (bool _) {
                  setState(() {
                    // _db = 1;
                    value3 = _;
                  });
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  // key: ,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Унікальність в %',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Заповніть це поле';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _percent = int.parse(value);
                  },
                  controller: perController,
                  onChanged: (text) {
                    setState(() {
                      _percent = int.parse(text);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Опис',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  decoration: const InputDecoration(
                    hintText: 'Залиште ваш опис',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Залиште опис';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    description = value;
                  },
                  controller: desController,
                  onChanged: (text) {
                    setState(() {
                      description = text;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  onPressed: _addMaterial,
                  child: const Text('Додати'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 14)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}