import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:elibrary/pengembalian.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'peminjaman.dart';
import 'add_book.dart';
import 'pengembalian.dart';
import 'edit_profile.dart';

class DashboardPage extends StatefulWidget {
  String email;
  DashboardPage({@required this.email});
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _index = 0;
  final HomePage _homePage = new HomePage();
  final Peminjaman _peminjaman = new Peminjaman();
  final AddPage _addPage = new AddPage();
  final Pengembalian _pengembalian = new Pengembalian();
  final ProfilePage _profilePage = new ProfilePage();
  Widget _pageAwal = HomePage();
  Widget _pageChoose(int page) {
    switch (page) {
      case 0:
        return _homePage;
        break;
      case 1:
        return _peminjaman;
        break;
      case 2:
        return _addPage;
        break;
      case 3:
        return _pengembalian;
        break;
      case 4:
        return _profilePage;
        break;
      default:
        return new Container(
          child: Center(
            child: Text('Page Not Found ! '),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _pageAwal,
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CurvedNavigationBar(
        index: _index,
        color: Colors.white,
        backgroundColor: Colors.transparent, //Color(0xFF398AE5),
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
        onTap: (int tapped) {
          setState(() {
            _pageAwal = _pageChoose(tapped);
          });
        },
      ),
    );
  }
}
