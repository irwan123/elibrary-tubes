import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'ItemsHome1.dart';

class HomePage extends StatefulWidget {
  String user;
  HomePage({@required this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 3),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xFF73AEF5),
          Color(0xFF61A4F1),
          Color(0xFF478DE0),
          Color(0xFF398AE5)
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35, top: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "E-Library",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins-Bold",
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.user,
                    style: TextStyle(
                        color: Colors.white54,
                        fontFamily: "Poppins-Medium",
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 3, top: 2),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[600],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 10.0),
                            blurRadius: 15.0,
                          )
                        ]),
                    child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 4),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hintText: "Search Books",
                            hintStyle: TextStyle(color: Colors.white30),
                            border: InputBorder.none)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 170),
                    child: Text(
                      "Popular Books :",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins-Bold",
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Items1(),
            SizedBox(
              height: 285,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 195),
                    child: Text(
                      "List Books :",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins-Bold",
                          fontSize: 20),
                    ),
                  ),
                  Items1(),
                  SizedBox(
                    height: 135,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Color(0xFF398AE5),
        height: 60,
        buttonBackgroundColor: Colors.white,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.list,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.add_box,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.cached,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.person,
            size: 20,
            color: Colors.black,
          )
        ],
        onTap: (index) {},
      ),
    );
  }
}
