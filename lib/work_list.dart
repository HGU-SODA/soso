import 'package:flutter/material.dart';

class WList extends StatefulWidget {
  const WList({Key? key}) : super(key: key);

  @override
  State<WList> createState() => _WListState();
}

class _WListState extends State<WList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      iconSize: 45,
                      icon: const Image(image: AssetImage('assets/components/back.png'),),
                      ),
                  ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: const Text('질문들', style: TextStyle(fontFamily: 'Medium', fontSize: 20)))
                ],
              ),
              Row(
              children: [
                const Spacer(),
                TextButton(onPressed: (){},child: Text('진행한 일',style: TextStyle(fontFamily: 'Medium',fontSize:20,color: Colors.black ),)),
                // const Spacer(),
                TextButton(onPressed: (){},child: Text('잘한 점/아쉬운 점',style: TextStyle(fontFamily: 'Medium',fontSize:20,color: Colors.black )), ),
                // const Spacer(),
                TextButton(onPressed: (){}, child: Image(image: AssetImage('assets/components/improv.png'),),),
                const Spacer(),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                IconButton(onPressed: (){}, icon: Image(image: AssetImage('assets/components/ing.png'),),iconSize: 100,),
                const Spacer(),
                IconButton(onPressed: (){}, icon: Image(image: AssetImage('assets/components/good.png'),),iconSize: 140),
                const Spacer(),
                IconButton(onPressed: (){}, icon: Image(image: AssetImage('assets/components/improv.png'),),iconSize: 100),
                const Spacer(),
              ],
            )
        ],
        
      ),
    );
  }
}