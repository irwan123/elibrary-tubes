import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Item {
  final String id;
  final String judul;
  final String stok;
  final String image;
  final String desc;

  Item({
    this.id,
    this.judul,
    this.stok,
    this.image,
    this.desc,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      judul: json['judul'],
      stok: json['stok'],
      image: json['image'],
      desc: json['desc'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'judul': judul,
        'stok': stok,
        'image': image,
        'desc': desc,
      };
}

class AddPage extends StatefulWidget {
  final Item item;
  final String id;

  AddPage({@required this.item, this.id});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController judulController;
  TextEditingController descController;
  TextEditingController imageController;
  TextEditingController stokController;
  File image;

  @override
  void initState() {
    judulController = TextEditingController();
    descController = TextEditingController();
    imageController = TextEditingController();
    stokController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xFF73AEF5),
          Color(0xFF61A4F1),
          Color(0xFF478DE0),
          Color(0xFF398AE5)
        ])),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Form Add New Book",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: "Poppins-Bold"),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                children: [
                  Container(
                    height: 150,
                    child: Center(
                      child: InkWell(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: image != null
                              ? FileImage(image)
                              : widget.item != null
                                  ? widget.item.image.isNotEmpty
                                      ? NetworkImage(widget.item.image)
                                      : AssetImage('images/books.png')
                                  : AssetImage('images/books.png'),
                        ),
                        onTap: () {
                          getImage(context);
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 345,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: judulController,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Judul Buku',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: descController,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Deskripsi',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: stokController,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Stok',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF17ead9),
                                    Color(0xFF6078ea)
                                  ]),
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
                                    Item item = Item(
                                        id: widget.item != null
                                            ? widget.item.id
                                            : randomMillis,
                                        judul: judulController.text,
                                        stok: stokController.text,
                                        image: image != null
                                            ? widget.item != null
                                                ? await uploadFile(
                                                    image, widget.id)
                                                : await uploadFile(
                                                    image, randomMillis)
                                            : '',
                                        desc: descController.text);
                                    if (widget.item == null) {
                                      FirebaseFirestore.instance
                                          .collection('item')
                                          .add(item.toJson());
                                    } else {
                                      FirebaseFirestore.instance
                                          .collection('item')
                                          .doc(widget.id)
                                          .update(item.toJson());
                                    }
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => AddPage()));
                                  },
                                  child: Center(
                                    child: Text("Add Book",
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  imgFromCamera() async {
    PickedFile imgCamera = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      image = File(imgCamera.path);
    });
  }

  imgFromGallery() async {
    PickedFile imgGallery = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      image = File(imgGallery.path);
    });
  }

  getImage(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gallery'),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String> uploadFile(File image, String filename) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("item/" + filename);
    UploadTask uploadTask = ref.putFile(image);
    return uploadTask.then((res) async {
      return await res.ref.getDownloadURL();
    });
  }
}
