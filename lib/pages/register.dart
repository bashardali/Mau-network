import 'package:firebase_auth/firebase_auth.dart';
import 'package:mau/service/service.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}


class _RegisterState extends State<Register> {

  FirebaseAuth auth = FirebaseAuth.instance;
  late UserCredential userCredential;

  initState(){

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(
          onPressed: () async{
            try {
              userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: "bashardali1993@gmail.com",
                  password: 'Bashar1993'
              );
             userCredential.credential;
             print(userCredential);

            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email already in use') {
                print('The account already exists for that email.');
              }
            } catch (e) {
              print(e);
            }

          },
          child: Text("press me idiot"),
        ),
      ),
    );
  }
}
