// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class onboarding_4 extends StatefulWidget {
  const onboarding_4({Key? key}) : super(key: key);

  // final String title;

  @override
  State<onboarding_4> createState() => _onboarding_4State();
}

class _onboarding_4State extends State<onboarding_4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 170, 0, 30),
            child: Image.asset('assets/soso_main.png'),
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

          Container(
            margin: EdgeInsets.only(top: 66),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '회고 시작하기',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'Medium',
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ]
            // mainAxisAlignment: MainAxisAlignment.center,

            ),
      ),
    );
  }
}
