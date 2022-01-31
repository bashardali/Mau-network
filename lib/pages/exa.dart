import 'package:mau/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Example extends StatefulWidget {
  //const Example({Key? key}) : super(key: key);
  final int balance ;
  final  int speed;
  final String username;
  final String useremail;
  const  Example(this.username,this.useremail,this.balance , this.speed);
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Get.to(Home());
          }, child: Icon(Icons.add , size: 40,))
        ],
      ),
    );
  }
}
