// ignore_for_file: camel_case_types

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:soso/onboarding_1.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soso/main.dart';

class Splash_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<Splash_Screen> {
  int splashtime = 3;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          //pushReplacement = replacing the route so that
          //splash screen won't show on back button press
          //navigation to Home page.
          builder: (context) {
        return onboarding_1();
      }));
    });

    super.initState();
  }

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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Medium',
                      color: Colors.black),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'soso',
                        speed: Duration(
                          milliseconds: 400,
                        ),
                      ),
                    ],
                    onTap: () {},
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 32.0,
                      fontFamily: 'Medium',
                      color: Colors.black),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        '소다의 소소한 기록',
                        speed: Duration(
                          milliseconds: 200,
                        ),
                      ),
                    ],
                    onTap: () {},
                  ),
                ),
              ]
              // mainAxisAlignment: MainAxisAlignment.center,

              ),
        ),
      ]),
    );
  }
}
