import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class MyTextFormFiled extends StatefulWidget {
  const MyTextFormFiled({Key? key}) : super(key: key);

  @override
  State<MyTextFormFiled> createState() => _MyTextFormFiledState();
}

class _MyTextFormFiledState extends State<MyTextFormFiled> {
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
            autovalidateMode: AutovalidateMode.always,
            child: Column(children: [
              TextFormField(
                initialValue: 'Serhat',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'UserName',
                    labelText: 'Username'),
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
                initialValue: '',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    labelText: 'Password'),
                validator: (deger) {
                  if (deger!.length < 6) {
                    return 'sifre 6 karakterden uzun olmalı';
                  } else {
                    return null;
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
