import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Addtask extends StatefulWidget {
  const Addtask({Key? key}) : super(key: key);

  @override
  _AddtaskState createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  final _formKey = GlobalKey<FormState>();
  //int index = 0;

  String title = "";

  String link = "";
  String prize = "";

  String title1 = "first daily task title";

  String link1 = "https://www.google.com";
  String prize1 = "200 Maus";

  final titleController = TextEditingController();

  final linkController = TextEditingController();
  final prizeController = TextEditingController();

  addtask(){
    setState(() {
      title = titleController.text;
      link =linkController.text;
      prize = prizeController.text;
    });
  }
  addtask1(){
    setState(() {
      title1 = title;
      link1 =link;
      prize1 = prize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('tasks'),
        titleTextStyle:TextStyle( color :Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,

      ) ,
      body:SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                  controller: titleController,
                    keyboardType: TextInputType.text,
                   // initialValue: '',
                    maxLines: 2,
                    decoration:InputDecoration(
                      hintText: 'write the daily task here',
                    label: Text('task',),

                      ),

                    ) ,
                  TextFormField(
                    controller : linkController,
                    keyboardType: TextInputType.url,
                 //   initialValue: ,
                    maxLines: 1,
                    decoration:InputDecoration(
                      label: Text('link',),
                      hintText: 'input the link to video or site must user visit!',

                    ),

                  ) ,
                  TextFormField(
                    controller : prizeController,
                    keyboardType: TextInputType.number,
                    //   initialValue: ,
                    maxLines: 1,
                    decoration:InputDecoration(
                      label: Text('prize',),
                      hintText: 'the prize in Maus coins',

                    ),

                  ) ,
                  Center(
                    child: MaterialButton(

                      onPressed: addtask,
                      child: Text('submit' , style: TextStyle(color: Colors.white),),
                      elevation: 0,
                      color: Colors.yellow.shade600,
                    ),
                  ),
                  SizedBox(

                    height: 20,),
                  Container(
                    padding: EdgeInsets.all(20),
                   // height: 120,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: Colors.yellow.shade600,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:Column(
                      children: [
                        Text('$title',style: TextStyle(color: Colors.white,fontSize: 20 , fontWeight: FontWeight.bold),),
                        Text('$link',style: TextStyle(color: Colors.white,fontSize: 20 , fontWeight: FontWeight.bold)),
                        Text('$prize',style: TextStyle(color: Colors.white,fontSize: 20 , fontWeight: FontWeight.bold)),

                      ],
                    ) ,

                  ),
                  Center(
                    child: MaterialButton(

                      onPressed: addtask1,
                      child: Text('publish' , style: TextStyle(color: Colors.white),),
                      elevation: 0,
                      color: Colors.yellow.shade600,
                    ),
                  ),
                  SizedBox(
                    child: Text('how the app will shows the tasks'),
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
           itemBuilder: (context,i) => Container(

             decoration: BoxDecoration(
               color: Colors.yellow.shade600,
               borderRadius: BorderRadius.circular(20),
             ),
             padding: EdgeInsets.all(10),
          //   height: 150,
             child: Column(
               children: [

                  Row(
                    children: [
                      Image( width: 30,height: 60, image: AssetImage("images/mau.png"),),
                      Text(' the prize for this task is $prize1', style: TextStyle(color: Colors.white)),
                      Divider(
                          thickness: 1, color: Colors.white

                      ),

                    ],
                  ),
                 InkWell(
                   onTap: (){},
                   child: Column(
                     children: [

                       Text('$title1',
                         style: TextStyle(color: Colors.white),),
                       SizedBox(height: 20,),
                       Text('$link1', style: TextStyle(color: Colors.white))

                     ],
                   ),
                 )

               ],
             ),
           ))

                ],
              ),
            ),

          ]


        ),
      ) ,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
