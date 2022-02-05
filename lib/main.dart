import 'dart:isolate';

import 'package:mau/controllpanel/Adminhome.dart';
import 'package:mau/controllpanel/addnews.dart';
import 'package:mau/controllpanel/panel.dart';
import 'package:mau/pages/earnings.dart';
import 'package:mau/pages/loading.dart';

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
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
void printHello() {
final DateTime now = DateTime.now();
final int isolateId = Isolate.current.hashCode;
print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
}


void  main() async {
  WidgetsFlutterBinding.ensureInitialized();


  print("WidgetsFlutterBinding.ensureInitialized();");
  await Firebase.initializeApp();
  print("firebase success");
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
  print("myapp");
  final int helloAlarmID = 0;
  await AndroidAlarmManager.periodic(const Duration(minutes: 1), helloAlarmID, printHello);

}

class MyApp extends StatelessWidget {


//flutter build apk --no-sound-null-safety

  @override

  Widget build(BuildContext context) {
    print("provider in main");
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
            '/exa':  (context)=> Example(),
           // '/loading':  (context)=> Loading(),



        })

    );
  }
}
