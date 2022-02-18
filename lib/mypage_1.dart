// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

Widget build(BuildContext context) {
  return Scaffold(
    // appBar: AppBar(
    //   title: Text(widget.title),
    // ),
    body: Stack(children: [
      Image(
        image: AssetImage('assets/bg2.png'),
        fit: BoxFit.cover,
      ),
      Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(126, 120, 129, 56),
          child: Image.asset('assets/soso_character/soso main.png'),
        ), //소소 넣는 거

        const Text(
          '수고하셨습니다, 은비님👏🏻\n이제 정말 회고를 시작해봐요!',
          textAlign: TextAlign.center,
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Medium',
            fontSize: 24,
            color: Colors.black,
          ),
        ),

        Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                // controller: _textController,
                // onSubmitted: _handleSubmitted,
                //decoration:
                //  new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(icon: Icon(Icons.send), onPressed: () {}),
            ),
          ],
        ),

        Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                // controller: _textController,
                // onSubmitted: _handleSubmitted,
                //decoration:
                //  new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(icon: Icon(Icons.send), onPressed: () {}),
            ),
          ],
        ),
      ]
          // mainAxisAlignment: MainAxisAlignment.center,

          ),
    ]),
  );
}
