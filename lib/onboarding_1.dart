// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:soso/onboarding_2.dart';

class onboarding_1 extends StatefulWidget {
  const onboarding_1({Key? key}) : super(key: key);

  // final String title;

  @override
  State<onboarding_1> createState() => _onboarding_1State();
}

class _onboarding_1State extends State<onboarding_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Stack(children: [
        const Image(
          image: AssetImage('assets/bg2.png'),
          fit: BoxFit.cover,
        ),
        Center(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 134, 0, 6),
              alignment: Alignment.center,
              child: const Text(
                'soso',
                style: TextStyle(fontFamily: 'Medium', fontSize: 60),
              ),
              width: 400.0,
              height: 50.0,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 66),
              child: const Text(
                '소다의 소소한 기록',
                style: const TextStyle(fontFamily: 'Medium', fontSize: 24),
              ),
              width: 165.0,
              height: 24.0,
            ),
            Container(
              width: 180,
              height: 180,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: const Color(0xffFCDA9D)),
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 78),

              child: SizedBox(
                  width: 150.0,
                  height: 145.0,
                  child: Image.asset(
                      'assets/soso_character/soso_main.png')), //소소 넣는 거
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                child: const Text(
                  '시작하기',
                  style: TextStyle(
                    fontFamily: 'Medium',
                    fontSize: 24,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const onboarding_2()),
                  );
                },
              ),
              width: 100.0,
              height: 70.0,
            ),
          ]
              // mainAxisAlignment: MainAxisAlignment.center,

              ),
        ),
      ]),
    );
  }
}
