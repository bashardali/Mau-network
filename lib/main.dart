import 'package:mau/controllpanel/Adminhome.dart';
import 'package:mau/controllpanel/addnews.dart';
import 'package:mau/controllpanel/panel.dart';
import 'package:mau/pages/earnings.dart';
//import 'package:mau/pages/loading.dart';
import 'package:mau/pages/register.dart';
import 'package:mau/pages/tasks.dart';
import 'package:rename/rename.dart';
import 'package:mau/pages/withdraw.dart';
import 'package:mau/screen/login/forgot_password.dart';
import 'package:mau/screen/login/new_password.dart';
import 'package:mau/screen/login/signup3.dart';
import 'package:mau/service/design.dart';
import 'package:mau/service/service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mau/pages/exa.dart';
import 'package:mau/pages/home.dart';
import 'package:mau/pages/notification.dart';
import 'package:mau/pages/profile.dart';
import 'package:mau/pages/rankings.dart';
import 'package:mau/pages/team.dart';
import 'package:mau/pages/transactions.dart';
import 'package:mau/screen/login/login.dart';
import 'package:mau/screen/login/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io' as io;
import 'package:get/get.dart';

void  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("WidgetsFlutterBinding.ensureInitialized();");
  await Firebase.initializeApp();
  print("firebase success");

  runApp(MyApp());
  print("myapp runs");
}

class MyApp extends StatelessWidget {


//flutter build apk --no-sound-null-safety

  @override

  Widget build(BuildContext context) {
    print("myapp 2");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ServiceProvider>(create: (context) => ServiceProvider()),
        ChangeNotifierProvider<DesignProvider>(
            create: (context) => DesignProvider()),
      ],
      builder: (context, _) => GetMaterialApp(
         // debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          //   scaffoldBackgroundColor: Colors.white,
          //   primarySwatch: Colors.amber,
          // ),
          //home: Home(),
          initialRoute: '/login',

          routes:{


          '/login':  (context)=> Login(),
          '/signup':  (context)=> SignUp(),
            '/signup3':  (context)=> SignUp3(),
          '/new':  (context)=> NewPassword(),
          '/forgot':  (context)=> ForgotPassword(),
          '/earnings':  (context)=> Eearnings(),
          '/withdraw':  (context)=> Withdraw(),
            '/reg':  (context)=> Register(),
            '/panel':  (context)=> Panel(),
            '/news':  (context)=> Addnews(),
            '/adminhome':  (context)=> AdminHome(),
            '/tasks':  (context)=> Tasks(),
            '/home':  (context)=> Home(),
            '/notifications':  (context)=> Notifications(),
            '/transactions':  (context)=> Transactions(),
            '/profile':  (context)=> Profile(),
            '/team':  (context)=> Team(),
            '/rankings':  (context)=> Rankings(),
            '/exa':  (context)=> Example('','',0,0),
           // '/loading':  (context)=> Loading(),



        })

    );
  }
}
