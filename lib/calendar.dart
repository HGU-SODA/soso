// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:soso/writing_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'utils.dart';
import 'work_list.dart';

class Main_Calendar extends StatefulWidget {
  const Main_Calendar({Key? key, required DateTime dday}) : _dday =dday, super(key: key);

  final DateTime? _dday;

  @override
  Main_CalendarState createState() => Main_CalendarState();
}

class Main_CalendarState extends State<Main_Calendar> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime now = DateTime.now();

  List<String> dayList = ['월', '화', '수', '목', '금', '토', '일'];

  @override
  void initState() {
    super.initState();
    setState(() {});
    _focusedDay = widget._dday!;
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  static String returnKoreanDay(DateTime day) {
    String? KDay = '';
    if (DateFormat('E').format(day) == 'Mon') {
      KDay = '월';
    } else if (DateFormat('E').format(day) == 'Tue') {
      KDay = '화';
    } else if (DateFormat('E').format(day) == 'Wed') {
      KDay = '수';
    } else if (DateFormat('E').format(day) == 'Thu') {
      KDay = '목';
    } else if (DateFormat('E').format(day) == 'Fri') {
      KDay = '금';
    } else if (DateFormat('E').format(day) == 'Sat') {
      KDay = '토';
    } else if (DateFormat('E').format(day) == 'Sun') {
      KDay = '일';
    }

    return KDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onDaySelected2(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
    Navigator.pop(context);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      // appBar: AppBar(backgroundColor: Colors.transparent,),
      drawer: DrawerSection(context),
      body: Stack(children: [
        const Image(
          image: AssetImage('assets/bg2.png'),
          fit: BoxFit.fill,
        ),
        Center(
          child: Container(
            height: 550,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 240, bottom: 20),
            child: const Image(
              // alignment: Alignment.bottomCenter,
              image: AssetImage('assets/components/mainpage_memo.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      _scaffoldState.currentState!.openDrawer();
                    },
                    icon: const Icon(Icons.menu))),
            calendar_section(),
            const SizedBox(height: 45.0),
            list_section(),
            const SizedBox(
              height: 45,
            )
          ],
        ),
      ]),
    );
  }

  Drawer DrawerSection(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
          // pubspec.yaml 파일에 assets 주석에 이미지 추가하기
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(22, 45, 35, 33),
            title: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Image(
                  image: AssetImage('assets/soso_character/soso_main.png'),
                  height: 56,
                  width: 56,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                ),
                Text(
                  '은비',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Bold',
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Center(
            child: SizedBox(
                width: 283,
                child:
                    Divider(thickness: 0.5, height: 0.5, color: Colors.grey)),
          ),
          ListTile(
            title: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Text(
                  '질문들',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Bold',
                  ),
                )
              ],
            ),
            onTap: () {
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
          ),
          ListTile(
            title: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Image(
                  image: AssetImage('assets/components/folder.png'),
                  height: 16,
                  width: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12),
                ),
                Text(
                  '진행한 일',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Medium',
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WList(
                          content: 'content1',
                        )),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
          ),
          ListTile(
            title: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Image(
                  image: AssetImage('assets/components/folder.png'),
                  height: 16,
                  width: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12),
                ),
                Text(
                  '잘한 점/아쉬운 점',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Medium',
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WList(
                          content: 'content2',
                        )),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
          ),
          ListTile(
            title: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Image(
                  image: AssetImage('assets/components/folder.png'),
                  height: 16,
                  width: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12),
                ),
                Text(
                  '개선할 점',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Medium',
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WList(
                          content: 'content3',
                        )),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
          ),
          const Center(
            child: SizedBox(
                width: 283,
                child:
                    Divider(thickness: 0.5, height: 0.5, color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  Expanded list_section() {
    return Expanded(
      child: ValueListenableBuilder<List<Event>>(
        valueListenable: _selectedEvents,
        builder: (context, value, Widget? child) {
          if (value.length == 0) {
            return ListTile(
              title: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: const Image(
                      image: AssetImage('assets/soso_character/soso_main.png'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 18, 0, 12),
                    child: const Text('오늘의 회고가 아직 등록되지 않았어요!',
                    style: TextStyle(
                                        fontFamily: 'Medium', fontSize: 20,color: Color(0xff50555C))),
                  ),
                  const Text('회고를 적으러 가볼까요?',
                  style: TextStyle(
                                      fontFamily: 'Medium', fontSize: 20,color: Color(0xff50555C))),
                  Center(
                    child: Container(
                      width: 280,
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => writing_page(
                                      date: _selectedDay,
                                    )),
                          );
                          
                        },
                        child: Row(
                          children: [
                            const SizedBox(
                                width: 230,
                                child: Text(
                                  ' 오늘의 회고 적으러 가기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Medium', fontSize: 24,color: Color(0xff3E3E3E)),
                                )),
                            Container(
                              margin: const EdgeInsets.only(right: 0),
                              child: const Image(
                                image: AssetImage(
                                    'assets/components/pencil_m.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide(width: 3),
                      )),
                    ),
                  )
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Container(
                      margin: const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value[index].title1,
                              style: const TextStyle(
                                  fontFamily: 'Bold',
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              value[index].content1,
                              style: const TextStyle(
                                  fontFamily: 'Medium',
                                  fontSize: 16,
                                  color: Color(0xff3E3E3E)),
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            Text(
                              value[index].title2,
                              style: const TextStyle(
                                  fontFamily: 'Bold',
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              value[index].content2,
                              style: const TextStyle(
                                  fontFamily: 'Medium',
                                  fontSize: 16,
                                  color: Color(0xff3E3E3E)),
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            Text(
                              value[index].title3,
                              style: const TextStyle(
                                  fontFamily: 'Bold',
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              value[index].content3,
                              style: const TextStyle(
                                  fontFamily: 'Medium',
                                  fontSize: 16,
                                  color: Color(0xff3E3E3E)),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          );
        },
      ),
    );
  }

  Future<dynamic> month_calendar_dialog() {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: const Color(0xffFFFFFE),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: Stack(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: 311,
                height: 540,
                child: TableCalendar<Event>(
                  availableGestures: AvailableGestures.horizontalSwipe,
                  firstDay: kFirstDay,
                  lastDay: kToday,
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  rangeStartDay: _rangeStart,
                  rangeEndDay: _rangeEnd,
                  calendarFormat: CalendarFormat.month,
                  rangeSelectionMode: _rangeSelectionMode,
                  eventLoader: _getEventsForDay,
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  rowHeight: 70,
                  headerStyle: const HeaderStyle(
                      leftChevronVisible: true,
                      rightChevronVisible: true,
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        fontFamily: 'Bold',
                        fontSize: 24,
                      )),
                  calendarBuilders: CalendarBuilders(
                    todayBuilder: (context, day, focusedDay) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: (_getEventsForDay(day).isNotEmpty)
                                ? Image(
                                    image: AssetImage(
                                        _getEventsForDay(day)[0].emotion))
                                : null,
                          ),
                          Text(
                            day.day.toString(),
                            style: const TextStyle(
                              fontFamily: 'Medium',
                              color: Color(0xff818181),
                              fontSize: 12,
                            ),
                          )
                        ],
                      );
                    },
                    defaultBuilder: (context, day1, day2) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: (_getEventsForDay(day1).isNotEmpty)
                                ? Image(
                                    image: AssetImage(
                                        _getEventsForDay(day1)[0].emotion))
                                : null,
                          ),
                          Text(
                            day1.day.toString(),
                            style: const TextStyle(
                                fontFamily: 'Medium', fontSize: 12, color: Color(0xff818181),),
                          )
                        ],
                      );
                    },
                    outsideBuilder: (context, day1, day2) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: (_getEventsForDay(day1).isEmpty)
                                ? Image(
                                    image: AssetImage(
                                        _getEventsForDay(day1)[0].emotion))
                                : null,
                          ),
                          Text(
                            day1.day.toString(),
                            style: const TextStyle(
                                fontFamily: 'Medium', fontSize: 12,color: Color(0xff818181)),
                          )
                        ],
                      );
                    },
                    selectedBuilder: (context, day1, day2) {
                      return Container(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: (_getEventsForDay(day1).isNotEmpty)
                                  ? Image(
                                      image: AssetImage(
                                          _getEventsForDay(day1)[0].emotion))
                                  : null,
                            ),
                            Text(
                              day1.day.toString(),
                              style: const TextStyle(
                                fontFamily: 'Medium',
                                fontSize: 12,
                                color: Color(0xff818181),
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    markerBuilder: (context, date, list) {
                      if (list.isEmpty) return Container();
                      return Container();
                    },
                    dowBuilder: (context, day) {
                      return Center(
                          child: Text(
                        returnKoreanDay(day),
                        style:
                            const TextStyle(fontFamily: 'Medium', fontSize: 12),
                      ));
                    },
                    headerTitleBuilder: (context, day) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            DateFormat('yyyy\nMMMM').format(day),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Bold', fontSize: 24),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                    disabledBuilder: (context, day, focusedDay) {
                      return Column(
                        children: [
                          const SizedBox(
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            day.day.toString(),
                            style: const TextStyle(
                                fontFamily: 'Medium', fontSize: 12, color: Color(0xff818181),),
                          )
                        ],
                      );
                    },
                  ),
                  daysOfWeekHeight: 20,
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(fontFamily: 'Bold'),
                    weekendStyle: TextStyle(fontFamily: 'Bold'),
                  ),
                  calendarStyle: const CalendarStyle(
                    // Use `CalendarStyle` to customize the UI
                    outsideDaysVisible: false,
                    weekendTextStyle: TextStyle(fontFamily: 'Bold'),
                    disabledTextStyle:
                        TextStyle(fontFamily: 'Bold', color: Colors.grey),
                    outsideTextStyle: TextStyle(fontFamily: 'Bold'),
                    holidayTextStyle: TextStyle(fontFamily: 'Bold'),
                    selectedTextStyle: TextStyle(fontFamily: 'Bold'),
                    todayTextStyle: TextStyle(
                      fontFamily: 'Bold',
                      decoration: TextDecoration.underline,
                    ),
                    defaultTextStyle: TextStyle(fontFamily: 'Bold'),
                  ),
                  onDaySelected: _onDaySelected2,
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ),
            ]));
      },
    );
  }

  TableCalendar<Event> calendar_section() {
    return TableCalendar<Event>(
      availableGestures: AvailableGestures.horizontalSwipe,
      firstDay: kFirstDay,
      lastDay: kToday,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      rangeStartDay: _rangeStart,
      rangeEndDay: _rangeEnd,
      calendarFormat: _calendarFormat,
      rangeSelectionMode: _rangeSelectionMode,
      eventLoader: _getEventsForDay,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      rowHeight: 70,
      headerStyle: const HeaderStyle(
          leftChevronVisible: false,
          rightChevronVisible: false,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            fontFamily: 'Bold',
          )),
      calendarBuilders: CalendarBuilders(
        todayBuilder: (context, day, focusedDay) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                width: 40,
                height: 40,
                child: (_getEventsForDay(day).isEmpty)
                    ? null
                    : Image(
                        image: AssetImage(
                          _getEventsForDay(day)[0].emotion,
                        ),
                      ),
              ),
              Text(
                day.day.toString(),
                style: const TextStyle(
                  fontFamily: 'Medium',
                  fontSize: 12,
                  color: Color(0xff818181),
                ),
              )
            ],
          );
          // Container(
          //   margin: const EdgeInsets.only(bottom: 4),
          //   child: Text(
          //     day.day.toString(),
          //     style: const TextStyle(fontFamily: 'Medium', fontSize: 12,
          //     decoration: TextDecoration.underline,),
          //   ),
          // );
        },
        defaultBuilder: (context, day1, day2) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                width: 40,
                height: 40,
                child: (_getEventsForDay(day1).isEmpty)
                    ? null
                    : Image(
                        image: AssetImage(
                          _getEventsForDay(day1)[0].emotion,
                        ),
                      ),
              ),
              Text(
                day1.day.toString(),
                style: const TextStyle(
                  fontFamily: 'Medium',
                  color: Color(0xff818181),
                  fontSize: 12,
                ),
              )
            ],
          );
        },
        outsideBuilder: (context, day1, day2) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                width: 40,
                height: 40,
                child: (_getEventsForDay(day1).isEmpty)
                    ? null
                    : Image(
                        image: AssetImage(
                          _getEventsForDay(day1)[0].emotion,
                        ),
                      ),
              ),
              Text(
                day1.day.toString(),
                style: const TextStyle(
                  fontFamily: 'Medium',
                  fontSize: 12,
                  // decoration: TextDecoration.underline,
                ),
              )
            ],
          );
        },
        selectedBuilder: (context, day1, day2) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                width: 48,
                height: 48,
                child: (_getEventsForDay(day1).isEmpty)
                    ? null
                    : Image(
                        image: AssetImage(
                          _getEventsForDay(day1)[0].emotion,
                        ),
                      ),
              ),
              Text(
                day1.day.toString(),
                style: const TextStyle(
                  fontFamily: 'Medium',
                  fontSize: 12,
                  color: Color(0xff3E3E3E),
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          );
        },
        markerBuilder: (context, date, list) {
          // if (list.isEmpty)
          return Container();
          // String emotion = list[0].emotion;

          // if (date == _selectedDay) {
          //   return Positioned(
          //     top: 0,
          //     child: SizedBox(
          //         width: 54,
          //         height: 54,
          //         child: Image(
          //           image: AssetImage(emotion),
          //         )),
          //   );
          // }
          // return Positioned(
          //   top: 6,
          //   child: SizedBox(
          //       width: 40,
          //       height: 40,
          //       child: Image(
          //         image: AssetImage(emotion),
          //       )),
          // );
        },
        dowBuilder: (context, day) {
          return Center(
              child: Text(
            returnKoreanDay(day),
            style: const TextStyle(fontFamily: 'Medium', fontSize: 12, color: Color(0xff818181),),
          ));
        },
        headerTitleBuilder: (context, day) {
          return Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              Text(
                DateFormat('yyyy년 MM월').format(day),
                style: const TextStyle(fontFamily: 'Bold', fontSize: 24),
              ),
              const Spacer(),
              // const SizedBox(
              //   width: 100,
              // ),
              IconButton(
                  padding: const EdgeInsets.only(left: 30),
                  // alignment: Alignment.centerRight,
                  iconSize: 48,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => writing_page(
                                date: _selectedDay,
                              )),
                    );
                  },
                  icon: const Image(
                    image: AssetImage('assets/components/icon_pencil.png'),
                  )),
              IconButton(
                  padding: const EdgeInsets.only(right: 10),

                  // alignment: Alignment.bottomCenter,
                  iconSize: 48,
                  onPressed: () {
                    month_calendar_dialog();
                  },
                  icon: const Image(
                      image: AssetImage('assets/components/calendar2.png'))),
            ],
          );
        },
        disabledBuilder: (context, day, focusedDay) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                width: 48,
                height: 48,
              ),
              Text(
                day.day.toString(),
                style: const TextStyle(
                  fontFamily: 'Medium',
                  fontSize: 12,
                  color: Color(0xff818181),
                ),
              )
            ],
          );
        },
      ),

      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(fontFamily: 'Bold'),
        weekendStyle: TextStyle(fontFamily: 'Bold'),
      ),
      calendarStyle: const CalendarStyle(
        // Use `CalendarStyle` to customize the UI
        outsideDaysVisible: false,
        weekendTextStyle: TextStyle(fontFamily: 'Bold'),
        disabledTextStyle: TextStyle(fontFamily: 'Bold', color: Colors.grey),
        outsideTextStyle: TextStyle(fontFamily: 'Bold'),
        holidayTextStyle: TextStyle(fontFamily: 'Bold'),
        selectedTextStyle: TextStyle(fontFamily: 'Bold'),
        todayTextStyle: TextStyle(
          fontFamily: 'Bold',
          decoration: TextDecoration.underline,
        ),
        defaultTextStyle: TextStyle(fontFamily: 'Bold'),
      ),
      onDaySelected: _onDaySelected,
      // onRangeSelected: _onRangeSelected,
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
