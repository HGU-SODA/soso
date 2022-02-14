// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';


import '../utils.dart';

class Main_Calender extends StatefulWidget {
  const Main_Calender({Key? key}) : super(key: key);

  @override
  _Main_CalenderState createState() => _Main_CalenderState();
}

class _Main_CalenderState extends State<Main_Calender> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime now = DateTime.now();

  List<String> dayList = ['월','화','수','목','금','토','일'];

  @override
  void initState() {
    super.initState();

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

  String returnKoreanDay(DateTime day){
    String? KDay = '';
    if(DateFormat('E').format(day) == 'Mon'){
      KDay = '월';
    } else if (DateFormat('E').format(day) == 'Tue'){
      KDay = '화';
      }else if (DateFormat('E').format(day) == 'Wed'){
      KDay = '수';
      }else if (DateFormat('E').format(day) == 'Thu'){
      KDay = '목';
      }else if (DateFormat('E').format(day) == 'Fri'){
      KDay = '금';
      }else if (DateFormat('E').format(day) == 'Sat'){
      KDay = '토';
      }else if (DateFormat('E').format(day) == 'Sun'){
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          kEvents.addAll(
           { 
             DateTime.utc(2022,1,1,1,1): [Event( '4', '4', '5')],
             kToday: [
      Event('테스트','2','3'),
      Event('2','3','3'),
    ],});

        },
        child: const Icon(Icons.add),
        ),
      appBar: AppBar(
        title: const Text('TableCalendar - Events'),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            
            availableGestures: AvailableGestures.horizontalSwipe,
            firstDay: kFirstDay,
            lastDay: kToday,
            // kLastDay,
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
              formatButtonVisible: false,
              titleTextStyle: TextStyle(fontFamily: 'Bold',)
            ),
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, focusedDay) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Text(day.day.toString(),
                    style: const TextStyle(fontFamily: 'Medium',
                    fontSize: 12),),);
              },
              defaultBuilder: (context,day1,day2){
                return Column(
                  children: [
                    const SizedBox(height: 8,),
                    Container(
                      width: 40,
                      height: 40,
                      // child: Image(image: AssetImage('assets/soso_icon/Icon_blue1.png'),)
                    ),
                    const SizedBox(height: 6,),
                    Container(child: Text(day1.day.toString(),
                    style: const TextStyle(fontFamily: 'Medium',
                    fontSize: 12),),)
                  ],
                );
              },
              outsideBuilder:(context,day1,day2){
                return Column(
                  children: [
                    const SizedBox(height: 8,),
                    Container(
                      width: 40,
                      height: 40,
                      // child: Image(image: AssetImage('assets/soso_icon/Icon_blue1.png'),)
                    ),
                    const SizedBox(height: 6,),
                    Container(child: Text(day1.day.toString(),
                    style: const TextStyle(fontFamily: 'Medium',
                    fontSize: 12),),)
                  ],
                );
              } ,
              selectedBuilder: (context,day1,day2){
                return Column(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      // child: Image(image: AssetImage('assets/soso_icon/Icon_blue1.png'),)
                    ),
                    Container(child: Text(day1.day.toString(),
                    style: const TextStyle(fontFamily: 'Medium',
                    fontSize: 12),),)
                  ],
                );
              } ,
              markerBuilder: (context, date, list){
                
                if (list.isEmpty) return Container();
                if (date == _selectedDay) 
                return Positioned(
                  top: 0,
                  child: Container(
                        width: 54,
                        height: 54,
                        child: const Image(image: AssetImage('assets/soso_icon/Icon_blue1.png'),)
                      ),
                );
                return Positioned(
                  top: 6,
                  child: Container(
                        width: 40,
                        height: 40,
                        child: const Image(image: AssetImage('assets/soso_icon/Icon_blue1.png'),)
                      ),
                );
              },
              dowBuilder: (context, day) {
                  return Center(
                    child: Text(
                    returnKoreanDay(day),
                  style: const TextStyle(fontFamily: 'Medium',
                  fontSize: 12),));
              },
              headerTitleBuilder: (context, day) {
                return Text(DateFormat('yyyy년 MM월').format(day),
                style: TextStyle(fontFamily: 'Bold',
                fontSize: 24),);
              },
              disabledBuilder: (context, day, focusedDay) {
                return Column(
                  children: [
                    const SizedBox(height: 8,),
                    const SizedBox(
                      width: 40,
                      height: 40,
                      // child: Image(image: AssetImage('../web/icons/Icon_blue1.png'),)
                    ),
                    const SizedBox(height: 6,),
                    Container(child: Text(day.day.toString(),
                    style: const TextStyle(fontFamily: 'Medium',
                    fontSize: 12),),)
                  ],
                );
              },
              ),

            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(fontFamily: 'Bold'),
              weekendStyle: TextStyle(fontFamily: 'Bold'), ),
            calendarStyle: const CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
              weekendTextStyle: TextStyle(fontFamily: 'Bold'),
              disabledTextStyle: TextStyle(fontFamily: 'Bold',
              color: Colors.grey),
              outsideTextStyle: TextStyle(fontFamily: 'Bold'),
              holidayTextStyle: TextStyle(fontFamily: 'Bold'),
              selectedTextStyle: TextStyle(fontFamily: 'Bold'),
              todayTextStyle: TextStyle(fontFamily: 'Bold'),
              defaultTextStyle: TextStyle(fontFamily: 'Bold'),
              rangeEndTextStyle: TextStyle(fontFamily: 'Bold'),
              rangeStartTextStyle: TextStyle(fontFamily: 'Bold'),
              withinRangeTextStyle: TextStyle(fontFamily: 'Bold'),
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
          ),
          const SizedBox(height: 38.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      // decoration: BoxDecoration(
                        // border: Border.all(),
                        // borderRadius: BorderRadius.circular(12.0),
                      // ),
                      // child: Container(
                      //   child: Text('여기에 카테고리별 리스트 출력'),
                      // ),
                      child: ListTile(
                        // onTap: () => print('${value[index]}'),
                        title: Text('${value[0]}',style: const TextStyle(
                          fontFamily: 'Medium',
                          fontSize: 16,
                        ),),
                      ),
                    );
                  },
                );
              },
            ),
          ),
            
        ],
      ),
    );
  }
}
