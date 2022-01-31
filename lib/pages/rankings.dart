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
          backgroundColor: Colors.grey,
          title: Text('Ranking',style: TextStyle(color: Colors.black),),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: 200,
                height: 40,
                child: Center(child: Text('MAU',style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
              ),

              Tab(child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: 200,
                height: 40,
                child: Center(child: Text('Users by region',style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
              ),
            ],),
        ),

        body: TabBarView(children: [
          DefaultTabController(
              length: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.all(10),
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    bottom: TabBar(
                      tabs: [
                        Tab(child: Text('Regional',
                          style: TextStyle(color: Colors.black),),),
                        Tab(child: Text('Global',
                          style: TextStyle(color: Colors.black),))
                      ],
                    ),

                  ),
                  body: TabBarView(
                    children: [
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
                    ],
                  ),
                ),
              )
          ),








          //users by region
          SafeArea(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,i){
                  return Container(
                    margin: EdgeInsets.only(top: 15,left: 15,right: 15),
                    height: 80,
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('$i',style: TextStyle(fontSize: 30,
                              color: Colors.amber),),
                          SizedBox(width: 30),
                          Icon(Icons.alarm),
                          SizedBox(width: 50,),
                          Text('number of users',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)

                        ],
                      ),
                    ),
                  );
                }),
          )

        ],),
      ),
    );
  }
}
