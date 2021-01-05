import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Carousel(
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.black38,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.transparent,
              dotVerticalPadding: 5.0,
              dotPosition: DotPosition.bottomRight,
              images: [
                Image.asset(
                  "images/books_user1.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "images/books_user2.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "images/books_user3.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "images/books_user4.png",
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '“Great books help you understand, and they help you feel understood.” — John Green',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey[700],
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36)),
                    color: Colors.blueAccent,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36)),
                    color: Colors.blueAccent,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
