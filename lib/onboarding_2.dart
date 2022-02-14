// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class onboarding_2 extends StatefulWidget {
  const onboarding_2({Key? key}) : super(key: key);

  // final String title;

  @override
  State<onboarding_2> createState() => _onboarding_2State();
}

class _onboarding_2State extends State<onboarding_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(children: [
          Container(
            width: 100,
            height: 100,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: const Color(0xffFCDA9D)),
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 132, 0, 78),
            child: SizedBox(
                width: 150.0,
                height: 150.0,
                child: Image.asset('assets/soso1.png')), //소소 넣는 거
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              '안녕하세요!\n저는 당신의 소소한 회고를 돕는\n 소소 라고 해요!\n',
              textAlign: TextAlign.center,
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Medium',
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            width: 300.0,
            height: 70.0,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '제가 당신을 어떻게\n 불러드리면 좋을까요?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Medium',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            width: 200.0,
            height: 100.0,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: 'Medium',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            width: 200.0,
            height: 70.0,
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
          )
        ]
            // mainAxisAlignment: MainAxisAlignment.center,

            ),
      ),
    );
  }
}
