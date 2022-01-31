import 'package:flutter/material.dart';
class Addnews extends StatefulWidget {
  const Addnews({Key? key}) : super(key: key);

  @override
  _AddnewsState createState() => _AddnewsState();
}

class _AddnewsState extends State<Addnews> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Addnews'),
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
