// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title1 = '진행한 일';
  final String title2 = '잘한 점';
  final String title3 = '개선할 점';
  String content1;
  String content2;
  String content3;
  String emotion;
  
  Event(this.content1,this.content2,this.content3, this.emotion);
  
  @override
  String toString() => title1+'\n'+content1+'\n'+title2+'\n'+content2+'\n'+title3+'\n'+content3;
  

}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = { for (var item in List.generate(50, (index) => index)) DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5) : List.generate(
        item % 4 + 1, (index) => Event('1','2','3','assets/soso_icon/icon_pink2.png'),) }
  ..addAll({
    kToday: [
      Event('1','2','3','assets/soso_icon/icon_blue2.png'),
      Event('1','2','3','assets/soso_icon/icon_blue2.png'),
    ],
    kFirstDay: [
      Event('1','2','3-2','assets/soso_icon/icon_blue2.png')
    ]
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
