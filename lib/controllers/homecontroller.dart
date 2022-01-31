import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {

 //  late final  List users ;
 //    late final RxString name ;
 //  late final RxString email;
 // late final  RxInt maus;
 //  late final  RxInt mauspeed ;
 // late final  RxBool prem ;
 // late final  RxInt eygpound;
 //double eygpound = 0  ;



  String username= 'username';

  // void getuserdata() async{
  //  final   FirebaseAuth auth = FirebaseAuth.instance;
  //   CollectionReference useref = FirebaseFirestore.instance.collection('users');
  //   useref.where('id', isEqualTo : auth.currentUser?.uid).get().then((value){
  //     value.docs.forEach((element) {
  //       print('element data from home controller');
  //         print(element.data());
  //       print('data from users from home controller');
  //     users.add( element.data())  ;
  //     this.name =  users[0]['username'];
  //     email = users[0]['email'];
  //     maus = users[0]['maus'];
  //     mauspeed = users[0]['mauspeed'];
  //     prem = users[0]['prem'];
  //     print('users data ===================================');
  //     print(name);
  //     print(email);
  //       print(maus);
  //       print(mauspeed);
  //       print(prem);
  //      update();
  //
  //
  //     //  prem = users[0]['prem'];
  //
  //       //  print(data1);
  //       //    print('================================================');
  //     //  print(element['username']);
  //       //print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
  //
  //     //  name = element['username'];
  //     //  print( element['email']);
  //     //  print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
  //     //  email =  element['email'];
  //    //   print( element['maus']);
  //    //   print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
  //     //  maus =  element['maus'];
  //     //  print( element['eygpound']);
  //     //  print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
  //     //  eygpound =  element['eygpound'];
  //
  //    //   prem =  element['prem'];
  //
  //     //  print( element['prem']);
  //    //   print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
  //    //   mauspeed =element['mauspeed'];
  //    //   name = element['username'];
  //   //    print( element['mauspeed']);
  //       //referrel =  element['referrel'];
  //
  //     });
  //
  //   });
  //
  // }

}