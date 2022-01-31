import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mau/controllpanel/Adminhome.dart';
import 'package:mau/controllpanel/panel.dart';
import 'package:mau/pages/home.dart';




class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  final FirebaseAuth auth = FirebaseAuth.instance;
  String name = ' ';
  late String email;
  late var maus;
  late var eygpound;
  late int mauspeed;
  late bool prem;
  Map? data1;
  bool isloading = false;

  // var referrel= null;
  CollectionReference useref = FirebaseFirestore.instance.collection('users');

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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.white), textAlign: TextAlign.center,),),
              ),
              Container(
                padding: EdgeInsets.all(50),
                child: Center(child: Text('To start mining session press mau!',
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white), textAlign: TextAlign.center,),),

              ),
              Center(
                child: ClipOval(

                  child: MaterialButton(
                    onPressed: () {

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
                      image: AssetImage('images/icons8-cat-head.gif'),),
                  ),
                ),
              ),


            ],
          ),
        )
    );
  }
}






