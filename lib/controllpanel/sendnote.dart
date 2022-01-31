import 'package:flutter/material.dart';
class Sendnote extends StatefulWidget {
  const Sendnote({Key? key}) : super(key: key);

  @override
  _SendnoteState createState() => _SendnoteState();
}

class _SendnoteState extends State<Sendnote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('notification box'),
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
