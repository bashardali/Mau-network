import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mau/controllers/homecontroller.dart';
import 'package:mau/controllpanel/Adminhome.dart';
import 'package:mau/pages/home.dart';
import 'package:mau/pages/profile.dart';
import 'package:mau/pages/team.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);
  // final int balance ;
  // final  int speed;
  // final String username;
  // final String useremail;
  // const  Transactions(this.username,this.useremail,this.balance , this.speed);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  late int balance= 0 ;
  late int speed=  0 ;
  late String username;
  late String useremail;


  int   selectindex =1;
  @override

  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments;
    Map? map = arguments as Map?;
    print(arguments);
    print(arguments!['email']);
    balance=arguments['balance'] ;
    speed =arguments['speed'];
    username = arguments['name'] ;
    useremail = arguments['email'];

    return  Scaffold(
        backgroundColor: Colors.white,
         appBar: AppBar(
           elevation: 0,
           backgroundColor: Colors.black87,
          leading: Text("Transactions", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
           leadingWidth: 120,
           title: Text("Total Balance \n ${balance} Mau", style: TextStyle(color: Colors.white),),
         centerTitle: true,


         ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [


              SizedBox(height: 10,),

              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context,i){
                    return Card(
                      child: ListTile(
                        mouseCursor: MouseCursor.uncontrolled,
                        title: Text('date today',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        subtitle: Text('Daily Mining',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        trailing: Text('trailing',style: TextStyle(fontSize: 15,color: Colors.green, fontWeight: FontWeight.bold)),
                      ),
                    );
                  }
              ),
            ],
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
                //Get.off(()=>Transactions());
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
              //  Get.off(()=>Team());

              }
              else if (index == 3){

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
                Navigator.pushNamed(context, '/profile', arguments: data);
               // Get.off(()=>Profile());

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
