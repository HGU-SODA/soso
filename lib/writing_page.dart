// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class writing_page extends StatefulWidget {
  const writing_page({ Key? key }) : super(key: key);

  @override
  _writing_pageState createState() => _writing_pageState();
}

class _writing_pageState extends State<writing_page> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          Row(children: [
            Text(DateTime.now().toString())
          ],)
        ],
      ),
    );
  }
}