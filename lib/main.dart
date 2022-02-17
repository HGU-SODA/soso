// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'calender.dart';
import 'writing_page.dart';
import 'onboarding_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  
      // onboarding_1()
      const Main_Calender()
      // const writing_page()
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<String> famousSaying = ['의미없는 토론은 없다.'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          today(),
          sosoLogo(),
          todaysSaying(),
          todaysSayingContent(),
          retrospectionButton()
        ],
      )
    );
  }

  Container retrospectionButton() => Container(
    decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
    width: 256,
    height: 45,
    child: ElevatedButton(
      onPressed: (){}, 
      style: ElevatedButton.styleFrom(
        primary: const Color(0xffECECEC)
      ),
      child: const Text(
        '오늘의 회고 적으러 가기',
        style: TextStyle(color: Colors.black,
        fontSize: 18),
        )
    ),
  );

  Text todaysSaying() {
    return const Text('오늘의 한 마디',
        style: TextStyle(
          decoration: TextDecoration.underline
          ),
          );
  }

  Text todaysSayingContent() {
    return Text('"'+famousSaying[0]+'"',
        style: const TextStyle(fontSize: 24),);
  }

  Container sosoLogo() {
    return Container(
              width: 180,
              height: 180,
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, 
                  color: Color(0xffFCDA9D),
                  ),
              child: Image.asset(
                'assets/soso1.png',
              ),
            );
  }

  Center today() {
    return Center(
          child: Text(getToday(),
          // textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize:24 ) ,),
        );
  }

  Container bottomBar() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),        )
      ),
      
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedFontSize:11,
          unselectedFontSize:11,
          unselectedItemColor:Colors.grey[400],
          selectedItemColor: Colors.grey[900],
          iconSize:20,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (int index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              title: Text('홈'),
              icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
              title: Text('캘린더'),
                              icon: Icon(Icons.calendar_today)

            ),
            BottomNavigationBarItem(
              title: Text('리스트'),
              icon: Icon(Icons.list)

            ),
            BottomNavigationBarItem(
              title: Text('더보기'),
              icon: Icon(Icons.more)

            ),
          ],
          ),
      ),
    );
  }

  String getToday() {
    String strToday;
    DateTime now = DateTime.now(); 
    DateFormat formatter = DateFormat('yyyy년MM월dd일'); 
    strToday = formatter.format(now); 
    return strToday; 
    }

}
