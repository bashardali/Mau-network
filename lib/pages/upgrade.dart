import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mau/widget/form/formContent.dart';
import 'package:mau/widget/form/formTopTitle.dart';
class Upgrade extends StatefulWidget {
  const Upgrade({Key? key}) : super(key: key);

  @override
  _UpgradeState createState() => _UpgradeState();
}

class _UpgradeState extends State<Upgrade> {

  final _formKey = GlobalKey<FormState>();

  String email = "";

  String password = "";

  final passwordController = TextEditingController();

  final emailController = TextEditingController();
  String quote = "0x6D1815ec45f64937E9864db9AD35F90902D5B43a";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        elevation: 0,
      ),
      body: SingleChildScrollView(
     child: Container(
       padding: EdgeInsets.all(10),
       child:
       Column(
         children: [
           Container(
             padding: EdgeInsets.all(10),
             margin:EdgeInsets.all(10) ,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.grey.shade200,
             ),

             child: Text('Upgrade your account to collect 500% of mining '
                 'mau and referral friends Add mau token to your wallet '
                 'Transfer 29\$ worth of BNB , USDT, BUSD, ETH to developer wallet '
                 'Developer wallet ',style: TextStyle(fontSize: 20),),
           ),
           Container(
             padding: EdgeInsets.all(10),
            // margin:EdgeInsets.all(10) ,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.grey.shade200,
             ),

             child: Column(
               children: [
                 Row(
                   children: [
                     Text('Developer wallet ',style: TextStyle(fontSize: 30),textAlign: TextAlign.left,),


                   ],
                 ),
                 Row(
                   children: [
                     Text('press the button to copy wallet',style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                     IconButton( onPressed: (){
                       Clipboard.setData(ClipboardData(text: quote));
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                         content: Text(
                           "wallet was copied",
                           style: TextStyle(color: Colors.red),
                         ),
                         backgroundColor: Colors.white,
                       ));

                       },iconSize: 30,
                         icon: Icon(CommunityMaterialIcons.calendar_edit)),
                   ],
                 ),

               ],
             ),

           ),
           Container(
             padding: EdgeInsets.all(10),
             margin:EdgeInsets.all(10) ,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.grey.shade200,
             ),

             child: Text('0x6D1815ec45f6'
                 '4937E986'
                 '4db9AD35F90902D5B43a',style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
           ),
           //copy wallet address
           Container(
             padding: EdgeInsets.all(10),
             margin:EdgeInsets.all(10) ,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.grey.shade200,
             ),

             child: Column(
               children: [
                 Text('paste wallet address down here',style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                 TextFormField(

                 )
               ],
             )
           ),
           Container(
             padding: EdgeInsets.all(10),
             margin:EdgeInsets.all(10) ,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.grey.shade200,
             ),

             child: Column(
               children: [
                 Text('paste your transaction hash here',style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                 TextFormField(
                 )
               ],
             ),
           ),
           ClipOval(
             child: Container(
               padding: EdgeInsets.all(10),
               margin:EdgeInsets.all(10) ,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.grey.shade200,
               ),

               child:MaterialButton(
                 onPressed: (){},
                 child: Text('submit'),
               )
             ),
           ),


         ],
       ),
     ),
    )

    );
  }
}
