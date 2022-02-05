import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mau/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mau/pages/loading.dart';
class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);
  @override
  _ExampleState createState() => _ExampleState();
}
int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60*60*24;
class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

      CountdownTimer(
      endTime: endTime,
        onEnd: (){
         Get.off(Loading());
        },
      textStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,



      ),
    ),
          ElevatedButton(onPressed: (){

          }, child: Icon(Icons.add , size: 40,))
        ],
      ),
    );
  }
}
