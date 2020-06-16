import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var date = DateTime.now();
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        elevation: 0,
        title: Text("Todo"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 35, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 75,
              child: ClipOval(
                child: Image.network(
                    "https://images.unsplash.com/photo-1506919258185-6078bba55d2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1415&q=80"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hello, Kisan.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Looks like feel good.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15.0,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              "You have 3 task to do today.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15.0,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 50),
            Text(
              "TODAY : " +
                  date.day.toString() +
                  " / " +
                  date.month.toString() +
                  " / " +
                  date.year.toString(),
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15.0,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(

                controller: pageController,
                children: [
                  TodoCard(Colors.red),
                  TodoCard(Colors.pink),
                  TodoCard(Colors.red),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget TodoCard(MaterialColor color) {
    return Container(
      height: 50,
      width: 100,
      color: color,
    );
  }
}
