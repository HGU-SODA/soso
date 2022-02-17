import 'package:flutter/material.dart';
import 'package:soso/onboarding_4.dart';

void main() => runApp(MyApp());

// 단축어 stl
// MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: onboarding_4(),
    );
  }
}

// MyPage
class ham extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        //title: Text('Appbar icon menu'),
        //centerTitle: true, // 중앙 정렬
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
            // pubspec.yaml 파일에 assets 주석에 이미지 추가하기
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(22, 36, 35, 33),
              title: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Image.asset(
                    'assets/soso_character/soso main.png',
                    height: 56,
                    width: 56,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                  ),
                  const Text(
                    '은비',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Bold',
                    ),
                  ),
                  /*const Text(
                    '22000723@handong.edu',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Bold',
                      color: Colors.grey,
                    ),
                  )*/
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Center(
              child: SizedBox(
                  width: 283,
                  child:
                      Divider(thickness: 0.5, height: 0.5, color: Colors.grey)),
            ),

            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  const Text(
                    '질문들',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Bold',
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Image.asset(
                    'assets/folder.png',
                    height: 16,
                    width: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                  ),
                  const Text(
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
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
            ),

            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Image.asset(
                    'assets/folder.png',
                    height: 16,
                    width: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                  ),
                  const Text(
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
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Image.asset(
                    'assets/folder.png',
                    height: 16,
                    width: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                  ),
                  const Text(
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
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
            ),
            Center(
              child: SizedBox(
                  width: 283,
                  child:
                      Divider(thickness: 0.5, height: 0.5, color: Colors.grey)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(22, 24, 225, 430),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => onboarding_4()),
                  );
                },
                child: Text(
                  '초기화',
                  style: TextStyle(
                      fontFamily: 'Medium', fontSize: 16, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
