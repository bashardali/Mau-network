import 'package:firebase_auth/firebase_auth.dart';
import 'package:mau/screen/login/login.dart';
import 'package:mau/screen/login/sign_up.dart';
import 'package:mau/screen/login/signup3.dart';

import 'package:mau/widget/form/formContent.dart';
import 'package:mau/widget/form/formEmailTextField.dart';
import 'package:mau/widget/form/formTopTitle.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password Reset Email Has Been Sent")));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("User not found");
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No registered email found")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Form(
        key: _formKey,
        child: formContent(
          context,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formTopTitle(context, "I forgot my password"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: formEmailTextField(emailController),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                          });
                          resetPassword();
                        }
                      },
                      child: Text("Send Email")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                    SignUp3(),
                                transitionDuration: Duration(seconds: 0)),
                                (route) => false);
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}