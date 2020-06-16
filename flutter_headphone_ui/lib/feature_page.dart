import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_headphone_ui/detail_page.dart';

class FeaturePage extends StatefulWidget {
  @override
  _FeaturePageState createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = false;
  double screenWidth, screenHeight;
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Transform.translate(
      offset: isCollapsed ? Offset(200, 100) : Offset(0, 0),
      child: Transform.rotate(
        angle: isCollapsed ? 270 : 0,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: 0,
            bottom: 0,
            left: isCollapsed ? 0 : 0.6 * screenWidth,
            right: isCollapsed ? 0 : -0.4 * screenWidth,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(isCollapsed ? 20 : 0)),
                  color: Color.fromRGBO(28, 127, 200, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              isCollapsed = !isCollapsed;
                              if (isCollapsed) {
                                _controller.forward();
                              } else {
                                _controller.reverse();
                              }
                            });
                          },
                        ),
                        actions: [Icon(Icons.search)],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Featured",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "montserrat",
                            fontSize: 25),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Collections",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "montserrat",
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedContainer(
                              child: Icon(
                                Icons.settings,
                                color: Color.fromRGBO(16, 39, 112, 1),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 60,
                              width: 60,
                              duration: Duration(seconds: 1),
                            ),
                            AnimatedContainer(
                              child: Icon(Icons.headset, color: Colors.white),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(16, 39, 112, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 60,
                              width: 60,
                              duration: Duration(seconds: 1),
                            ),
                            AnimatedContainer(
                              child: Icon(
                                Icons.watch,
                                color: Color.fromRGBO(16, 39, 112, 1),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 60,
                              width: 60,
                              duration: Duration(seconds: 1),
                            ),
                            AnimatedContainer(
                              child: Icon(
                                Icons.gamepad,
                                color: Color.fromRGBO(16, 39, 112, 1),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 60,
                              width: 60,
                              duration: Duration(seconds: 1),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: PageView(
                          controller: PageController(viewportFraction: 0.8),
                          children: [
                            buildItem("assets/headphone1.png", "Crystal Blue",
                                "\$120", context),
                            buildItem("assets/headphone2.png", "Light Blue",
                                "\$150", context),
                          ],
                        ),
                      ),
                      Text("Latest Favorites",
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: "montserrat",
                            fontSize: 20,
                          )),
                      SizedBox(height: 10),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset("assets/headphone3.png")),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Desert Sand",
                                      style: TextStyle(
                                          color: Color.fromRGBO(16, 39, 112, 1),
                                          fontFamily: "montserrat",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "\n\$100",
                                      style: TextStyle(
                                          color: Color.fromRGBO(16, 39, 112, 1),
                                          fontFamily: "montserrat",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                ]),
                              ),
                              Icon(
                                Icons.favorite_border,
                                color: Color.fromRGBO(16, 39, 112, 1),
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

Widget buildItem(String imgPath, String productName, String price, context) {
  return Center(
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      productName: productName,
                      price: price,
                      heroTag: imgPath,
                    )));
      },
      child: Stack(
        children: [
          ClipPath(
            clipper: backgroundClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.6,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: imgPath,
                  child: Image.asset(
                    imgPath,
                    height: 200,
                    width: 200,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  productName,
                  style: TextStyle(
                      color: Color.fromRGBO(16, 39, 112, 1),
                      fontFamily: "montserrat",
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                          color: Color.fromRGBO(16, 39, 112, 1),
                          fontFamily: "montserrat",
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(16, 39, 112, 1),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

class backgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundness = 40.0;
    var path = Path();
    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundness);
    path.quadraticBezierTo(0, size.height, roundness, size.height);
    path.lineTo(size.width - 50, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundness);
    path.lineTo(size.width, roundness * 2);
    path.quadraticBezierTo(
        size.width, 0, size.width - roundness * 3, roundness * 2);
    path.lineTo(roundness, size.height * 0.40);
    path.quadraticBezierTo(0, size.height * 0.33 + roundness, 0,
        size.height * 0.33 + roundness * 2);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
