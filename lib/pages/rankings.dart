import 'package:flutter/material.dart';
class Rankings extends StatefulWidget {
  const Rankings({Key? key}) : super(key: key);

  @override
  _RankingsState createState() => _RankingsState();
}

class _RankingsState extends State<Rankings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2 ,
      child: Scaffold(
        appBar: AppBar(
         // backgroundColor: Colors.white,
          title: Text('Ranking',style: TextStyle(color: Colors.black),),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(child: Text('Regional',
                style
                    : TextStyle(color: Colors.black),),),
              Tab(child: Text('Global',
                style: TextStyle(color: Colors.black),))
            ],
          ),
        ),

        body: TabBarView(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.all(10),
            child: Scaffold(
              body: SafeArea(
                child: ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context,i){
                      return Container(
                        height: 80,
                        child: Card(
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Text('$i',style: TextStyle(fontSize: 30,
                                  color: Colors.amber),),
                              SizedBox(width:20),
                              Icon(Icons.alarm),
                              Column(children: [
                                SizedBox(height: 10,),
                                Text('@user')
                              ],),
                              SizedBox(width: 100,),

                              Text('total number',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 20),)

                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
          SafeArea(
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context,i){
                  return Container(
                    height: 80,
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('$i',style: TextStyle(fontSize: 30,
                              color: Colors.amber),),
                          SizedBox(width:20),
                          Icon(Icons.alarm),
                          Column(children: [
                            SizedBox(height: 10,),
                            Text('@user')
                          ],),
                          SizedBox(width: 100,),

                          Text('total number',
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 20),)

                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],),

      ),

    );
  }
}
