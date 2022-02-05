import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mau/pages/home.dart';
import 'package:mau/pages/loading.dart';
//import 'package:mau/pages/loading.dart';
import 'package:mau/screen/login/forgot_password.dart';
import 'package:mau/screen/login/sign_up.dart';
import 'package:mau/screen/login/signup3.dart';
import 'package:mau/service/service.dart';
import 'package:mau/widget/form/formActionButton.dart';
import 'package:mau/widget/form/formContent.dart';
import 'package:mau/widget/form/formEmailTextField.dart';
import 'package:mau/widget/form/formPassTextField.dart';
import 'package:mau/widget/form/formTopTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();

  String email = "";

  String password = "";

  final passwordController = TextEditingController();

  final emailController = TextEditingController();
// sign in with gooole account
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
// sign in with facebook account
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
  userLogin() async {
    try {
      TextInput.finishAutofillContext();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Loading()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("There is no such email record.");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("There is no such email record."),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("You entered the wrong password");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("You entered an incorrect password."),
          ),
        );
      }
      throw {e.code, e.message};
    }
  }
  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  User? currentUser = FirebaseAuth.instance.currentUser;
   @override
  void initState() {

     print("login success");
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something Gone Wrong"),
            );
          } else if (snapshot.error != null) {
            print(snapshot.error.toString());
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            context.read<ServiceProvider>().getUserData();

            return Loading();
          } else {
            return Form(
              key: _formKey,
              child: formContent(
                context,
                AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formTopTitle(context, "Login"),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: formEmailTextField(emailController),
                      ),
                      Container(
                        height: 120,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                        child: Stack(
                          children: [
                            FormPassTextField(passwordController),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                   // fixedSize: Size(130, 5),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword()));
                                  },
                                  child: Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 17),

                                  ),
                                )),
                          ],
                        ),
                      ),
                      formActionButton(
                          context,
                              () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                email = emailController.text;
                                password = passwordController.text;
                              });
                              userLogin();
                            }
                          },
                          "Login",
                          "Don't have an account?",
                          "Register",
                              () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, a, b) => SignUp3(),
                                  transitionDuration: Duration(seconds: 0)),
                            );
                          }),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider(
                                color: Colors.black87,
                              )),
                          Text(" or "),
                          Expanded(
                              child: Divider(
                                color: Colors.black87,
                              )),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(
                              flex: 3,
                            ),
                            InkWell(
                              onTap:signInWithFacebook,

                                child: Image(image:AssetImage('images/icons8-facebook.png'),width: 30,height: 40,)),
                            Spacer(
                              flex: 1,
                            ),
                            InkWell(
                              onTap:  signInWithGoogle,
                                child: Image(image:AssetImage('images/icons8-gmail.png'),width: 30,height: 40,)),
                            Spacer(
                              flex: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}