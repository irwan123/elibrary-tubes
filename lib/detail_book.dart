import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/dashboard.dart';
import 'package:flutter/material.dart';
import 'peminjaman.dart';
import 'loading.dart';
import 'package:intl/intl.dart';

class DetailBookPage extends StatefulWidget {
  final String judul, desc, image, stok, id, id_buku, tgl_kembali, tgl_pinjam;
  DetailBookPage(
      {this.judul,
      this.desc,
      this.image,
      this.stok,
      this.id,
      this.id_buku,
      this.tgl_kembali,
      this.tgl_pinjam});
  @override
  _DetailBookPageState createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  void _addData() {
    String randomMillis = DateTime.now().millisecondsSinceEpoch.toString();
    String id = randomMillis;
    FirebaseFirestore.instance.runTransaction((Transaction transsaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('peminjaman');
      await reference.add({
        'judul_buku': widget.judul,
        'id_peminjaman': id,
        'id_buku': widget.id,
        'image': widget.image,
        'tgl_kembali': date.toString(),
        'tgl_pinjam': now.toString(),
      });
    });
  }

  void _ubahData() {
    int nilai = int.parse(widget.stok);
    nilai = nilai - 1;
    FirebaseFirestore.instance.runTransaction((Transaction transsaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('item');
      await reference.doc(widget.id).update({
        'stok': nilai,
      });
    });
  }

  DateTime date = DateTime.now();
  DateTime now = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    String format = DateFormat('d-MM-yyyy').format(date);
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text("Detail Buku"),
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
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
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
                          widget.image,
                          height: 200,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        widget.judul,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins-Bold",
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Text(
                        widget.desc,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins-Regular",
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 210),
                      child: Text(
                        'Stok : ' + widget.stok,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 30, left: 30),
                        child: Row(children: <Widget>[
                          FlatButton.icon(
                            height: 45,
                            color: Colors.red[300],
                            label: Text(
                              "Pengembalian     : ",
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: Icon(
                              Icons.calendar_today_sharp,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              selectTimePicker(context);
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$format',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ])),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: InkWell(
                        child: Container(
                          width: 300,
                          height: 50,
                          color: Colors.red[300],
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                setState(() => loading = true);
                                _addData();
                                _ubahData();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Peminjaman()));
                              },
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
