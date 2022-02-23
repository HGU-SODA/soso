// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soso/calendar.dart';
import 'main.dart';
import 'utils.dart';

class writing_page extends StatefulWidget {
    const writing_page({Key? key, 
    required DateTime? date,
    required String? name
    }) : _name = name, _date = date, super(key: key);
  final DateTime? _date;
  final String? _name;
  

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

  

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();


     @override
  void initState() {

    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await EmotionDialog();

    });
  }

  void popupInCalendar() {
    // Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => const Main_Calender()),
    //       );
    Navigator.of(context).push(MaterialPageRoute(
      builder: (c) => Main_Calendar(dday: widget._date!, name: widget._name,)));
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('hello')));
    

showDialog(
  context: context,
  builder: (context) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pop();
    });

    return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
              content: Container(
                alignment: Alignment.center,
                width: 153,
                height: 183,
                child: const Image(
                  image: AssetImage('assets/components/save1.png'),
                  fit: BoxFit.fill,
                ),
              ),
            );
  }
);
        }
            
  

 final controller1 = TextEditingController();
    final controller2 = TextEditingController();
    final controller3 = TextEditingController();


 

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
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const Image(
            image: AssetImage('assets/bg2.png'),
            fit: BoxFit.fill,
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
          showDialog(
              context: context,
              builder: (context) {
                return  Stack(
                  children: [Dialog(
                    // elevation: 10,
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child:SizedBox(
                      width: 278,
                      height: 118,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 16,right: 19),
                            // color: Colors.blue,
                            // margin: EdgeInsets.only(top: 20),
                            child: const Text(
                              '정말 지우시겠습니까?\n기록이 다 없어질 지도 몰라요 :(',
                              style: TextStyle(
                                fontFamily: 'Medium', 
                                fontSize:18,
                                color: Color(0xff3E3E3E),
                                height: 1.5
                                ),)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    
                          TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, 
                          child: Text('아니오',style:TextStyle(fontFamily: 'Medium',fontSize: 16, color: Color(0xff556AAE)))),
                          TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                  builder: (context) => Main_Calendar(
                          dday: widget._date!,
                          name: widget._name,
                          
                        )),
                            );
                          }, 
                          child: Text('네',style:TextStyle(fontFamily: 'Medium',fontSize: 16, color: Color(0xff556AAE)),)),
                          // SizedBox(width: 20,)
                                  ],
                                ),
                          
                        ],
                      ),
                    ),
                  ),]
                );
              });

          
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
          DateFormat('yyyy/MM/dd').format(widget._date!),
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
        return Stack(
          children: [
            Dialog(
            backgroundColor: const Color(0xffF7F7F7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                ),
              Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 200),
                child: const Image(
                    image: AssetImage('assets/components/masking_tap.png'))),
          ]
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
          
          setState(() {
            kEvents.addAll({
          widget._date!:[
              Event(text1, text2, text3,emotionPath,widget._date!),
            ],
          });
          });
    //       scaffoldKey.currentState
    // ?.showSnackBar(SnackBar(content: Text("Hello")));
          Navigator.pop(context);
          popupInCalendar();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const Main_Calender()),
          // );
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
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 540,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children:[
          const Image(
            width: double.infinity,
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
