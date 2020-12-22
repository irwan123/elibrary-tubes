import 'package:flutter/material.dart';

class Items1 extends StatelessWidget {
  Items item1 = new Items(
      title: "Calendar",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img:
          "https://cdn2.iconfinder.com/data/icons/flat-design-icons-set-2/256/book_handbook_manual_bible-512.png");

  Items item2 = new Items(
    title: "Groceries",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img:
        "https://cdn2.iconfinder.com/data/icons/flat-design-icons-set-2/256/book_handbook_manual_bible-512.png",
  );
  Items item3 = new Items(
    title: "Locations",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img:
        "https://cdn2.iconfinder.com/data/icons/flat-design-icons-set-2/256/book_handbook_manual_bible-512.png",
  );
  Items item4 = new Items(
    title: "Activity",
    subtitle: "Rose favirited your Post",
    event: "",
    img:
        "https://cdn2.iconfinder.com/data/icons/flat-design-icons-set-2/256/book_handbook_manual_bible-512.png",
  );
  Items item5 = new Items(
    title: "Activity",
    subtitle: "Rose favirited your Post",
    event: "",
    img:
        "https://cdn2.iconfinder.com/data/icons/flat-design-icons-set-2/256/book_handbook_manual_bible-512.png",
  );
  Items item6 = new Items(
    title: "Activity",
    subtitle: "Rose favirited your Post",
    event: "",
    img:
        "https://cdn2.iconfinder.com/data/icons/flat-design-icons-set-2/256/book_handbook_manual_bible-512.png",
  );
  Items item7 = new Items(
    title: "Activity",
    subtitle: "Rose favirited your Post",
    event: "",
    img:
        "https://cdn2.iconfinder.com/data/icons/flat-design-icons-set-2/256/book_handbook_manual_bible-512.png",
  );
  Items item8 = new Items(
    title: "Activity",
    subtitle: "Rose favirited your Post",
    event: "",
    img:
        "https://cdn2.iconfinder.com/data/icons/flat-design-icons-set-2/256/book_handbook_manual_bible-512.png",
  );
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8,
    ];
    return Flexible(
      child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          children: myList.map((data) {
            return Container(
              height: 100,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 110,
                    height: 100,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        children: <Widget>[
                          Image.network(data.img),
                          Positioned(
                            left: 140,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      3.0), //Color(0xff0F0F0F),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                    )
                                  ]),
                              child: Center(
                                child: Text(
                                  data.title,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}
