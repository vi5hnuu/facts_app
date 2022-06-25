import 'facts.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const FactPage());
}

class FactPage extends StatelessWidget {
  const FactPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facts',
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text("Do you know ?".toUpperCase()),
          centerTitle: true,
        ),
        body:const Fact(),
      ),
    );
  }
}

class Fact extends StatefulWidget {
  const Fact({Key? key}) : super(key: key);
  @override
  State<Fact> createState() => _Fact();
}

class _Fact extends State<Fact> {
  late int totalFact=facts.length;
  int factNo=0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(Icons.replay_5,size: 40,color: Colors.green),
                  onTap: (){setState(() {
                    if(factNo>=4)
                      factNo-=4;
                  });},
                ),
                GestureDetector(
                  child: Icon(Icons.restart_alt,size: 70,color: Colors.red,),
                  onTap: (){setState(() {
                    factNo=0;
                  });},
                ),
                GestureDetector(
                  child: Icon(Icons.forward_5,size: 40,color: Colors.green,),
                  onTap: (){setState(() {
                    if(factNo<totalFact-5)
                        factNo+=5;
                  });},
                ),
              ],
            ),
          ),
          ListTile(
            minLeadingWidth: 15,
            minVerticalPadding: 50,
            horizontalTitleGap: 2,
            leading: TextButton(
              child: Icon(Icons.navigate_before,size: 30,color: Colors.white,),
              onPressed: (){
                setState(() {
                  factNo=(factNo-1)%totalFact;
                });
              },
            ),
            title: Text(
              "${facts[factNo][0].toUpperCase()}",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Source_Sans_Pro",
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "${facts[factNo][1]}",
              style: TextStyle(
                  fontFamily: "sans-serif",
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.grey[500]
              ),
              textAlign: TextAlign.justify,
            ),
            trailing: TextButton(
              child: Icon(Icons.navigate_next,size: 30,color: Colors.white,),
              onPressed: (){
                setState(() {
                  factNo=(factNo+1)%totalFact;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
