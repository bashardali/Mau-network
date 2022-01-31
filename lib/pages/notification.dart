import 'package:flutter/material.dart';
class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(child: Card(
       child: new Container(
         width: double.infinity,
         height: double.infinity,
         child: Column(
           children: [
             SizedBox(height: 100,),
             Text('Mau', style: TextStyle( fontSize: 40, color: Colors.yellow.shade600),),
             Text('Mau network', style: TextStyle( fontSize: 20, color: Colors.grey),),
             Text(' A Decentralized future', style: TextStyle( fontSize: 20, color: Colors.grey),),
             SizedBox(height: 100,),
             ElevatedButton.icon(onPressed: (){},
              icon: Icon(Icons.phone),
              label: Text('Continue with Phone number')),


           ],
         ),
         decoration: new BoxDecoration(
         //  color: const Color(0xff7c94b6),
           image: new DecorationImage(
             fit: BoxFit.cover,
             colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
             image: new AssetImage(
               'images/eygept-cat.png',
             ),
           ),
         ),
       ),
          )),


    );
  }
}
