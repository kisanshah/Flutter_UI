import 'package:flutter/material.dart';
import 'package:flutter_ps5_ui/pages/DetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Color black = Color.fromRGBO(33, 38, 46, 1);
Color white = Color.fromRGBO(238, 242, 250, 1);
Color blue = Color.fromRGBO(65, 135, 255, 1);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Column(
              children: [
                ActionBar("assets/logoblack.png", shadow, black, white),
                SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ItemCard("assets/ps_5.png", "Game Console",
                        "Playstation 5 Digital Edition"),
                    ItemCard(
                        "assets/ps_5_2.png", "Game Console", "Playstation 5"),
                    ItemCard("assets/controller.png", "Game Controller",
                        "DualSense Wireless Controller"),
                    ItemCard("assets/headset.png", "Audio and Communication",
                        "Wireless Headset"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              boxShadow: shadowDark,
              color: black,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.home,
              size: 30,
              color: white,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: black,
              boxShadow: shadowDark,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.search,
              size: 30,
              color: white,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: black,
              boxShadow: shadowDark,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.supervised_user_circle,
              size: 30,
              color: white,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: black,
              boxShadow: shadowDark,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.shopping_cart,
              size: 30,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final String imgPath, text1, text2;

  const ItemCard(this.imgPath, this.text1, this.text2);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 750),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: active ? blue : white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(2, 2),
                ),
              ]),
          width: 170,
          height: 275,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            imgUrl: widget.imgPath,
                          )));
            },
            child: Column(
              children: [
                Hero(
                  tag: widget.imgPath,
                  child: Image.asset(
                    widget.imgPath,
                    alignment: Alignment.bottomCenter,
                    height: 165,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "$widget.text1\n",
                          style: TextStyle(
                              color: black, fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: "$widget.text2",
                          style: TextStyle(
                              color: active ? white : blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            active ? Icons.favorite : Icons.favorite_border,
            color: active ? white : black.withOpacity(0.5),
          ),
          onPressed: () {
            setState(() {
              active = !active;
            });
          },
        )
      ],
    );
  }
}

List<BoxShadow> shadow = [
  BoxShadow(
    spreadRadius: 1,
    blurRadius: 15,
    offset: Offset(5, 5),
    color: Colors.white,
  ),
  BoxShadow(
    spreadRadius: 1,
    blurRadius: 15,
    offset: Offset(-5, -5),
    color: Colors.white,
  ),
];
List<BoxShadow> shadowDark = [
  BoxShadow(
    spreadRadius: 1,
    blurRadius: 15,
    offset: Offset(5, 5),
    color: Colors.grey[900],
  ),
  BoxShadow(
    spreadRadius: 1,
    blurRadius: 15,
    offset: Offset(-5, -5),
    color: Colors.grey[900],
  ),
];

class ActionBar extends StatelessWidget {
  final String imgPath;
  final Color primary, background;
  final List<BoxShadow> shadow;

  const ActionBar(this.imgPath, this.shadow, this.primary, this.background);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(15),
                boxShadow: shadow,
              ),
              child: Icon(Icons.menu, color: primary)),
          Image.asset(
            imgPath,
            width: 150,
          ),
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(15),
                boxShadow: shadow,
              ),
              child: Icon(Icons.settings, color: primary))
        ],
      ),
    );
  }
}
