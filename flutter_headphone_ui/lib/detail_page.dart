import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final heroTag;
  final productName;
  final String price;

  const DetailPage({Key key, this.heroTag, this.productName, this.price})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(88, 188, 243, 1),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Center(
                child: ClipPath(
                  clipper: backgroundClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Hero(
                            tag: widget.heroTag,
                            child: Image.asset(
                              widget.heroTag,
                              height: 230,
                              width: 200,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AnimatedContainer(
                                child: Icon(Icons.wifi, color: Colors.white),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(16, 39, 112, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 50,
                                width: 50,
                                duration: Duration(seconds: 1),
                              ),
                              AnimatedContainer(
                                child:
                                    Icon(Icons.bluetooth, color: Colors.white),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(16, 39, 112, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 50,
                                width: 50,
                                duration: Duration(seconds: 1),
                              ),
                              AnimatedContainer(
                                child: Icon(Icons.battery_full,
                                    color: Colors.white),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(16, 39, 112, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 50,
                                width: 50,
                                duration: Duration(seconds: 1),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(widget.productName,
                            style: TextStyle(
                                color: Color.fromRGBO(16, 39, 112, 1),
                                fontFamily: "montserrat",
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text(
                            "Equipped with high power bass drivers, and with padded headband and earcups, this pair of JBL headphones brings together performance and comfort. ",
                            style: TextStyle(
                                color: Color.fromRGBO(16, 39, 112, 0.8),
                                fontFamily: "montserrat",
                                fontSize: 15,
                                fontWeight: FontWeight.w500))
                      ]),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(16, 39, 112, 1),
                      fontSize: 20),
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(16, 39, 112, 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Icon(Icons.shopping_cart, color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class backgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.27);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
