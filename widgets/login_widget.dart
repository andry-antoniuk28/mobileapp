import 'package:flutter/material.dart';
import 'package:laba2021/screens/register.dart';

class LogWidget extends StatefulWidget {
  LogWidget(this.submit);

  final void Function(String email, String password) submit;
  @override
  _LogWidgetState createState() => _LogWidgetState();
}

class _LogWidgetState extends State<LogWidget> {
  final _keyForm = GlobalKey<FormState>();
  var _email = '';
  var _password = '';

  void _submit() async {
    final isValid = _keyForm.currentState.validate();
    if (isValid) {
      _keyForm.currentState.save();
      widget.submit(
        _email.trim(),
        _password.trim(),
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
            // email
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: TextFormField(
                // key: ,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFA31A),
                    ),
                  ),
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
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFA31A),
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty || value.length < 8) {
                    return 'Пароль має містити як мінімум 8 символів';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              child: GestureDetector(
                child: const Text(
                  'Зареєструватися',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(RegisterScreen.routeName);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text('Увійти'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
