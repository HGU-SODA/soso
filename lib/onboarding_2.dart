// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:soso/onboarding_4.dart';

class onboarding_2 extends StatefulWidget {
   onboarding_2({Key? key}) : super(key: key);

static String? _ttext = '' ;

  static get ttext{
    return _ttext;
  }
  set setText(String a){
    _ttext = a;
  }

  static String getText(){
    return ttext;
  }
  // final String title;

  @override
  State<onboarding_2> createState() => _onboarding_2State();
}

class _onboarding_2State extends State<onboarding_2> {
   final controller = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Stack(children: [
        const Image(
          image:  AssetImage('assets/bg2.png'),
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Container(
                width: 100,
                height: 100,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: const Color(0xffFCDA9D)),
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(138, 155, 137, 42),
                child: SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child: Image.asset(
                        'assets/soso_character/soso_main.png')), //소소 넣는 거
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: const Text(
                  '안녕하세요!\n저는 당신의 소소한 회고를 돕는\n 소소 라고 해요!\n',
                  textAlign: TextAlign.center,
                  //textAlign: TextAlign.center,
                  style:  TextStyle(
                    fontFamily: 'Medium',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                width: 300.0,
                height: 70.0,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  '제가 당신을 어떻게\n 불러드리면 좋을까요?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Medium',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                width: 200.0,
                height: 50.0,
              ),
              Center(
                child: Container(
                  width: 234,
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(
                    children: [
                       Expanded(
                         child: Container(
                           margin: const EdgeInsets.only(left: 30),
                           child: TextField(
                             controller: controller,
                             textAlign: TextAlign.center,
                             style: const TextStyle(fontFamily: 'Medium', fontSize: 28),
                               decoration:  const InputDecoration(
                             border: InputBorder.none,
                           )),
                         ),
                       ),
                      const Image(
                        image: AssetImage('assets/components/pencil_m.png'),
                      ),
                    ],
                  ),
                  decoration:
                      const BoxDecoration(border: Border(bottom: BorderSide(width: 3))),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(285, 130, 28, 28),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  onboarding_4(name: controller.text,)),
                    );
                  },
                  child: const Text(
                    '완료',
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
        ),
      ]),
    );
  }
}
