import 'package:flutter/material.dart';
class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('daily tasks'),
        titleTextStyle:TextStyle( color :Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,

      ) ,
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            //add task
            Container(
              padding: EdgeInsets.all(20),
              margin:EdgeInsets.all(20) ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context,index) => ListTile(

                    title: Text("daily task $index "),

                    tileColor: Colors.grey.shade200,

                  ),

              )
            ),
            // add news

            //send notification

            // users requests


          ],

        ),
      ) ,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
