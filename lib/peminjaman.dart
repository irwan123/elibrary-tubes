import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dashboard.dart';
import 'pengembalian.dart';

class Pengembalianbuku {
  final String id_pengembalian;
  final String id_buku;
  final String id_peminjaman;
  final String image;
  final String judul_buku;

  Pengembalianbuku({
    this.id_pengembalian,
    this.id_buku,
    this.id_peminjaman,
    this.image,
    this.judul_buku,
  });

  factory Pengembalianbuku.fromJson(Map<String, dynamic> json) {
    return Pengembalianbuku(
      id_pengembalian: json['id_pengembalian'],
      id_peminjaman: json['id_peminjaman'],
      id_buku: json['id_buku'],
      image: json['image'],
      judul_buku: json['judul_buku'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id_pengembalian': id_pengembalian,
        'id_peminjaman': id_peminjaman,
        'id_buku': id_buku,
        'image': image,
        'judul_buku': judul_buku,
      };
}

class Peminjaman extends StatefulWidget {
  final Pengembalianbuku pengembalian;
  final String id;
  String stok;
  Peminjaman({@required this.pengembalian, this.id, this.stok});
  @override
  _PeminjamanState createState() => _PeminjamanState();
}

class _PeminjamanState extends State<Peminjaman> {
  final db = FirebaseFirestore.instance;

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
          title: Text('List Peminjaman Buku',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Poppins-Medium")),
          backgroundColor: Color(0xFF61A4F1),
        ),
        backgroundColor: Color(0xFF73AEF5),
        body: StreamBuilder(
            stream: db
                .collection('peminjaman')
                .orderBy('id_peminjaman')
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
                      height: 300,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              document['judul_buku'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
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
                          SizedBox(
                            height: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 170),
                            child: InkWell(
                              child: Container(
                                width: 130,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey[600],
                                    borderRadius: BorderRadius.circular(6.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color(0xFF6078ea).withOpacity(.3),
                                          offset: Offset(0.0, 8.0),
                                          blurRadius: 8.0)
                                    ]),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      String randomMillis = DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString();
                                      Pengembalianbuku pengembalian =
                                          Pengembalianbuku(
                                              id_pengembalian: widget.id != null
                                                  ? widget.pengembalian
                                                      .id_pengembalian
                                                  : randomMillis,
                                              id_peminjaman:
                                                  document['id_peminjaman']
                                                      .toString(),
                                              id_buku: document['id_buku']
                                                  .toString(),
                                              image:
                                                  document['image'].toString(),
                                              judul_buku:
                                                  document['judul_buku']);
                                      if (widget.pengembalian == null) {
                                        FirebaseFirestore.instance
                                            .collection('pengembalian')
                                            .add(pengembalian.toJson());
                                      } else {
                                        FirebaseFirestore.instance
                                            .collection('pengembalian')
                                            .doc(widget.id)
                                            .update(pengembalian.toJson());
                                      }
                                      await db
                                          .collection('peminjaman')
                                          .doc(document.id)
                                          .delete();
                                      await db
                                          .collection('item')
                                          .doc(document['id_buku'])
                                          .get()
                                          .then((DocumentSnapshot
                                              documentsnapshot) {
                                        widget.stok = documentsnapshot
                                            .data()['stok']
                                            .toString();
                                      });
                                      print(widget.stok);
                                      int nilai = int.parse(widget.stok);
                                      nilai = nilai + 1;
                                      await db
                                          .collection('item')
                                          .doc(document['id_buku'])
                                          .update({
                                        'stok': nilai,
                                      });

                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Pengembalian()));
                                    },
                                    child: Center(
                                      child: Text("Kembalikan",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 15,
                                              letterSpacing: 1.0)),
                                    ),
                                  ),
                                ),
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
