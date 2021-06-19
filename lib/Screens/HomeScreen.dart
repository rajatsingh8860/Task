import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receipe/Screens/DetailScreen.dart';
import 'package:receipe/Screens/FoodTile.dart';
import 'package:receipe/Service/ApiService.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();

  Stream productsByVariableStream() async* {
    while (true) {
      await Future.delayed(Duration(milliseconds: 500));
      var a = await apiService.fetchCategory();
      yield a;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(Icons.menu, color: Colors.grey[400]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.search,
                color: Colors.grey[400],
              ),
            )
          ],
        ),
        body: Container(
          height: _height,
          width: _width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: _height * 0.10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Buddha Bowls",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: _height * 0.75,
                child: StreamBuilder(
                    stream: productsByVariableStream(),
                    builder: (context, snapshot) {
                      return (!snapshot.hasData)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              height: _height,
                              width: _width,
                              color: Colors.white,
                              child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              CupertinoPageRoute(
                                                  builder: (context) {
                                            return DetailScreen();
                                          }));
                                        },
                                        child: FoodTile(
                                          title: snapshot.data[index]["title"],
                                          desc: true,
                                        ));
                                  }));
                    }),
              ),
            ],
          ),
        ));
  }
}
