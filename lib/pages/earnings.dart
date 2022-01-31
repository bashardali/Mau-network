import 'package:mau/pages//home.dart';
import 'package:mau/pages/withdraw.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Eearnings extends StatefulWidget {
  const Eearnings({Key? key}) : super(key: key);
  // final int balance ;
  // final  int speed;
  // final String username;
  // final String useremail;
  // const  Eearnings(this.username,this.useremail,this.balance , this.speed);
  @override
  _EearningsState createState() => _EearningsState();
}

class _EearningsState extends State<Eearnings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Get.off(Home());},
          icon: Icon(CommunityMaterialIcons.arrow_left,color: Colors.black87,),
        ),
        backgroundColor: Colors.white,
        title: Text('00.00'),
        titleTextStyle: TextStyle( color: Colors.black87, fontSize: 20, ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.yellow.shade600,
        label: Text("invite new user"),
        icon: Icon(CommunityMaterialIcons.account_multiple_plus),
        onPressed: (){},

      ),
      body:
      SingleChildScrollView(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              tileColor:  Colors.black87 ,
              leading: Text('Total Mining Rate' , style: TextStyle( color:Colors.white, ),),

              trailing:Text('1000 Mau/hr' , style: TextStyle( color:Colors.white, ),),
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10) ,

              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(CommunityMaterialIcons.account),
                  Text('Miner' , style: TextStyle( color:Colors.black87, ),),
                  SizedBox(width: 150,),
                  Text('1000 Mau/hr' , style: TextStyle( color:Colors.black87, ),),
                ],
              ) ,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10) ,

              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Text('Current  session ends in' , style: TextStyle( color:Colors.green, ),),
                  SizedBox(width: 100,),
                  Text('${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}' , style: TextStyle( color:Colors.grey, ),),
                ],
              ) ,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10) ,

              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(CommunityMaterialIcons.account),
                  Text('Referrer' , style: TextStyle( color:Colors.black87, ),),
                  SizedBox(width: 150,),
                  Text('100 Mau/hr' , style: TextStyle( color:Colors.black87, ),),
                ],
              ) ,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10) ,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Active(n)' , style: TextStyle( color:Colors.green, ),),
                  SizedBox(height: 10,),
                  Text('1000 + (100 MAU)= 1100 MAU' , style: TextStyle( color:Colors.grey, ),),
                  Text('Inactive' , style: TextStyle( color:Colors.red, ),),
                ],
              ) ,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10) ,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Active(n)' , style: TextStyle( color:Colors.green, ),),
                  SizedBox(height: 10,),
                  Text('1000 + (100 MAU)= 1100 MAU' , style: TextStyle( color:Colors.grey, ),),
                  Text('Inactive' , style: TextStyle( color:Colors.red, ),),
                ],
              ) ,
            ),
            InkWell(

               onTap: (){Get.to(Withdraw());},
              child: Container(
                width: 150,
                height: 40,
                padding:EdgeInsets.all(10) ,
                margin: EdgeInsets.all(10) ,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color: Colors.yellow.shade600,
                ),
                child: Text('withdraw' , style: TextStyle(
                  color: Colors.white,
                ),textAlign: TextAlign.center,),
              ),

            )
            // Container(
            //   width: 200,
            //   height: 200,
            //   child: ListTile(
            //
            //
            //     tileColor:  Colors.white ,
            //     leading: Row(
            //       children: [
            //         Text('Miner' , style: TextStyle( color:Colors.black87, ),),
            //       ],
            //     ),
            //     trailing:Text('200 Mau/hr' , style: TextStyle( color:Colors.black87, ),),
            //
            //   ),
            // ),
          ],
        ),

      ),
      backgroundColor: Colors.grey,
    );
  }
}
