import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mau/controllers/homecontroller.dart';
import 'package:mau/controllpanel/panel.dart';
import 'package:mau/pages/earnings.dart';
import 'package:mau/pages/exa.dart';
import 'package:mau/pages/loading.dart';
import 'package:mau/pages/notification.dart';
import 'package:mau/pages/tasks.dart';
import 'package:mau/pages/upgrade.dart';
import 'package:mau/pages/withdraw.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:mau/pages/profile.dart';
import 'package:mau/pages/rankings.dart';
import 'package:mau/pages/team.dart';
import 'package:mau/pages/transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mau/screen/profile.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 // Homecontroller controller = Get.put(Homecontroller());
  // final int balance ;
  // final  int speed;
  // final String username;
  // final String useremail;
  // const  Home(this.username,this.useremail,this.balance , this.speed);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List users = [];
  late int balance ;
  late int speed ;
  late String username;
  late String useremail;
  bool isloading = false;
   getdata1() async{
     CollectionReference useref = FirebaseFirestore.instance.collection('users');

     await useref.where('id', isEqualTo : FirebaseAuth.instance.currentUser?.uid).get().then((value){
       value.docs.forEach((element) {
         setState(() {
           users.add(element.data());
           print('***************************************************');
           print(users[0]['username']);
           print(users[0]['email']);
           print(users[0]['prem']);
           print(users[0]['maus']);
           print(users[0]['eygpound']);
           print(users[0]['mauspeed']);
           balance = users[0]['maus'] ;
           speed =users[0]['mauspeed'];
           username =users[0]['username'];
           useremail= users[0]['email'];
           print('***************************************************');

         });


       });
     });
   }

  //  double balance =0 ;
    //int speed =0;

  double i = 00.00;
  int  selectindex = 0;
  List<RateCut> getchartdata = getdata();
  //circular slider المتحولات الخاصة ب
  final baseColor = Color.fromRGBO(255, 255, 255, 0.3);

  late int initTime ;
  late int endTime ;

  late int inBedTime ;
  late int outBedTime ;
  int days = 0;
  /////////////////////// التوابع الخاصة بال السلايدر
  int  generateRandomTime(){
    Random random = new Random();
    int randomNumber = random.nextInt(100);
    return randomNumber;
  }

  void _shuffle() {
    setState(() {

     // initTime = generateRandomTime();
      initTime = 0;
      endTime =  generateRandomTime();
      inBedTime = initTime;
      outBedTime = endTime;
    });
  }

  void _updateLabels(int init, int end, int laps) {
    setState(() {
      inBedTime = 0;
      outBedTime = end;
      days = laps;
    });
  }
  String percentageModifier(double value) {
    final roundedValue = value.ceil().toInt().toString();
    return '$roundedValue';
  }
  @override

  final FirebaseAuth auth = FirebaseAuth.instance;


  @override
  void initState() {
    getdata1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference useref = FirebaseFirestore.instance.collection('users');

    return
      GetBuilder<Homecontroller>(
        init: Homecontroller(),

        builder: (Homecontroller) =>FutureBuilder(
          future: useref.get(),
          builder:(BuildContext context, AsyncSnapshot ) {
            if (AsyncSnapshot.hasData) {

           //   Homecontroller.getuserdata();
              //  print('AsyncSnapshot begin================================================================');
              //  print('AsyncSnapshot data================================================================');
              //  print( AsyncSnapshot.data);
              //   print('AsyncSnapshot data ends================================================================');
              // AsyncSnapshot.data?.docs[1].data()['username'];
           //   useref.where('id', isEqualTo : FirebaseAuth.instance.currentUser?.uid).get().then((value){
            //    value.docs.forEach((element) {
                  //  print(element.data());
             //     Map? data1 = element.data() as Map?;
             //       print('================================================');
             //      //  print(data1);
             //      //    print('================================================');
             //       print(element['username']);
             //      print('================================================');
             // Homecontroller.name.value= element['username'];
             //        print( element['email']);
             //         print('================================================');
             //     Homecontroller.email.value =  element['email'];
             //       print( element['maus']);
             //        print('================================================');
             //     Homecontroller.maus.value =  element['maus'];
             //       print( element['eygpound']);
             //        print('================================================');
             //     Homecontroller.eygpound.value =  element['eygpound'];
             //
             //      Homecontroller.prem.value =  element['prem'];
             //
             //       print( element['prem']);
             //       print('================================================');
             //      Homecontroller.mauspeed.value =element['mauspeed'];
             //       print( element['mauspeed']);
             //      //referrel =  element['referrel'];

            //    });

         //     });

              return  Scaffold(
                backgroundColor: Colors.grey[200],
                appBar: AppBar(

                  leading: Image(width: 25, height: 25, image: AssetImage('images/mau2.png'), ),

                  // leadingWidth: 100 ,
                  actions: [
                    IconButton(onPressed: (){
                      Get.to(()=>Rankings());
                    }, icon:Icon(CommunityMaterialIcons.seal,
                      size: 40, ),),
                    IconButton(onPressed: (){
                      Get.to(Notifications());
                    }, icon:Icon(CommunityMaterialIcons.bell,
                      size: 40, ),),


                    SizedBox(width: 10,),
                  ],


                  //title: Text('00.00'),
                  centerTitle: true,
                  backgroundColor: Colors.yellow.shade600,
                  elevation: 0,
                ),
                body:  SingleChildScrollView(

                clipBehavior: Clip.antiAlias,
                scrollDirection: Axis.vertical,
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [



                    Container(
                      height: 160,
                      width: double.infinity,
                      color: Colors.yellowAccent.shade100,
                      child:  SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                          spinnerDuration: 60000,
                          customWidths: CustomSliderWidths(progressBarWidth: 10),
                          infoProperties: InfoProperties(
                              topLabelStyle: TextStyle(
                                  color: Colors.green, fontWeight: FontWeight.bold
                              ),
                              topLabelText: "balance",
                              bottomLabelStyle: TextStyle(
                                  color: Colors.green, fontWeight: FontWeight.bold
                              ),
                              bottomLabelText: "200"



                          ),

                          animationEnabled: true,
                          spinnerMode: true,
                          //counterClockwise: true

                        ),


                        min: 0,
                        max: 2400,
                        initialValue: 0,

                      ),


                    ),

                    ///// CAT HEAD
                    InkWell(
                        onTap: (){ Get.to(Eearnings());},
                        child: ClipOval(

                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [


                                Container(
                                  margin:EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('balance',style: TextStyle(
                                          color: Colors.grey
                                      ), textAlign: TextAlign.center,),
                                      Icon(CommunityMaterialIcons.help_circle_outline , color: Colors.yellow.shade600 ,)

                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text('${users[0]['maus']}', style: TextStyle(fontSize: 20),),
                                SizedBox(height: 20,),
                                Text('+${users[0]['mauspeed']} Mau/hr', style: TextStyle( color: Colors.green),),
                                SizedBox(height: 20,),
                                Container(
                                  margin:EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(CommunityMaterialIcons.account_multiple ,),
                                      Text('0/1',style: TextStyle(
                                          color: Colors.grey
                                      ),),


                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ), )),
                    Center(
                      child: ClipOval(

                        child: MaterialButton(
                          onPressed: (){
                            var data = {
                              "email" : useremail,
                              "name" : username,
                              "balance" : balance,
                              "speed" : speed

                            };
                            Navigator.pushNamed(context, '/transactions', arguments: data);
                            // getdata1();
                            // Get.to (()=>Loading());
                          },
                          color: Colors.white,

                          child: Image(width: 60, height: 80, image: AssetImage('images/icons8-cat-head.gif'),),
                        ),
                      ),
                    ),
                    InkWell(

                      onTap: (){Get.to(()=>Withdraw());},
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
                        ), textAlign: TextAlign.center,),
                      ),

                    ),
                    InkWell(

                      onTap: (){Get.to(()=>Upgrade());},
                      child: Container(
                        width: 150,
                        height: 40,
                        padding:EdgeInsets.all(10) ,
                        margin: EdgeInsets.all(10) ,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Text('upgrade' , style: TextStyle(
                          color: Colors.white,
                        ), textAlign: TextAlign.center,),
                      ),

                    ),

                    SizedBox(height: 20,),

                    //// clock
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.access_time, color: Colors.grey,),

                        Text(" ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}", style: TextStyle(
                          color: Colors.grey,
                        ),)
                      ],
                    ),
                    SizedBox( height: 30,) ,

                    Container(
                      color: Colors.black,
                      padding: EdgeInsets.all(10),
                      // start referring!
                      child: Row(
                        children:  [
                          Icon( CommunityMaterialIcons.account_multiple_plus , color: Colors.white, ),
                          Column(
                            children: [
                              Text(' you can earn an uncapped bonus \n'
                                  ' rate of 100 Maus to your miner speed \n '
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
                    // team
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(CommunityMaterialIcons.power_on ,color: Colors.yellow.shade600,),
                            Text('Team', style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        // team members
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Card( elevation: 0,
                              color: Colors.grey[200],
                              child: Icon(CommunityMaterialIcons.account_circle ,size: 50, color: Colors.blue,),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child:  Column(
                                  children: [
                                    ClipOval(child: Container(color: Colors.green,child: IconButton(onPressed: (){}, icon: Icon(CommunityMaterialIcons.arrow_up_bold, color: Colors.white ,size: 30,) , ))),
                                    Text('upgrade')
                                  ],
                                ),
                              ),

                              //  SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  children: [

                                    SizedBox(width: 10,),
                                    ClipOval(child: Container(color: Colors.red,child: IconButton(onPressed: (){}, icon: Icon(CommunityMaterialIcons.gift , color: Colors.white ,size: 30,) , ))),
                                    Text('Daily gifts')
                                  ],
                                ),
                              ),

                              //SizedBox(width: 10,),
                              Expanded(
                                child:Column(
                                  children: [
                                    ClipOval(child: Container(color: Colors.yellow.shade600,child: IconButton(onPressed: (){}, icon: Icon(CommunityMaterialIcons.credit_card_check_outline , color: Colors.white ,size: 30,) , ))),
                                    Text('withdraw')
                                  ],
                                ),
                              ),

                              //    SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  children: [
                                    ClipOval(child: Container(color: Colors.blue,child: IconButton(onPressed: (){}, icon: Icon(CommunityMaterialIcons.heart , color: Colors.white ,size: 30,) , ))),
                                    Text('partner')
                                  ],
                                ),
                              ),


                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child:  Column(
                                  children: [
                                    ClipOval(child: Container(color: Colors.deepPurple,child: IconButton(onPressed: (){}, icon: Icon(CommunityMaterialIcons.share , color: Colors.white ,size: 30,) , ))),
                                    Text('share')
                                  ],
                                ),
                              ),

                              //  SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  children: [

                                    SizedBox(width: 10,),
                                    ClipOval(child: Container(color: Colors.blueGrey,child: IconButton(onPressed: (){}, icon: Icon(CommunityMaterialIcons.nintendo_game_boy , color: Colors.white ,size: 30,) , ))),
                                    Text('game')
                                  ],
                                ),
                              ),

                              //SizedBox(width: 10,),
                              Expanded(
                                child:Column(
                                  children: [
                                    ClipOval(child: Container(color: Colors.brown,child: IconButton(onPressed: (){}, icon: Icon(CommunityMaterialIcons.flag , color: Colors.white ,size: 30,) , ))),
                                    Text('Activity')
                                  ],
                                ),
                              ),

                              //    SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  children: [
                                    ClipOval(child: Container(color: Colors.red,child: IconButton(onPressed: (){}, icon: Icon(CommunityMaterialIcons.heart , color: Colors.white ,size: 30,) , ))),
                                    Text('Team')
                                  ],
                                ),
                              ),


                            ],
                          ),
                        ],
                      ),
                    ),
                    // STATICS FOR APP USERS
                    Container(
                      //  padding: EdgeInsets.all(20),
                      margin:  EdgeInsets.all(20) ,
                      // color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image(image: AssetImage('images/Lazy_Cat_Sleeping_cat_transparent_by_Icons8.gif'),width: 60 , height: 60,),
                              Text('First 50% RAT CUT!' , style: TextStyle( fontSize: 30 ,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow.shade600),)
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 25,),
                              Text('10M MUE Visitors Reached!', style: TextStyle( fontSize: 20 ,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow.shade600),)
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 25,),
                              Text('Another 50% cut when users reached!', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),)
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 25,),
                              Text('Mine more before it is halved.')
                            ],
                          ),
                          // the statics liner charts
                          SfCartesianChart(
                            series:<ChartSeries>[

                              LineSeries<RateCut,double>(dataSource: getchartdata,
                                  xValueMapper: (RateCut users,_) => users.totalusers,
                                  yValueMapper:(RateCut users,_) => users.baserate,
                                  xAxisName: "Base Rate",
                                  yAxisName: "Total Users")
                            ],
                            primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                            primaryYAxis: NumericAxis(
                                numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)
                            ),),


                        ],

                      ),
                    ),
                    // news
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(CommunityMaterialIcons.power_on ,color: Colors.yellow.shade600,),
                            Text('News', style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        // team members


                      ],
                    ),
                    Container(

                      child: ListView.builder(itemCount: 10,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,i) => Card(
                          elevation: 0,
                          child: ListTile(
                            leading: Image( width: 30,height: 40, image: AssetImage("images/mau2.png"),),
                            title: Text('NEWS1'),

                          ),
                        ),
                      ),
                    )




                  ],
                ),
              ),



            bottomNavigationBar:
            BottomNavigationBar(

            currentIndex: selectindex,
            onTap: (index){
            setState(() {

            if (index == 0){


            Get.off(()=>Home());
            }
            else if (index == 1){

              var data = {
                "email" : useremail,
                "name" : username,
                "balance" : balance,
                "speed" : speed

              };
              Navigator.pushNamed(context, '/transactions', arguments: data);


            }
            else if (index == 2){

              var data = {
                "email" : useremail,
                "name" : username,
                "balance" : balance,
                "speed" : speed

              };
              Navigator.pushNamed(context, '/team', arguments: data);

            }
            else if (index == 3){
              var data = {
                "email" : useremail,
                "name" : username,
                "balance" : balance,
                "speed" : speed

              };
              Navigator.pushNamed(context, '/profile', arguments: data);
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
            else if (AsyncSnapshot.hasError){
              print('error no data found');
              return  SingleChildScrollView(


                  child:Center(

                      child: Text('error loading mau')));
            }
            else if(AsyncSnapshot.connectionState ==ConnectionState.waiting ){
              return   Scaffold(
                backgroundColor: Colors.grey.shade200,
                body: SingleChildScrollView(

                  padding: EdgeInsets.all(50),
                  child:  Center(
                    child: CircularProgressIndicator(


                      color: Colors.yellow.shade600,
                      strokeWidth: 5,
                    ),
                  )
                  ,
                ),
              );

            }
            else{
              print('some thing went wrong');
              return
                SingleChildScrollView(


                    child:Center(
                        child: Text('some thing went wrong')));
            }

          },

        ),
      );


  }
}
List<RateCut> getdata(){
  final List<RateCut> getratecutdata= [
    RateCut(1.6,0),
    RateCut(1.6,100),
    RateCut(0.8,100),
    RateCut(0.8,100),
    RateCut(0.4,1000),
    RateCut(0.4,1000),
    RateCut(0.2,10000),
    RateCut(0.2,10000),
    RateCut(0.1,100000),
  ];
  return getratecutdata;
}
class RateCut{
  final double baserate;
  final double totalusers;
  RateCut(this.baserate, this.totalusers);
}
