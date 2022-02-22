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
                contentPadding: const EdgeInsets.fromLTRB(22, 36, 35, 33),
                title: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    Image(image:
                      AssetImage('assets/soso_character/soso_main.png'),
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
                  Navigator.pop(context);
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
                    Image(image:
                      AssetImage('assets/components/folder.png'),
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
                    Image(image:
                      AssetImage('assets/components/folder.png'),
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
                    Image(image:
                      AssetImage('assets/components/folder.png'),
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
        ),
    );
  }
}