// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'utils.dart';

class writing_page extends StatefulWidget {
    const writing_page({Key? key, 
    required DateTime? date
    }) : _date = date, super(key: key);
  final DateTime? _date;

  // DateTimeInfo(DateTime date){
  //   this._date = date;
  // }

  // DateTime this.date = date;
  @override
  _writing_pageState createState() => _writing_pageState();
}

class _writing_pageState extends State<writing_page> {
  String smilePath = 'assets/soso_icon/icon_blue2.png';
  String sosoPath = 'assets/soso_icon/icon_yellow2.png';
  String sadPath = 'assets/soso_icon/icon_pink2.png';
  String emotionPath = 'assets/components/non_selected.png';

  String text1 = '내용이 입력되지 않았습니다.';
  String text2 = '내용이 입력되지 않았습니다.';
  String text3 = '내용이 입력되지 않았습니다.';

  var formatDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
  
 final controller1 = TextEditingController();
    final controller2 = TextEditingController();
    final controller3 = TextEditingController();


      @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await EmotionDialog();

    });
  }

 @override
    void dispose(){
      controller1.dispose();
      controller2.dispose();
      controller3.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const Image(
          image: AssetImage('assets/bg2.png'),
          fit: BoxFit.cover,
        ),
            Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cancelButton(context),
              dayAndEmotion(),
              writingList(),
              completeButton()
            ],
          ),]
        ),
      ),
    );
  }

  Container cancelButton(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      margin: const EdgeInsets.only(left: 15, top: 40),
      alignment: Alignment.bottomLeft,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Image(image: AssetImage('assets/components/icon_x.png')),
        iconSize: 75,
      ),
    );
  }

  Row dayAndEmotion() {
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
        IconButton(
          onPressed: () {
            EmotionDialog();
          },
          icon: Image(
            image: AssetImage(emotionPath),
          ),
          iconSize: 60,
        ),
        const Spacer(),
      ],
    );
  }

  Future<dynamic> EmotionDialog() {
    return showDialog(
      barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: const Color(0xffF7F7F7),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: SizedBox(
                  width: 315,
                  height: 305,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top:36 , bottom: 26),
                        alignment: Alignment.center,
                        child: const Text(
                          "회고 기록에 앞서,\n오늘의 업무 만족도를 선택해 주세요!",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: 'Medium', fontSize:20),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              emotionPath = smilePath;
                            });
                            Navigator.pop(context);
                          },
                          icon:  Image(
                              image: AssetImage(
                                  smilePath)),iconSize: 75,),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              emotionPath = sosoPath;
                            });
                            Navigator.pop(context);
                          },
                          icon:  Image(
                              image: AssetImage(
                                  sosoPath)),iconSize: 75),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              emotionPath = sadPath;
                            });
                            Navigator.pop(context);
                          },
                          icon:  Image(
                              image: AssetImage(
                                  sadPath)),iconSize: 75),
                          
                    ],
                  ),
                  const SizedBox(height: 22,),
                  Row(children: const [
                    Spacer(),
                    Text('아주\n만족해요!',style: TextStyle(fontFamily: 'Medium',fontSize: 18),textAlign: TextAlign.center),
                    Spacer(),
                    Text('보통이에요.',style: TextStyle(fontFamily: 'Medium',fontSize: 18),),
                    Spacer(),
                    Text('조금\n아쉬워요.',style: TextStyle(fontFamily: 'Medium',fontSize: 18),textAlign: TextAlign.center,),
                    Spacer(),
                  ],),

                    ],
                  ),
                ),
              );
            },
          );
  }

  Container completeButton() {
    return Container(
      alignment: Alignment.bottomRight,
      margin: const EdgeInsets.only(
        right: 20,
      ),
      child: TextButton(
        onPressed: () {
          
          if(controller1.text == '') text1 = '내용이 입력되지 않았습니다.';
          if(controller2.text == '') text2 = '내용이 입력되지 않았습니다.';
          if(controller3.text == '') text3 = '내용이 입력되지 않았습니다.';
          kEvents.addAll({
          widget._date!:[
              Event(text1, text2, text3,emotionPath),
            ],
            // kToday: [
            //   Event(text1, text2,text3,emotionPath),
            //   // Event(controller1.toString(), controller2.toString(), controller3.toString(),emotionPath),
            // ],
          });
          // dispose();
          Navigator.pop(context);
        },
        child: const Text(
          '완료',
          style: TextStyle(
              fontFamily: 'Medium', fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  Container writingList() {
    return Container(
      // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 540,
      child: Stack(
        alignment: Alignment.topCenter,
        children:[
          const Image(
            width: 370,
          image: AssetImage('assets/components/memo.png'),
          fit: BoxFit.fill,
        ),
          Container(
            margin: const EdgeInsets.only(top: 30.0, bottom:40),
            child: ListView(
            shrinkWrap: true, 
            children: [
            Container(
              margin: const EdgeInsets.only(left: 24, top: 0),
              child: const Text('진행한 일',
                  style: TextStyle(fontFamily: 'Bold', fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24,right: 24),
              child:  TextField(
                onChanged: (text){
                  text1 = text;
                },
                controller: controller1,
                style: const TextStyle(
                  fontFamily: 'Medium',
                  fontSize:18, 
                  color: Color(0xff3E3E3E),
                  height: 1.5),
                minLines: 2,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '오늘은 어떤 일들을 하셨나요?',
                  hintStyle: TextStyle(
                      fontSize: 18, fontFamily: 'Medium', color: Color(0xffAFADAD)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, top: 48),
              child: const Text('잘한 점',
                  style: TextStyle(fontFamily: 'Bold', fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24,right: 24),
              child: TextField(
                onChanged: (text){
                  text2 = text;
                },
                controller: controller2,
                style: const TextStyle(
                  fontFamily: 'Medium',
                  fontSize:18, 
                  color:  Color(0xff3E3E3E), 
                  height: 1.5),
                minLines: 2,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '오늘의 활동 속에서 어떤 것을 잘하셨나요?',
                  hintStyle:  TextStyle(
                      fontSize: 18, fontFamily: 'Medium', color:  Color(0xffAFADAD)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, top: 48),
              child: const Text('개선할 점',
                  style: TextStyle(fontFamily: 'Bold', fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24,right: 24),
              child: TextField(
                onChanged: (text){
                  text3 = text;
                },
                controller: controller3,
                style: const TextStyle(
                  fontFamily: 'Medium',
                  fontSize:18 , color: Color(0xff3E3E3E), 
                  height: 1.5),
                minLines: 2,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '내일은 어떤 것을 개선하면 좋을까요?',
                  hintStyle: TextStyle(
                      fontSize: 18, fontFamily: 'Medium', color: Color(0xffAFADAD)),
                ),
              ),
            ),
        ]),
          ),
        Container(
          alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0, 500, 30, 0),
            height: 27,
            child: const Image(
              alignment: Alignment.bottomRight,
            image: AssetImage('assets/soso_icon/smile_wandoocong.png'),
            fit: BoxFit.fitHeight,
        ),
          ),
        ] 
      ),
    );
  }
}
