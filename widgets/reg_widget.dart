import 'package:flutter/material.dart';

class RegWidget extends StatefulWidget {
  RegWidget(this.submit);

  final void Function(String email, String password, String name, String group)
      submit;
  @override
  _RegWidgetState createState() => _RegWidgetState();
}

class _RegWidgetState extends State<RegWidget> {
  final _keyForm = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final grpController = TextEditingController();
  var _name = '';
  var _email = '';
  var _pwd = '';
  var _grp = '';

  void _submitForm() async {
    final isValid = _keyForm.currentState.validate();
    if (isValid) {
      _keyForm.currentState.save();
      widget.submit(
        _email,
        _pwd,
        _name,
        _grp,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _keyForm,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // FIO
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: TextFormField(
                // key: ,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'ФІО',
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
                onChanged: (text) {
                  setState(() {
                    _name = text;
                  });
                },
                controller: nameController,
              ),
            ),
            // email
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: TextFormField(
                // key: ,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Введіть правильний емейл';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
                onChanged: (text) {
                  setState(() {
                    _email = text;
                  });
                },
                controller: emailController,
              ),
            ),
            // password
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: TextFormField(
                // key: ,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: 'Пароль',
                ),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty || value.length < 8) {
                    return 'Пароль має містити як мінімум 8 символів';
                  }
                  return null;
                },
                onSaved: (value) {
                  _pwd = value;
                },
                onChanged: (text) {
                  setState(() {
                    _pwd = text;
                  });
                },
                controller: pwdController,
              ),
            ),
            // Група
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: TextFormField(
                // key: ,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Група',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Заповніть це поле';
                  }
                  return null;
                },
                onSaved: (value) {
                  _grp = value;
                },
                onChanged: (text) {
                  setState(() {
                    _grp = text;
                  });
                },
                controller: grpController,
              ),
            ),
            // Логін
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              child: GestureDetector(
                child: const Text(
                  'Увійти',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            // Реєстрація
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Зареєструватися'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
