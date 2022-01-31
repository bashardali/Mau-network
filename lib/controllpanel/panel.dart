import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mau/controllpanel/addnews.dart';
import 'package:mau/controllpanel/addtask.dart';
import 'package:mau/controllpanel/requestbox.dart';
import 'package:mau/controllpanel/sendnote.dart';
import 'package:mau/pages/tasks.dart';
class Panel extends StatefulWidget {
  const Panel({Key? key}) : super(key: key);

  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Panel'),
        titleTextStyle:TextStyle( color :Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,

      ) ,
      body:SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            //manage daily  tasks by app admin
          Center(

            child: Row(
              children: [
                
                Text('Gifts             ',style: TextStyle( fontSize: 30), textAlign: TextAlign.left,),
                Container(

                  padding: EdgeInsets.all(20),
                  margin:EdgeInsets.all(20) ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.yellow.shade600
                  ),
                  child: InkWell(
                    focusColor: Colors.green,
                  hoverColor:  Colors.red ,

                  onTap: (){
                      Get.to(Addtask());
                  },
                    child: Icon(CommunityMaterialIcons.gift, color: Colors.white,size: 40,),  ),

                  ),
              ],
            ),
            ),
          Divider(
            color: Colors.black87,
            thickness: 2,
          ),
            // manage news columen in the home screen bu app admin
            Center(

              child: Row(
                children: [

                  Text('News             ',style: TextStyle( fontSize: 30), textAlign: TextAlign.left,),
                  Container(

                    padding: EdgeInsets.all(20),
                    margin:EdgeInsets.all(20) ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.yellow.shade600
                    ),
                    child: InkWell(
                      focusColor: Colors.green,
                      hoverColor:  Colors.red ,

                      onTap: (){
                        Get.to(Addnews());
                      },
                      child: Icon(CommunityMaterialIcons.newspaper, color: Colors.white,size: 40,),  ),

                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black87,
              thickness: 2,
            ),
            // manage Notifications by app admin
            Center(

              child: Row(
                children: [

                  Text('Notifications ',style: TextStyle( fontSize: 30), textAlign: TextAlign.left,),
                  Container(

                    padding: EdgeInsets.all(20),
                    margin:EdgeInsets.all(20) ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.yellow.shade600
                    ),
                    child: InkWell(
                      focusColor: Colors.green,
                      hoverColor:  Colors.red ,

                      onTap: (){
                        Get.to(Sendnote());
                      },
                      child: Icon(CommunityMaterialIcons.note, color: Colors.white,size: 40,),  ),

                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black87,
              thickness: 2,
            ),
            //manage Requests recieved from withdraw screens
            Center(

              child: Row(
                children: [

                  Text('Requests box',style: TextStyle( fontSize: 30), textAlign: TextAlign.left,),
                  Container(

                    padding: EdgeInsets.all(20),
                    margin:EdgeInsets.all(20) ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.yellow.shade600
                    ),
                    child: InkWell(
                      focusColor: Colors.green,
                      hoverColor:  Colors.red ,

                      onTap: (){
                        Get.to(Requestbox());
                      },
                      child: Icon(CommunityMaterialIcons.frequently_asked_questions, color: Colors.white,size: 40,),  ),

                  ),
                ],
              ),
            ),


            //
            // // users requests
            // Container(
            //   padding: EdgeInsets.all(20),
            //   margin:EdgeInsets.all(20) ,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: Colors.yellow.shade600
            //   ),
            //   child: InkWell(
            //     onTap: (){},
            //     child: Text('Users requests',style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center,  ),
            //
            //   ),
            // )

        ],

        ),
      ) ,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
