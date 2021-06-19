import 'package:flutter/material.dart';
import 'package:receipe/Screens/FoodTile.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var counter = 0;

  Widget childWidget() {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Container(
            width: mWidth,
            height: mHeight * 0.90,
            child: Column(
              children: [
                FoodTile(title: "Chilli Potato", desc: false),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Order"), Text("Rs.200")],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Delivery"), Text("Rs.50")],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rs.250",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: mHeight * 0.01),
                    width: mWidth / 1.2,
                    height: mHeight * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      "Add to cart",
                      style: TextStyle(color: Colors.white),
                    ))),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: _height / 3,
                        width: _width,
                        child: Positioned(
                          top: 0,
                          bottom: 100,
                          left: 150,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        new AssetImage("assets/chilli.jpg"))),
                            height: _height * 0.50,
                            width: _width * 0.50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          "Chilli potato",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: _width,
                        margin: EdgeInsets.only(top: _height * 0.02),
                        child: Text(
                            "Chilli potato is a starter snack and can be served as it is without any side or accompaniment."),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _height * 0.05),
                        child: Text(
                          "Whats in it ? ",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: _width,
                        margin: EdgeInsets.only(top: _height * 0.02),
                        child: Text(
                            "I make this chilli potato and schezwan chilli potatoes on occasion. Preparing Chilli potato is similar to making Chilli paneer, chilli mushroom or chilli gobi.The best point of these recipes is that you can increase or decrease the amount of sauces and spices that go into it. So you can have a less spicy or a more spicy version of the same recipe. Thereby tailoring these recipes to suit your family’s taste buds."),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _height * 0.05),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.plus_one),
                              onPressed: () {
                                setState(() {
                                  counter = counter + 1;
                                });
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(counter.toString()),
                                  )),
                            ),
                            Container(
                              child: IconButton(
                                icon: Icon(Icons.exposure_minus_1),
                                onPressed: () {
                                  if (counter > 0) {
                                    setState(() {
                                      counter = counter - 1;
                                    });
                                  }
                                },
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: _width / 2.5),
                                child: Text("Rs.200"))
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      return showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          context: context,
                          builder: (builder) {
                            return childWidget();
                          });
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: _height * 0.05),
                        width: _width / 1.2,
                        height: _height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          "Add to cart",
                          style: TextStyle(color: Colors.white),
                        ))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
