import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'home.dart';
import 'slider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userControl = new TextEditingController();
  TextEditingController passControl = new TextEditingController();
  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Container(
          width: ScreenUtil().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: true);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Image.asset("images/books.png"),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 40.0),
                child: Text(
                  "E-Library Apps",
                  style: TextStyle(
                      fontFamily: "Poppins-Bold",
                      fontSize: ScreenUtil().setSp(46),
                      letterSpacing: .6,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil().setHeight(325),
                  ),
                  Container(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(500),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -10.0),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          top: 16.0,
                        ),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Sign In",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(60),
                                    fontFamily: "Poppins-Bold",
                                    letterSpacing: .6,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                height: ScreenUtil().setHeight(40),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15.0)),
                                controller: userControl,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(40),
                              ),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15.0)),
                                controller: passControl,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(40),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("Forgot Password ?",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                  fontFamily: "Poppins-Medium")),
                        ],
                      ),
                      InkWell(
                        child: Container(
                          width: ScreenUtil().setWidth(330),
                          height: ScreenUtil().setHeight(100),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF17ead9),
                                Color(0xFF6078ea)
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                if (userControl.text == 'irwanrham' &&
                                    passControl.text == '123') {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                              user: userControl.text,
                                            )),
                                  );
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Container(
                                            height: 200,
                                            child: Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  TextField(
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            "Inccorect Username or Password !"),
                                                  ),
                                                  SizedBox(
                                                    width: 320.0,
                                                    child: RaisedButton(
                                                      color:
                                                          Colors.redAccent[400],
                                                      onPressed: () {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        LoginPage()));
                                                      },
                                                      child: Text(
                                                        "Okay",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }
                              },
                              child: Center(
                                child: Text("SignIn",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                  text: '<Back',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SliderPage()),
                                      );
                                    }))),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 120),
                        child: Text(
                          "E-Libbrary Apps",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 10,
                              fontFamily: "Poppins-Bold"),
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
