import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  final title,desc;

  const FoodTile({this.title, this.desc});
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Container(
      height: _height / 3,
      width: _width,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            height: _height / 2.5,
            width: _width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: _height * 0.05),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15)),
                  height: _height / 4,
                  width: _width,
                  child: Row(
                    children: [
                      Container(
                        width: _width / 2,
                        height: _height / 2,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                margin: EdgeInsets.only(top: _height * 0.02),
                                height: _height * 0.03,
                                width: _width / 3,
                                child: Center(child: Text("Starter")),
                              ),
                              Text(title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                            (desc) ?  Text(
                                  "chilli potato recipe | aloo chilli recipe | potato chilli | aalu chilli with detailed photo and video recipe. ") : Container()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 200,
          bottom: 2,
          top: 10,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new AssetImage("assets/chilli.jpg"))),
            height: _height * 0.40,
            width: _width * 0.40,
          ),
        ),
      ]),
    );
  }
}
