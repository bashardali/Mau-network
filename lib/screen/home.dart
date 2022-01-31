import 'package:mau/screen/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        actions: [
          IconButton(
            onPressed: () async {
                //context.read<ServiceProvider>().logout();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profil()));
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Welcome !")),
          Image.asset('images/eygept-cat.png'),
        ],
      ),
    );
  }
}