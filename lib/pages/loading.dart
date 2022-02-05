import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mau/controllpanel/Adminhome.dart';
import 'package:mau/controllpanel/panel.dart';
import 'package:mau/pages/home.dart';




class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // users table vars
  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference useref = FirebaseFirestore.instance.collection('users');
  CollectionReference session = FirebaseFirestore.instance.collection('sessions');
  String name = ' ';
  late String email;
  late var maus;
  late var eygpound;
  late int mauspeed;
  late bool prem;
  // var referrel= null;
  Map? data1;
  bool isloading = false;
  // sessions table vars
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(hours: 24));
  /// this method is for change
  Future<void> addSession() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    print('this is $uid');
    // Call the user's CollectionReference to add a new user
    return session
        .add({

       'id':  uid,
      'sessionid': 0,
      'stattime':startTime ,
      'endtime': endTime,

    })
        .then((value) => print("Session Added"))
        .catchError((error) => print("Failed to add Session: $error"));
  }
  late DateTime starttime;
  late DateTime endtime;
  late int start;
  late int end;
  late int sid;
  late DateTime now;

// method to get data from sessions
    void getsession()  async{
      await session.where('id', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          print(element.data());
          data1 = element.data() as Map?;
          print('================================================');
          print(data1);
          print('================================================');
          print(element['starttime']);
          starttime = element['starttime'];
          start =starttime.year*12*30*24*60+starttime.month*30*24*60+ starttime.day * 24*60 + starttime.hour *60 + starttime.minute ;
          end =endtime.year*12*30*24*60+endtime.month*30*24*60+ endTime.day * 24*60 + endtime.hour *60 + endtime.minute ;
          print('================================================');
          print(element['endtime']);
          print('================================================');
          end = element['endtime'];
          print(element['sessionid']);
          print('================================================');
          sid = element['sessionid'];
        });
      });
    }
    // method to open new session
  update_session() async{
    CollectionReference session = FirebaseFirestore.instance.collection('sessions');
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    print('id =================$uid');
    var docset =  await session.where('id', isEqualTo : FirebaseAuth.instance.currentUser?.uid).get();
    var startime;
    var endtime;
    var id;
    var sessionid;
    await session.where('id', isEqualTo : FirebaseAuth.instance.currentUser?.uid).get().then((value){
      value.docs.forEach((element) {
        startime= element['startime'];
        endtime =element['endtime'];
        id = element['id'];
        sessionid = element['sessionid'];
      });
    } );
    var  document = docset.docs.single;
    String documentid = document.id;
    await session.doc('$documentid').set(
      {
        'startime':startime,
        'endtime':endtime,
        'id':id,
        'sessionid':sessionid+1,
      },
    );
  }
  // method  return true if we are in the current session and no hf we are not
    Future<bool> isSession( DateTime time) async{
           int  time1 =time.year*12*30*24*60+time.month*30*24*60+ time.day * 24*60 + time.hour *60 + time.minute;
      if ( time1 > start && time1 < end ){ return true; }
      else if( time1 > end ){ return false;}
      else return false;
    }
  void getdata() async {
    await useref.where('id', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print(element.data());
        data1 = element.data() as Map?;
        print('================================================');
        print(data1);
        print('================================================');
        print(element['username']);
        name = element['username'];
        print('================================================');

        print(element['email']);
        print('================================================');
        email = element['email'];
        print(element['maus']);
        print('================================================');
        maus = element['maus'];
        print(element['eygpound']);
        print('================================================');
        eygpound = element['eygpound'];

        prem = element['prem'];

        print(element['prem']);
        print('================================================');
        mauspeed = element['mauspeed'];
        print(element['mauspeed']);

        print('nav is gooooood');
        //  referrel =  element['referrel'];

        // if (element.data() != null) { isloading = true;}
        // print('isloadin  $isloading');

      });
    });
    // //
    // //
  }

  @override
  void initState() {
    //   getsession();
    //     now = DateTime.now();
    //
    // int   now1 =now.year*12*30*24*60+now.month*30*24*60+ now.day * 24*60 + now.hour *60 + now.minute ;
    //   if(now1 > start && now1 < end) {

   //  }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getsession();
 return FutureBuilder(
   future: useref.get(),
   builder:(BuildContext context, AsyncSnapshot ) {
     if (AsyncSnapshot.hasData) {

       return   FutureBuilder(
         future: session.get(),
         builder:(BuildContext context, AsyncSnapshot) {
           if (AsyncSnapshot.hasData) {
             DateTime now = DateTime.now();
             isSession(now);
             if (isSession == true){
               return Scaffold(
                   appBar: AppBar(
                     backgroundColor: Colors.yellow.shade600,
                     elevation: 0,
                   ),
                   backgroundColor: Colors.yellow.shade600,
                   body: SingleChildScrollView(
                     child: Column(
                       children: [
                         Container(
                           padding: EdgeInsets.all(50),
                           child: Center(child: Text('Welcome!', style: TextStyle(
                               fontWeight: FontWeight.w500,
                               fontSize: 40,
                               color: Colors.white),
                             textAlign: TextAlign.center,),),
                         ),
                         Container(
                           padding: EdgeInsets.all(50),
                           child: Center(
                             child: Text('To continue last mining session press mau!',
                               style: TextStyle(fontWeight: FontWeight.bold,
                                   fontSize: 20,
                                   color: Colors.white),
                               textAlign: TextAlign.center,),),

                         ),
                         Center(
                           child: ClipOval(

                             child: MaterialButton(
                               onPressed: () {

                                 if (FirebaseAuth.instance.currentUser!.email ==
                                     "Ahmad.tellzm@gmail.com" || FirebaseAuth.instance.currentUser!.email =="bashardali403@gmail.com") {
                                   Get.off(() => AdminHome());
                                 } else {
                                   Get.off(() => Home());
                                 }
                               },
                               color: Colors.white,

                               child: Image(
                                 width: 60,
                                 height: 80,
                                 image: AssetImage(
                                     'images/icons8-cat-head.gif'),),
                             ),
                           ),
                         ),


                       ],
                     ),
                   )
               );
             }else {
               return Scaffold(
               appBar: AppBar(
               backgroundColor: Colors.yellow.shade600,
               elevation: 0,
               ),
               backgroundColor: Colors.yellow.shade600,
               body: SingleChildScrollView(
               child: Column(
               children: [
               Container(
               padding: EdgeInsets.all(50),
               child: Center(child: Text('Welcome!', style: TextStyle(
               fontWeight: FontWeight.w500,
               fontSize: 40,
               color: Colors.white),
               textAlign: TextAlign.center,),),
               ),
               Container(
               padding: EdgeInsets.all(50),
               child: Center(
               child: Text('To start mining session press mau!',
               style: TextStyle(fontWeight: FontWeight.bold,
               fontSize: 20,
               color: Colors.white),
               textAlign: TextAlign.center,),),

               ),
               Center(
               child: ClipOval(

               child: MaterialButton(
               onPressed: () {
                 update_session();
               if (FirebaseAuth.instance.currentUser!.email ==
               "Ahmad.tellzm@gmail.com") {
               Get.off(() => AdminHome());
               } else {
               Get.off(() => Home());
               }
               },
               color: Colors.white,

               child: Image(
               width: 60,
               height: 80,
               image: AssetImage(
               'images/icons8-cat-head.gif'),),
               ),
               ),
               ),


               ],
               ),
               )
               );
               }
    }

           else if (AsyncSnapshot.hasError) {
             print('error no data found');
             return SingleChildScrollView(


                 child: Center(

                     child: Text('error loading mau')));
           } else
           if (AsyncSnapshot.connectionState == ConnectionState.waiting) {
             return Scaffold(
               backgroundColor: Colors.grey.shade200,
               body: SingleChildScrollView(

                 padding: EdgeInsets.all(50),
                 child: Center(
                   child: CircularProgressIndicator(


                     color: Colors.yellow.shade600,
                     strokeWidth: 5,
                   ),
                 )
                 ,
               ),
             );
           }
           else {
             print('some thing went wrong');
             return
               SingleChildScrollView(


                   child: Center(
                       child: Text('some thing went wrong')));
           }
         }
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

 );




  }
}






