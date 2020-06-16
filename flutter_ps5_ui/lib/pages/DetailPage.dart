import 'package:flutter/material.dart';

import 'HomePage.dart';

class DetailPage extends StatefulWidget {
  final String imgUrl;

  const DetailPage({Key key, this.imgUrl}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: ActionBar("assets/logo.png", shadowDark, white, black),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 18),
                            child: Image.asset(
                              "assets/dualsense.png",
                              alignment: Alignment.bottomCenter,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Hero(
                              tag: widget.imgUrl,
                              child: Image.asset(
                                widget.imgUrl,
                                height: 230,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Features(Icons.mic, "Build in Microphone"),
                            Features(Icons.headset_mic, "Headset Jack"),
                            Features(Icons.wifi, "Build in wifi0"),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Container(
                        height: 80,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          boxShadow: shadow,
                          color: blue,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(46, 112, 226, 1),
                              ),
                              child: Text(
                                "\$70",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Buy Now",
                                style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Features extends StatelessWidget {
  final IconData icon;
  final String title;

  const Features(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.all(20),
      height: 140,
      width: 140,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(3, 3),
              color: white,
            ),
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 0,
              offset: Offset(1, 1),
              color: white,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: blue,
            size: 50,
          ),
          Text(
            "$title",
            style: TextStyle(color: black, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
