import 'package:flutter/material.dart';

class FormCustom extends StatefulWidget {
  final String title;
  const FormCustom({Key? key, required this.title}) : super(key: key);

  @override
  _FormCustomState createState() => _FormCustomState();
}

class _FormCustomState extends State<FormCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
          child: Column(
        children: [TextFormField()],
      )),
    );
  }
}
