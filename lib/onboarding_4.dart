// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'calendar.dart';
import 'onboarding_2.dart';

class onboarding_4 extends StatefulWidget {
   onboarding_4({Key? key,  required final String name}) : _name = name, super(key: key);

 String _name ;
  // final String title;

  @override
  State<onboarding_4> createState() => _onboarding_4State();
}

class _onboarding_4State extends State<onboarding_4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Image(
          image: AssetImage('assets/bg2.png'),
          fit: BoxFit.cover,
        ),
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 170, 0, 30),
                child: Image.asset('assets/soso_character/soso_main.png'),
              ), //소소 넣는 거

               Text(
                 '환영해요, '+ widget._name+'님!',
                // '환영해요, ${widget._name}님!',
                textAlign: TextAlign.center,
                //textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Medium',
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 66),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Main_Calendar(dday: DateTime.now(),name: widget._name,)),
                    );
                  },
                  child: const Text(
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
            ],
            // crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ]),
    );
  }
}