import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatelessWidget {
  const TextFieldIslemleri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BOŞ')),
      body: Column(children: const [
        Padding(
          padding: EdgeInsets.all(16),
          child: TextField(),
        )
      ]),
    );
  }
}
