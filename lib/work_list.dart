import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'calendar.dart';
import 'utils.dart';
import 'package:dotted_line/dotted_line.dart';

class WList extends StatefulWidget {
  WList({Key? key, required String content})
      : _content = content,
        super(key: key);
  String _content;

  @override
  State<WList> createState() => _WListState();
}

class _WListState extends State<WList> {
  String whatList = 'content1';
  int dif = 0;
  int? isSelected;
  
@override
  void initState() {

  if(widget._content == 'content1'){
    isSelected = 1;
  }else if (widget._content == 'content2'){
    isSelected = 2;
  }else {
    isSelected = 3;
  }

  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsInMonth(int dif) {
    final firstDay = DateTime(kToday.year, kToday.month - dif, 1);
    final lastDay = DateTime(kToday.year, kToday.month - dif, 31);
    final days = daysInRange(firstDay, lastDay);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  Text displayDateTime(int dif) {
    DateTime day = DateTime.utc(
        DateTime.now().year, DateTime.now().month - dif, DateTime.now().day);

    return Text(
      day.year.toString() + '년 ' + day.month.toString() + '월',
      style: const TextStyle(fontFamily: 'Bold', fontSize: 24),
    );
  }

  static String returnKoreanDay2(DateTime day) {
    String? KDay = '';
    if (DateFormat('E').format(day) == 'Mon') {
      KDay = '월요일';
    } else if (DateFormat('E').format(day) == 'Tue') {
      KDay = '화요일';
    } else if (DateFormat('E').format(day) == 'Wed') {
      KDay = '수요일';
    } else if (DateFormat('E').format(day) == 'Thu') {
      KDay = '목요일';
    } else if (DateFormat('E').format(day) == 'Fri') {
      KDay = '금요일';
    } else if (DateFormat('E').format(day) == 'Sat') {
      KDay = '토요일';
    } else if (DateFormat('E').format(day) == 'Sun') {
      KDay = '일요일';
    }

    return KDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 45,
                    icon: const Image(
                      image: AssetImage('assets/components/back.png'),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: const Text('질문들',
                        style: TextStyle(fontFamily: 'Medium', fontSize: 20)))
              ],
            ),
            //Text로 만들어진 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: 125,
                  height: 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(image: AssetImage((isSelected==1)?'assets/components/masking_tap.png':'assets/components/non.png'),fit: BoxFit.fill),
                      TextButton(
                        onPressed: (){
                      setState(() {
                          widget._content = 'content1';
                          dif = 0;
                          isSelected = 1;
                        });
                    },child:  Text('진행한 일',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Medium',fontSize:20,color: (isSelected==1) ? Colors.black : Colors.grey),)),]
                  ),
                ),
                // const Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: 125,
                  height: 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(image: AssetImage((isSelected==2)?'assets/components/masking_tap.png':'assets/components/non.png'),fit: BoxFit.fill,),
                      TextButton(onPressed: (){
                      setState(() {
                          widget._content = 'content2';
                          dif = 0;
                          isSelected = 2;
                        });
                      },
                      child: Text('잘한 점',
                          style: TextStyle(
                              fontFamily: 'Medium',
                              fontSize: 20,
                              color:
                                  (isSelected == 2) ? Colors.black : Colors.grey)),
                    ),
                    ]
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 125,
                  height: 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                    Image(image: AssetImage((isSelected==3)?'assets/components/masking_tap.png':'assets/components/non.png'),fit: BoxFit.fill),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          widget._content = 'content3';
                          dif = 0;
                          isSelected = 3;
                        });
                      },
                      child: Text('개선할 점',
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Medium',
                              fontSize: 20,
                              color: (isSelected == 3)
                                  ? Colors.black
                                  : Colors.grey)),
                    ),
                  ]),
                ),
                // const Spacer(),
              ],
            ),
            // Image로 만들어진 버튼
            // Row(
            //   children: [
            //     const Spacer(),
            //     TextButton(
            //       onPressed: () {
            //         setState(() {
            //           widget._content = 'content1';
            //           dif = 0;
            //         });
            //       },
            //       child: const Image(
            //         image: AssetImage('assets/components/ing.png'),
            //       ),
            //     ),
            //     const Spacer(),
            //     TextButton(
            //       onPressed: () {
            //         setState(() {
            //           widget._content = 'content2';
            //           dif = 0;
            //         });
            //       },
            //       child: const Image(
            //         image: AssetImage('assets/components/good.png'),
            //       ),
            //     ),
            //     const Spacer(),
            //     TextButton(
            //       onPressed: () {
            //         setState(() {
            //           widget._content = 'content3';
            //           dif = 0;
            //         });
            //       },
            //       child: const Image(
            //         image: AssetImage('assets/components/improv.png'),
            //       ),
            //     ),
            //     const Spacer(),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                TextButton(
                    onPressed: () {
                      if (_getEventsInMonth(dif)[0].content2.isNotEmpty) {
                        setState(() {
                          dif++;
                        });
                      } else
                        print(1);
                    },
                    child: const Text(
                      '<',
                      style: TextStyle(
                          fontFamily: 'Medium',
                          color: Color(0xff3E3E3E),
                          fontSize: 24,
                          fontWeight: FontWeight.w200),
                    )),
                const Spacer(),
                displayDateTime(dif),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (dif > 0) dif--;
                      });
                    },
                    child: const Text(
                      '>',
                      style:  TextStyle(
                          color: Color(0xff3E3E3E),
                          fontFamily: 'Medium',
                          fontSize: 24,
                          fontWeight: FontWeight.w200),
                    )),
                const Spacer(),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _getEventsInMonth(dif).length,
                  itemBuilder: (BuildContext context, int index) {
                    if (widget._content == 'content1') {
                      return ListTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children:[ 
                                      const SizedBox(
                                        width: 347,
                                        height: 553,
                                        child: Image(image: AssetImage('assets/components/dialog.png'),fit: BoxFit.fill,),
                                      ),
                                      Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.fromLTRB(0, 80, 0, 100),
                                      width: 306,
                                      height: 324,
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(DateFormat('yyyy/MM/dd').format(_getEventsInMonth(dif)[index].eventDay)+ ' '
                                                    +returnKoreanDay2(
                                              _getEventsInMonth(dif)[index]
                                                  .eventDay),
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                    fontFamily: 'Bold', fontSize: 24),),
                                          ),
                                          const SizedBox(height: 15,),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 285,
                                            child: SingleChildScrollView(
                                                child: Text(_getEventsInMonth(dif)[index].content1,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  color: Colors.black, 
                                                  fontFamily: 'Medium', 
                                                  fontSize: 20),),
                                              ),
                                          ),
                                        ],
                                      )
                                    ),
                                    Container(
                                      width: 321,
                                      height: 44,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF0F0F0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          ),
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 470, 0, 0),
                                      child: TextButton(
                                        child: const Text('확인',
                                        style:  TextStyle(
                                          color: Colors.black,
                                    fontFamily: 'Bold', fontSize: 20)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )
                                  ]),
                                );
                              });
                        },
                        title: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  _getEventsInMonth(dif)[index]
                                          .eventDay
                                          .day
                                          .toString() +
                                      '일 ' +
                                      returnKoreanDay2(
                                          _getEventsInMonth(dif)[index]
                                              .eventDay),
                                  style: const TextStyle(
                                      fontFamily: 'Bold', fontSize: 20),
                                ),
                              ),
                              Text(_getEventsInMonth(dif)[index].content1,
                                  maxLines: 3,
                                  style: const TextStyle(
                                      fontFamily: 'Medium', fontSize: 18)),
                              const SizedBox(height: 20,),
                              const DottedLine(
                                dashLength: 6,
                                dashColor: Color(0xff818181),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (widget._content == 'content2') {
                      return ListTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children:[ 
                                      const SizedBox(
                                        width: 347,
                                        height: 553,
                                        child: Image(image: AssetImage('assets/components/dialog.png'),fit: BoxFit.fill,),
                                      ),
                                      Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.fromLTRB(0, 80, 0, 100),
                                      width: 306,
                                      height: 324,
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(DateFormat('yyyy/MM/dd').format(_getEventsInMonth(dif)[index].eventDay)+ ' '
                                                    +returnKoreanDay2(
                                              _getEventsInMonth(dif)[index]
                                                  .eventDay),
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                    fontFamily: 'Bold', fontSize: 24),),
                                          ),
                                          const SizedBox(height: 15,),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 285,
                                            child: SingleChildScrollView(
                                                child: Text(_getEventsInMonth(dif)[index].content2,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  color: Colors.black, 
                                                  fontFamily: 'Medium', 
                                                  fontSize: 20),),
                                              ),
                                          ),
                                        ],
                                      )
                                    ),
                                    Container(
                                      width: 321,
                                      height: 44,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF0F0F0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          ),
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 470, 0, 0),
                                      child: TextButton(
                                        child: const Text('확인',
                                        style:  TextStyle(
                                          color: Colors.black,
                                    fontFamily: 'Bold', fontSize: 20)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )
                                  ]),
                                );
                              });
                        },
                        title: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                _getEventsInMonth(dif)[index]
                                        .eventDay
                                        .day
                                        .toString() +
                                    '일 ' +
                                    returnKoreanDay2(
                                        _getEventsInMonth(dif)[index]
                                            .eventDay),
                                style: const TextStyle(
                                    fontFamily: 'Bold', fontSize: 20),
                              ),
                            ),
                            Text(_getEventsInMonth(dif)[index].content2,
                                maxLines: 3,
                                style: const TextStyle(
                                    fontFamily: 'Medium', fontSize: 18)),
                            const SizedBox(height: 20,),
                              const DottedLine(
                                dashLength: 6,
                                dashColor: Color(0xff818181),
                              ),
                          ],
                        ),
                        )
                      );
                    } else {
                      return ListTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children:[ 
                                      const SizedBox(
                                        width: 347,
                                        height: 553,
                                        child: Image(image: AssetImage('assets/components/dialog.png'),fit: BoxFit.fill,),
                                      ),
                                      Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.fromLTRB(0, 80, 0, 100),
                                      width: 306,
                                      height: 324,
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(DateFormat('yyyy/MM/dd').format(_getEventsInMonth(dif)[index].eventDay)+ ' '
                                                    +returnKoreanDay2(
                                              _getEventsInMonth(dif)[index]
                                                  .eventDay),
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                    fontFamily: 'Bold', fontSize: 24),),
                                          ),
                                          const SizedBox(height: 15,),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 285,
                                            child: SingleChildScrollView(
                                                child: Text(_getEventsInMonth(dif)[index].content3,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  color: Colors.black, 
                                                  fontFamily: 'Medium', 
                                                  fontSize: 20),),
                                              ),
                                          ),
                                        ],
                                      )
                                    ),
                                    Container(
                                      width: 321,
                                      height: 44,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF0F0F0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          ),
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 470, 0, 0),
                                      child: TextButton(
                                        child: const Text('확인',
                                        style:  TextStyle(
                                          color: Colors.black,
                                    fontFamily: 'Bold', fontSize: 20)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )
                                  ]),
                                );
                              });
                        },
                        title: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                _getEventsInMonth(dif)[index]
                                        .eventDay
                                        .day
                                        .toString() +
                                    '일 ' +
                                    returnKoreanDay2(
                                        _getEventsInMonth(dif)[index]
                                            .eventDay),
                                style: const TextStyle(
                                    fontFamily: 'Bold', fontSize: 20),
                              ),
                            ),
                            Text(_getEventsInMonth(dif)[index].content3,
                                maxLines: 3,
                                style: const TextStyle(
                                    fontFamily: 'Medium', fontSize: 18)),
                            const SizedBox(height: 20,),
                              const DottedLine(
                                dashLength: 6,
                                dashColor:  Color(0xff818181),
                              ),
                          ],
                        ),
                        )
                      );
                    }
                  }),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
