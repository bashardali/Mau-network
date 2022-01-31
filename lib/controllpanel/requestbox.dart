import 'package:flutter/material.dart';
class Requestbox extends StatefulWidget {
  const Requestbox({Key? key}) : super(key: key);

  @override
  _RequestboxState createState() => _RequestboxState();
}

class _RequestboxState extends State<Requestbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Requesbox'),
        titleTextStyle:TextStyle( color :Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,

      ) ,
      body:SingleChildScrollView(
        child: Column(

        ),
      ) ,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
