import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  String email;
  HomePage({@required this.email});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15, right: 10),
                  child: Text(
                    "E-Library Apps",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins-Bold",
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 35,
                    top: 10,
                    right: 35,
                  ),
                  child: Container(
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
                      child: Expanded(
                        child: TextFormField(
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
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, right: 140),
                  child: Text(
                    "New Books Realiese :",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins-Bold",
                        fontSize: 20),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      height: 200,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('item')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children:
                                  snapshot.data.docs.map<Widget>((document) {
                                return Card(
                                    semanticContainer: true,
                                    margin: EdgeInsets.only(
                                      left: 20,
                                      bottom: 10,
                                    ),
                                    child: Container(
                                      width: 180,
                                      color: Colors.white,
                                      padding: EdgeInsets.only(
                                        right: 10,
                                        left: 10,
                                        top: 20,
                                      ),
                                      child: Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                document['image'],
                                                height: 110,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text(
                                                document['judul'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Container(
                                                width: double.infinity,
                                                child: Text(
                                                  document['desc'],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                              }).toList(),
                            );
                          }),
                    )),
                Padding(
                  padding: EdgeInsets.only(right: 205),
                  child: Text(
                    "List Books  :",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins-Bold",
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                top: 90,
              ),
              child: Expanded(
                child: DraggableScrollableSheet(builder: (context, controller) {
                  return Container(
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('item')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Container(
                              child: ListView(
                            controller: controller,
                            scrollDirection: Axis.vertical,
                            children:
                                snapshot.data.docs.map<Widget>((document) {
                              return Card(
                                margin: EdgeInsets.only(
                                    right: 20, left: 20, bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://png.pngtree.com/thumb_back/fw800/back_our/20190620/ourmid/pngtree-blue-flat-gradient-background-promotion-main-map-image_161946.jpg'))),
                                  padding: EdgeInsets.only(
                                    right: 10,
                                    left: 10,
                                    top: 20,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          document['image'],
                                          height: 219,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                          document['judul'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Container(
                                          width: double.infinity,
                                          child: Text(
                                            "Stok : " + document['stok'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ));
                        }),
                  );
                }),
              ),
            )
          ],
        ),
      )),
    );
  }
}
