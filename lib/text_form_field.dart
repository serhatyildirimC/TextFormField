import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class MyTextFormFiled extends StatefulWidget {
  const MyTextFormFiled({Key? key}) : super(key: key);

  @override
  State<MyTextFormFiled> createState() => _MyTextFormFiledState();
}

class _MyTextFormFiledState extends State<MyTextFormFiled> {
  String _email = '', _password = '', _userName = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GIRIS YAP'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              TextFormField(
                initialValue: 'Serhat',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'UserName',
                    labelText: 'Username'),
                onSaved: (deger) {
                  _userName = deger!;
                },
                validator: (deger) {
                  if (deger!.length < 4) {
                    return 'Karakter Yetersiz';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                initialValue: 'Serhat@email.com',
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'e-mail',
                    labelText: 'e-mail'),
                onSaved: (deger) {
                  _email = deger!;
                },
                validator: (deger) {
                  if (!EmailValidator.validate(deger!)) {
                    return 'e-mail gecersiz';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                initialValue: 'aaaaaa',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    labelText: 'Password'),
                onSaved: (deger) {
                  _password = deger!;
                },
                validator: (deger) {
                  if (deger!.length < 6) {
                    return 'sifre 6 karakterden uzun olmalı';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    bool valid = _formKey.currentState!.validate();
                    if (valid) {
                      _formKey.currentState!.save();
                      String result =
                          'UserName: $_userName\ne-Mail:$_email\nPassword:$_password';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.pink.shade200,
                          content: Text(
                            result,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text('kaydet'))
            ]),
          ),
        ),
      ),
    );
  }
}
