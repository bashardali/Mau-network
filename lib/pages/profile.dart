import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mau/controllers/homecontroller.dart';
import 'package:mau/controllpanel/Adminhome.dart';
import 'package:mau/pages/home.dart';
import 'package:mau/pages/team.dart';
import 'package:mau/pages/transactions.dart';
import 'package:mau/screen/login/login.dart';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Profile extends StatefulWidget {
 const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late int balance ;
  late int speed ;
  late String username ;
  late String useremail;

   int selectindex = 3;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
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

        body:
        SafeArea(
          left: true,
          child: SingleChildScrollView(

            padding: EdgeInsets.all(20),
            child: Column(
              //mainAxisAlignment:MainAxisAlignment.end,

              children: [
                // user name
                SizedBox(height: 30,),
                Text("${arguments['name']}" , style: TextStyle( fontSize: 30,), ),
                SizedBox(height: 20,),
                // user email
                Text("${arguments['email']}" , style: TextStyle( fontSize: 20 , color: Colors.grey),textAlign: TextAlign.left,  ),
                SizedBox( height: 30,) ,
                // start referring!
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(10),

                  child: Row(
                    children:  [
                      Icon( CommunityMaterialIcons.account_multiple_plus , color: Colors.white, ),
                      Column(
                        children: [
                          Text(' you can earn an uncapped bonus \n'
                              ' rate of 100 maus to your miner speed \n '
                              ' every friend in your team' ,
                            style: TextStyle(
                                color: Colors.white
                            ),),
                          InkWell(
                            onTap: (){},
                            child: Row(

                              children: [
                                Text('Start referring!', style: TextStyle( color:Colors.yellow.shade600 ),),
                                SizedBox(width: 60,),
                                Icon( Icons.arrow_forward_ios, color: Colors.yellow.shade600,)
                              ],
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
                SizedBox( height: 10,) ,
                Text("Follow Us on Social Media" , style: TextStyle( fontSize: 15,), ),
                Row(
                  children: [
                    Expanded(child: InkWell(onTap: (){},child: Image(image:AssetImage('images/icons8-facebook.png'),width: 36,height: 48,))),
                    Expanded( child:InkWell(child: Image(image:AssetImage('images/instagram.jpg'),width: 36,height: 48,)) ,),
                    Expanded(child:InkWell(onTap: (){}, child: Image(image:AssetImage('images/icons8-telegram.png'),width: 36,height: 48,))),
                    Expanded(child: InkWell(onTap: (){},child: Image(image:AssetImage('images/icons8-twitter.png'),width: 36,height: 48,))),
                    Expanded( child: InkWell(onTap: (){},child: Image(image:AssetImage('images/icons8-youtube.png'),width: 36,height: 48,)) ,)


                  ],
                ),
                SizedBox(height: 30,),
                Text("Accounts " , style: TextStyle( fontSize: 30,), ),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(20.0)),
                  selected: true,
                  leading: Text("Username " , style: TextStyle( fontSize: 20,), ),
                  trailing:Text("${arguments['name']}" , style: TextStyle( fontSize: 15,), ) ,
                  selectedTileColor: Colors. grey[300],

                ),
                SizedBox(height:5,),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(20.0)),
                  selected: true,
                  leading: Text("Referral Code " , style: TextStyle( fontSize: 20,), ),
                  trailing:Text("not yet" , style: TextStyle( fontSize: 15,), ) ,
                  selectedTileColor: Colors. grey[300],

                ),
                SizedBox(height:5,),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(20.0)),
                  selected: true,
                  leading: Text("Apple verified " , style: TextStyle( fontSize: 20,), ),
                  trailing: Icon(CommunityMaterialIcons.alert),
                  selectedTileColor: Colors. grey[300],
                ),
                SizedBox(height:5,),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(20.0)),
                  selected: true,
                  leading: Text("Facebook verified" , style: TextStyle( fontSize: 20,), ),
                  trailing: Icon(CommunityMaterialIcons.check , color: Colors.green,),
                  selectedTileColor: Colors. grey[300],

                ),
                SizedBox(height:5,),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(20.0)),
                  selected: true,
                  leading: Text("Phone verified" , style: TextStyle( fontSize: 20,), ),
                  trailing: Icon(CommunityMaterialIcons.alert),
                  selectedTileColor: Colors. grey[300],

                ),
                SizedBox(height:5,),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(20.0)),
                  selected: true,
                    selectedTileColor: Colors. grey[300],
                  leading: InkWell( onTap: ()  async {
                    await FirebaseAuth.instance.signOut();
                    Get.off(Login());},
                    child: Text("Sign out" , style: TextStyle( fontSize: 20, color: Colors.red), ),
                    )


                ),
                SizedBox(height:30,),
                Text("About" , style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold), ),
                SizedBox(height:5,),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(20.0)),
                  selected: true,
                  leading: Text("Apple verified " , style: TextStyle( fontSize: 20,  color: Colors.black87), ),
                  trailing: Icon( Icons.arrow_forward_ios , color: Colors.black87,),

                  selectedTileColor: Colors. grey[300],
                ),
                SizedBox(height:5,),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(20.0)),
                  selected: true,
                  leading: Text("FAQ" , style: TextStyle( fontSize: 20,  color: Colors.black87), ),
                  trailing: Icon( Icons.arrow_forward_ios , color: Colors.black87,),


                  selectedTileColor: Colors. grey[300],
                ),
                SizedBox(height:5,),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(20.0)),
                  selected: true,
                  leading: Text("Roles" , style: TextStyle( fontSize: 20,  color: Colors.black87), ),
                  trailing: Icon( Icons.arrow_forward_ios , color: Colors.black87,),

                  selectedTileColor: Colors. grey[300],
                ),
                SizedBox(height:5,),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(20.0)),
                  selected: true,
                  leading: Text("languages" , style: TextStyle( fontSize: 20,  color: Colors.black87), ),
                  trailing: Icon( Icons.arrow_forward_ios , color: Colors.black87,),

                  selectedTileColor: Colors. grey[300],
                ),
                SizedBox(height:5,),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(20.0)),
                  selected: true,
                  leading: Text("Contacts us" , style: TextStyle( fontSize: 20,  color: Colors.black87), ),
                  trailing: Icon( Icons.arrow_forward_ios , color: Colors.black87,),
                  selectedTileColor: Colors. grey[300],
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(

          currentIndex: selectindex,
          onTap: (index){
            setState(() {

              if (index == 0){

             if(FirebaseAuth.instance.currentUser!.email == "Ahmad.tellzm@gmail.com"){
             Get.off(()=>AdminHome());
             } else{  Get.off(()=>Home());}
              }
              else if (index == 1){

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

                var data = {
                  "email" : useremail,
                  "name" : username,
                  "balance" : balance,
                  "speed" : speed

                };
                Navigator.pushNamed(context, '/profile', arguments: data);
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
