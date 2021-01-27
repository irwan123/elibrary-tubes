import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Peminjaman extends StatefulWidget {
  @override
  _PeminjamanState createState() => _PeminjamanState();
}

class _PeminjamanState extends State<Peminjaman> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pesanan Buku',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Poppins-Medium")),
          backgroundColor: Color(0xFF61A4F1),
        ),
        backgroundColor: Color(0xFF73AEF5),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('item').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                scrollDirection: Axis.vertical,
                children: snapshot.data.docs.map<Widget>((document) {
                  return Card(
                    margin: EdgeInsets.only(
                        right: 20, left: 20, top: 10, bottom: 10),
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
                              height: 224,
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
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }));
  }
}
