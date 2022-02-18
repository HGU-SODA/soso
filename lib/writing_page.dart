// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';

class writing_page extends StatefulWidget {
  const writing_page({Key? key}) : super(key: key);

  @override
  _writing_pageState createState() => _writing_pageState();
}

class _writing_pageState extends State<writing_page> {
  var formatDate = DateFormat('yyyy/MM/dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cancelButton(context),
          dayAndIcon(),
          writingList(),
          completeButton()
          
        ],
      ),
    );
  }

  Container cancelButton(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(left: 15, top: 40),
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.cancel_presentation)),
        );
  }

  Row dayAndIcon() {
    return Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            Text(
              formatDate,
              style: const TextStyle(
                fontFamily: 'Bold',
                fontSize: 28,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            const SizedBox(
              width: 60,
              height: 60,
              child:
                  Image(image: AssetImage('assets/soso_icon/icon_pink2.png')),
            ),
            const Spacer(),
          ],
        );
  }

  Container completeButton() {
    return Container(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(right: 20, ),
            child: TextButton(
              onPressed: (){},
              child: const Text('완료',
              style: TextStyle(
                fontFamily: 'Medium',
                fontSize: 20,
                color: Colors.black
              ),),),
          );
  }

  SizedBox writingList() {
    return SizedBox(
          height: 530,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
              margin: const EdgeInsets.only(left: 24, top: 20),
              child: const Text('1. 오늘 진행한 일',
                  style: TextStyle(fontFamily: 'Bold', fontSize: 20)),
            ),
            Container(
            margin: const EdgeInsets.only(left: 24),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '오늘은 어떤 일들을 하셨나요?',
                hintStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Medium',
                    color: Color(0xffAFADAD)),
                // labelText: 'Input',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 50),
            child: const Text('2. 잘한 점',
                style: TextStyle(fontFamily: 'Bold', fontSize: 20)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '오늘의 활동 속에서 어떤 것을 잘하셨나요?',
                hintStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Medium',
                    color: Color(0xffAFADAD)),
                // labelText: 'Input',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 50),
            child: const Text('3. 개선할 점',
                style: TextStyle(fontFamily: 'Bold', fontSize: 20)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '내일은 어떤 것을 개선하면 좋을까요?',
                hintStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Medium',
                    color: Color(0xffAFADAD)),
                // labelText: 'Input',
              ),
            ),
          ),
          
            ]
          ),
        );
  }
}
