import 'package:flutter/material.dart';

import 'feature_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(16, 39, 112, 1),
      body: Stack(
        children: [
          Menu(context),
          FeaturePage(),
        ],
      ),
    );
  }

  Widget Menu(context) {
    TextStyle textStyle = TextStyle(
        fontFamily: "montserrat",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white);
    return Container(
      color: Color.fromRGBO(16, 39, 112, 1),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 75,
                    child: ClipOval(
                      child: Image.network(
                          "https://images.unsplash.com/photo-1588354349271-4b6d3fef4a31?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Hello,",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white38,
                      fontFamily: "montserrat",
                      fontSize: 22),
                ),
                Text(
                  "Kisan",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "montserrat",
                      fontSize: 30),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.home, color: Colors.white),
                    SizedBox(width: 10),
                    Text("Home", style: textStyle),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Profile",
                      style: textStyle,
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.account_balance_wallet, color: Colors.white),
                    SizedBox(width: 10),
                    Text("Wallet", style: textStyle)
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.shopping_cart, color: Colors.white),
                    SizedBox(width: 10),
                    Text("My Cart", style: textStyle)
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.star_border, color: Colors.white),
                    SizedBox(width: 10),
                    Text("Favorites", style: textStyle)
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.settings, color: Colors.white),
                    SizedBox(width: 10),
                    Text("Settings", style: textStyle)
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.exit_to_app, color: Colors.white),
                SizedBox(width: 10),
                Text("Logout", style: textStyle)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
