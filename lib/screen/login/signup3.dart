import 'dart:io';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:mau/pages/home.dart';
import 'package:mau/pages/loading.dart';
//import 'package:mau/pages/loading.dart';
import 'package:mau/screen/login/login.dart';
import 'package:mau/service/service.dart';
import 'package:mau/widget/form/formEmailTextField.dart';
import 'package:mau/widget/form/formPassTextField.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUp3 extends StatefulWidget {
  @override
  _SignUp3State createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  final _formKey = GlobalKey<FormState>();

  var memail = "";
  var mpassword = "";
  var muserName = "";
  bool _isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  registration() async {
    try {
      setState(() {
        //_isLoading = true;
        memail = emailController.text;
        mpassword = passwordController.text;
        muserName = userNameController.text;

      });

      String r = DateTime.now().toIso8601String();
     // final ref = FirebaseStorage.instance.ref('usersImage/$r');
     // final UploadTask task = ref.putFile(File(selectedImage!.path));
    //  final snapshot = await task.whenComplete(() {});
    //  final dowloandUrl = await snapshot.ref.getDownloadURL();
    //  print(dowloandUrl);

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: memail,
        password: mpassword,
      );

      print(userCredential);


      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
            addUser();
           addSession();
            return Loading();
          } ), (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("Weak Password");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "The password you entered is a weak password.",
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.white,
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "The email you entered belongs to a registered user.",
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.white,
        ));
        print('This email is already in use.');
      }
    }
  }
//========================================================
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(hours: 24));

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference session = FirebaseFirestore.instance.collection('sessions');
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> addSession() {
    final User? user = auth.currentUser;
    final uid = user!.uid;

    print('this is $uid');
    // Call the user's CollectionReference to add a new user
    return session
        .add({

      'id':  uid,
      'sessionid': 0,
      'starttime':startTime ,
      'endtime': endTime,

    })
        .then((value) => print("Session Added"))
        .catchError((error) => print("Failed to add Session: $error"));
  }
  Future<void> addUser() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    print('this is $uid');
    // Call the user's CollectionReference to add a new user
    return users
        .add({
      'name': muserName,
      'email': memail,
      'id':  uid,
      'maus': 200,
      'eygpound': 0.5,
      'mauspeed': 1000,
      'prem': false,
     // 'referrel':null
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


//========================================
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  XFile? selectedImage;
  Future getImage() async {
    XFile? image =
    await ImagePicker.platform.getImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = image!;
    });
  }

  bool isObscure = false;

  int _currentStep = 0;
  int newsteps= 0;
  @override
  void initState() {
    print('$_currentStep');
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Step> _getStep() => [
      Step(
          state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          title: Text("User\nInformation"),
          content: Column(
            children: [
              TextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please Enter Your Username";
                  }
                },
                controller: userNameController,
                decoration: InputDecoration(
                  labelText: "User name",
                  labelStyle: TextStyle(fontSize: 17, color: Colors.amber),
                  errorStyle: TextStyle(color: Colors.black26),
                ),
              ),


            ],
          ),
          isActive: _currentStep >= 0),
      Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          title: Text("Login\nInformation"),
          content: Column(
            children: [
              formEmailTextField(emailController),
              FormPassTextField(passwordController),
            ],
          ),
          isActive: _currentStep >= 1),
      Step(
          state: _currentStep > 2 ? StepState.complete : StepState.indexed,
          title: Text("Information\npreview"),
          content: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.amber),
                title: Text(userNameController.text),
              ),
              ListTile(
                leading: Icon(Icons.mail, color: Colors.amber),
                title: Text(emailController.text),
              ),
              ListTile(
                leading: Icon(
                  Icons.password,
                  color: Colors.amber,
                ),
                title:
                Text(isObscure ? passwordController.text : "*********"),
                trailing: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: isObscure ? Colors.amber : Colors.grey[500],
                  ),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                ),
              )
            ],
          ),
          isActive: _currentStep >= 2),
    ];

    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Form(
        key: _formKey,
        child: SingleChildScrollView(
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  color: Colors.amber,
                  child: Row(
                    children: [
                      Text(
                        "Register",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                      ),
                      IconButton(onPressed: (){
                        Get.off(()=>Login());
                      }, icon: Icon(CommunityMaterialIcons.logout,color: Colors.white,) ,)
                    ],
                  ),
                  padding: EdgeInsets.only(left: 20, bottom: 10),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.82,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Stepper(
                  controlsBuilder: (context,
                      ControlsDetails controls) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        Row(
                          children: [
                            if (_currentStep != 0)
                              Expanded(
                                  child: TextButton(
                                    onPressed: controls.onStepCancel,
                                    child: Text("Back"),
                                  )),
                            Expanded(
                                child: TextButton(
                                  onPressed: controls.onStepContinue,
                                  child: Text(
                                      _currentStep == 2 ? "Register" : "Forward"),
                                )),

                          ],
                        ),
                      ],
                    );
                  },
                  steps: _getStep(),
                  type: StepperType.horizontal,
                  currentStep: _currentStep,
                  onStepContinue: () async {
                    print('$_currentStep');
                    //  _currentStep = newsteps +1 ;
                    final isLastStep = _currentStep == 2;
                    // _getStep().length - 1;
                    if (_currentStep == 0 ){
                      setState(() {
                        _currentStep++;
                      });


                    }
                    //
                    else if (_currentStep == 0  && userNameController.text == null) {

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Please write your name")));
                    } else if ( !_formKey.currentState!.validate() ) {

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Please rewrite password or email")));
                      _currentStep++;
                    }

                    else if (_currentStep == 2)  {

                      registration();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "register finished now you can login ")));

                    } else {
                      setState(() {
                        _currentStep += 1;
                        print(" ++ $_currentStep");
                        // newsteps++;
                      });
                    }
                  },
                  onStepCancel: () {
                    if (_currentStep != 0) {
                      setState(() {
                        _currentStep --;
                        // newsteps--;
                        print(" -- $_currentStep");
                      });
                    }
                  },
                ),
              ),
              MaterialButton(onPressed: (){

              },
              child: Text('return to login', style: TextStyle(color: Colors.blue),)
                ,)
            ],
          ),
        ),
      ),
    );
  }
}
