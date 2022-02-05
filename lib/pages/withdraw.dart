import 'package:mau/pages/home.dart';
import 'package:mau/widget/form/formActionButton.dart';
import 'package:mau/widget/form/formContent.dart';
import 'package:mau/widget/form/formTopTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);
  // final int balance ;
  // final  int speed;
  // final String username;
  // final String useremail;
  // const  Withdraw(this.username,this.useremail,this.balance , this.speed);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  final _formKey = GlobalKey<FormState>();

  String email = "";

  String password = "";

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  userLogin() {
    Get.off(Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        elevation: 0,
      ),
      body: StreamBuilder(
        builder: (context,snapshot){
          return   Form(
            key: _formKey,
            child: formContent(
              context,

              AutofillGroup(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formTopTitle(context, "Withdraw"),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          autofocus: false,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: [AutofillHints.email],
                          decoration: InputDecoration(
                            labelText: "Please Enter Your Email",
                            labelStyle: TextStyle(fontSize: 17, color: Colors.amber),
                            errorStyle: TextStyle(color: Colors.black26),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            } else if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        )
                    ),
                    Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Stack(
                        children: [
                          TextFormField(
                            autofocus: false,
                            controller: passwordController,
                            //keyboardType: TextInputType.visiblePassword,
                            inputFormatters: [],
                            autofillHints: [AutofillHints.password],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Bsc address';
                              } else if (value.length < 60) {
                                return 'Please complete your Bsc address complete';
                              }
                              return null;
                            },
                            // obscureText: pr.obscureText,
                            decoration: InputDecoration(
                              hintText: 'EX:0xfaB98B45593E94C2513Ba028C43187fd6E3453Ed',

                              labelText: "please enter your Bsc Address",
                              labelStyle: TextStyle(fontSize: 17, color: Colors.amber),
                              errorStyle: TextStyle(color: Colors.black26),
                            ),
                          ),

                        ],
                      ),
                    ),

                    InkWell(


                      onTap: (){

                  if (_formKey.currentState!.validate()) {

                       setState(() {
                        email = emailController.text;
                       password = passwordController.text;
                                         userLogin();
                      }); }

                  },
                      child: Center(
                       // widthFactor: ,
                        child: Container(
                          width: 150,
                          height: 50,
                     //     margin: EdgeInsets.only(left: , right: 50, top: 0),
                           padding: EdgeInsets.all(10) ,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color: Colors.yellow.shade600,
                          ),
                          child: Text('Submit' , style: TextStyle(
                            color: Colors.white, fontSize: 30
                          ),textAlign: TextAlign.center,),
                        ),
                      ),

                    ),

                  ],
                ),
              ),
            ),
          );
        }

      ),
    );
  }
}
