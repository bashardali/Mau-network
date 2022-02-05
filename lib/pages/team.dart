import 'package:firebase_auth/firebase_auth.dart';
import 'package:mau/controllers/homecontroller.dart';
import 'package:mau/controllpanel/Adminhome.dart';
import 'package:mau/pages/home.dart';
import 'package:mau/pages/profile.dart';
import 'package:mau/pages/transactions.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);
 //  final int balance ;
 //  final  int speed;
 //  final String username;
 //  final String useremail;
 //  const  Team(this.username,this.useremail,this.balance , this.speed);

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  late int balance= 0 ;
  late int speed=  0 ;
  late String username = ' ' ;
  late String useremail = ' ';

  var slider =0.0;
  int  selectindex = 2;
  @override
  Widget build(BuildContext context)
  {
    var arguments = ModalRoute.of(context)!.settings.arguments;
    Map? map = arguments as Map?;
    print(arguments);
    print(arguments!['email']);
    balance=arguments['balance'] ;
    speed =arguments['speed'];
    username = arguments['name'] ;
    useremail = arguments['email'];
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('${balance}',style: TextStyle(color: Colors.black),),

        ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.yellow.shade600,
          label: Text("invite new user"),
          icon: Icon(CommunityMaterialIcons.account_multiple_plus),
          onPressed: (){},

        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    margin: EdgeInsets.only(top: 20),
                    width: 360,
                    height: 220,

                    child: Padding(
                      padding: const EdgeInsets.only(top: 15,left: 10),
                      child: Column(children: [
                        Text('You have referred',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('number miners(s)'),
                        SizedBox(height: 40,),
                        Text('You earning team has',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('number member(s)'),
                        SizedBox(height: 40,),
                        Text('Currently mining',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('number miners(s)'),
                      ],
                      ),
                    ),

                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context,i){
                          return Column(
                              children:[

                                Container(
                                  margin: EdgeInsets.only(top: 10,left: 10),
                                  child: Row(children: [
                                    CircleAvatar( child: Icon(CommunityMaterialIcons.account),radius: 30,),
                                    SizedBox(width: 5,),
                                    Column(
                                      children: [ Text('team $i',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                        Text('data'),
                                        SizedBox(height: 12,),
                                        Text('data')],
                                    ),
                                    SizedBox(width: 100,),
                                    Container(
                                      child: RaisedButton(onPressed: (){},
                                        child:Row(
                                          children: [

                                          ],
                                        ) ,),
                                    )
                                  ]
                                  ),
                                ),
                                SizedBox(height: 10,)
                              ]
                          );
                        }
                    ),
                  )
                ],
              )
          ),
        ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: selectindex,
        onTap: (index){
          setState(() {

            if (index == 0){
              // int balance = widget.balance ;
              // int speed =widget.speed;
              // String username =widget.username;
              // String useremail= widget.useremail;
              if(FirebaseAuth.instance.currentUser!.email == "Ahmad.tellzm@gmail.com"){
                Get.off(()=>AdminHome());
              } else{  Get.off(()=>Home());}

            }
            else if (index == 1){

              // int balance = widget.balance ;
              // int speed =widget.speed;
              // String username =widget.username;
              // String useremail= widget.useremail;
              // Get.off(()=>Transactions(username,useremail,balance,speed));
              var data = {
                "email" : useremail,
                "name" : username,
                "balance" : balance,
                "speed" : speed

              };
              Navigator.pushNamed(context, '/transactions', arguments: data);
          //    Get.off(()=>Transactions());
            }
            else if (index == 2){

              // int balance = widget.balance ;
              // int speed =widget.speed;
              // String username =widget.username;
              // String useremail= widget.useremail;
              // Get.off(()=>Team(username,useremail,balance,speed));
              var data = {
                "email" : useremail,
                "name" : username,
                "balance" : balance,
                "speed" : speed

              };
              Navigator.pushNamed(context, '/team', arguments: data);
             // Get.off(()=>Team());
            }
            else if (index == 3){
              // print(name);
              // print(email);
              // Future.delayed(Duration.zero, () {

              // // });
              // int balance = widget.balance ;
              // int speed =widget.speed;
              // String username =widget.username;
              // String useremail= widget.useremail;
             // Get.off(()=>Profile(username,useremail,balance,speed));
              var data = {
                "email" : useremail,
                "name" : username,
                "balance" : balance,
                "speed" : speed

              };
              Navigator.pushNamed(context, '/transactions', arguments: data);
            // Get.off(()=>Profile());



              //  Get.off(Profile());
            }
            selectindex = index ;
            print(selectindex);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: '' ),
          BottomNavigationBarItem(icon: Icon(Icons.wysiwyg) , label: '' ),
          BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.account_multiple),label: ''  ),
          BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.dots_horizontal),label: ''  ),

        ],
        selectedFontSize:10,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.amber,

      ),

    );
 
  }
}
