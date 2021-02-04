import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dashboard.dart';

class Pengembalian extends StatefulWidget {
  @override
  _PengembalianState createState() => _PengembalianState();
}

class _PengembalianState extends State<Pengembalian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          title: Text('List Buku Yang Sudah Dikembalikan',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontFamily: "Poppins-Medium")),
          backgroundColor: Color(0xFF61A4F1),
        ),
        backgroundColor: Color(0xFF73AEF5),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('pengembalian')
                .orderBy('id_pengembalian')
                .snapshots(),
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
                      height: 280,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              document['judul_buku'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              document['image'],
                              height: 174,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Tanggal Pinjam : ' + document['tgl_pinjam'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
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
