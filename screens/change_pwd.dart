import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  static const routeName = '/change-pwd';
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Старий пароль',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
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
                    // _email = value;
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Новий пароль',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
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
                    // _email = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Змінити пароль'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
