import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/dashboard.dart';
import 'package:flutter/material.dart';

class DetailBookPage extends StatefulWidget {
  final DocumentSnapshot detail_buku;
  DetailBookPage({this.detail_buku});

  @override
  _DetailBookPageState createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.detail_buku.data()['judul']),
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DashboardPage()));
            },
          ),
        ),
        body: SizedBox.expand(
          child: Container(
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
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.detail_buku.data()['image'],
                      height: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 50),
                  child: Text(
                    widget.detail_buku['desc'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 160),
                  child: Text(
                    'Stok : ' + widget.detail_buku['stok'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: InkWell(
                    child: Container(
                      width: 300,
                      height: 50,
                      color: Colors.red[300],
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {},
                          child: Center(
                            child: Text("Pinjam Buku",
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
                )
              ],
            ),
          ),
        ));
  }
}
