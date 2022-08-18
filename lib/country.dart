import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final String name;
  Country(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(name),
      ),
      body: ,
    );
  }
}
