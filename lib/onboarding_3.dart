import 'package:flutter/material.dart';
import 'package:soso/onboarding_4.dart';

class onboarding_3 extends StatefulWidget {
  const onboarding_3({Key? key}) : super(key: key);

  // final String title;

  @override
  State<onboarding_3> createState() => _onboarding_3State();
}

class _onboarding_3State extends State<onboarding_3> {
  @override
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
        Center(
          child: Column(children: [
            Container(
              width: 180,
              height: 180,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: const Color(0xffFCDA9D)),
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 200, 0, 30),
              child: SizedBox(
                  width: 150.0,
                  height: 145.0,
                  child: Image.asset(
                      'assets/soso_character/soso main.png')), //소소 넣는 거
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 200),
              child: Text(
                '환영해요, 은비님!',
                textAlign: TextAlign.center,
                //textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Medium',
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              width: 300.0,
              height: 20.0,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 28, 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => onboarding_4()),
                    );
                  },
                  child: Text(
                    '다음',
                    style: TextStyle(
                      fontFamily: 'Medium',
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                width: 62.0,
                height: 44.0,
              ),
            )
          ]
              // mainAxisAlignment: MainAxisAlignment.center,

              ),
        ),
      ]),
    );
  }
}